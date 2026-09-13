import java.nio.file.*;
import java.util.*;
import java.util.function.*;
import net.minecraft.SharedConstants;
import net.minecraft.gametest.framework.*;
import net.minecraft.resources.*;
import net.minecraft.core.registries.Registries;
import net.minecraft.core.BlockPos;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.entity.*;
import net.minecraft.world.entity.ai.attributes.Attributes;
import net.minecraft.world.effect.MobEffects;
import net.minecraft.world.phys.Vec3;
import net.minecraft.nbt.NbtUtils;

class RunGiftRouteGameTest {
 static final String F="core:class/ability/alchemist/";
 static GameTestHelper h;
 static int checks;
 static List<String> bars=new ArrayList<>();
 public static void main(String[] args)throws Exception {
  SharedConstants.tryDetectVersion();
  TestFunctionLoader.registerLoader(new TestFunctionLoader(){
   public void load(BiConsumer<ResourceKey<Consumer<GameTestHelper>>,Consumer<GameTestHelper>> sink){
    sink.accept(ResourceKey.create(Registries.TEST_FUNCTION,Identifier.parse("test:alchemist")),RunGiftRouteGameTest::run);
   }
  });
  GameTestMainUtil.runGameTestServer(args,p->{});
 }
 static CommandSourceStack source(Entity e){var s=h.getLevel().getServer().createCommandSourceStack().withLevel(h.getLevel()).withSuppressedOutput();return e==null?s:s.withEntity(e).withPosition(e.position()).withRotation(e.getRotationVector());}
 static void cmd(Entity e,String c){h.getLevel().getServer().getCommands().performPrefixedCommand(source(e),c);}
 static void fn(Entity e,String p){cmd(e,"function "+F+p);}
 static int score(Entity e,String n){var b=h.getLevel().getScoreboard();var v=b.getPlayerScoreInfo(e,b.getObjective(n));return v==null?0:v.value();}
 static void set(Entity e,String n,int v){cmd(e,"scoreboard players set @s "+n+" "+v);}
 static void ok(boolean v,String m){if(!v)throw new IllegalStateException("ASSERT: "+m);checks++;System.out.println("CHECK "+m);}
 static void near(double a,double b,String m){ok(Math.abs(a-b)<0.002,m+" ("+a+")");}
 static String uuid(Entity e){return new net.minecraft.nbt.IntArrayTag(net.minecraft.core.UUIDUtil.uuidToIntArray(e.getUUID())).toString();}
 static void ticks(ServerPlayer p,int n){for(int i=0;i<n;i++){fn(p,"player_tick");p.baseTick();net.minecraft.advancements.CriteriaTriggers.TICK.trigger(p);}}
 static ServerPlayer mock(String name){
  var cookie=net.minecraft.server.network.CommonListenerCookie.createInitial(new com.mojang.authlib.GameProfile(UUID.randomUUID(),name),false);
  var server=h.getLevel().getServer();
  var player=new ServerPlayer(server,h.getLevel(),cookie.gameProfile(),cookie.clientInformation());
  var connection=new net.minecraft.network.Connection(net.minecraft.network.protocol.PacketFlow.SERVERBOUND){
   @Override public void send(net.minecraft.network.protocol.Packet<?> packet,io.netty.channel.ChannelFutureListener listener,boolean flush){
    if(packet instanceof net.minecraft.network.protocol.game.ClientboundSetActionBarTextPacket bar)bars.add(bar.text().getString());
    super.send(packet,listener,flush);
   }
  };
  new io.netty.channel.embedded.EmbeddedChannel(connection);
  server.getPlayerList().placeNewPlayer(connection,player,cookie);
  player.setGameMode(net.minecraft.world.level.GameType.SURVIVAL);
  return player;
 }
 static void run(GameTestHelper helper){
 h=helper;
 try{
 cmd(null,"function test:setup");var p=mock("GiftTester");Vec3 pos=Vec3.atBottomCenterOf(h.absolutePos(new BlockPos(2,3,2)));p.setPos(pos.add(4,0,0));p.setNoGravity(true);fn(p,"player_init");set(p,"class",3);set(p,"alch.pas3",2);set(p,"pot.sswap",0);cmd(p,"attribute @s luck base set 20");
 var e=h.spawnWithNoFreeWill(EntityType.ZOMBIE,new BlockPos(2,3,2));e.setNoGravity(true);e.addTag("EnemyInInit");
 cmd(e,"execute at @s rotated ~ 0 anchored eyes positioned ^ ^100 ^0.00001 summon armor_stand run function operation:event/enemy/on_death/init");e.removeTag("EnemyInInit");
 h.runAfterDelay(4,()->{try{
 ok(e.getPassengers().size()==1,"enemy has real death callback passenger");System.out.println("DEATH_CARRIER "+e.getPassengers().getFirst().position()+" enemy="+e.position());
 cmd(e,"kill @s");
 h.runAfterDelay(25,()->{try{
 var gifts=h.getLevel().getEntities(p,p.getBoundingBox().inflate(128),a->a.entityTags().contains("alch.gift") && a.isAlive());
 ok(gifts.size()==1,"actual death callback creates one gift");var gift=gifts.getFirst();System.out.println("GIFT_POS "+gift.position()+" death="+pos);
 ok(gift.position().distanceTo(pos)<3,"gift spawns near actual death position");p.setPos(gift.position());
 h.runAfterDelay(3,()->{try{
 ok(!gift.isAlive(),"walking into real gift removes it");ok(score(p,"alch.gifts")==1,"walking into real gift adds one stack");near(p.getAttributeValue(Attributes.LUCK),21.4,"real gift adds level II defence");
 
 for(int i=0;i<5;i++){
  cmd(p,"execute positioned ~ ~100 ~ summon armor_stand run function core:class/ability/alchemist/7/set");
  var drops=h.getLevel().getEntities(p,p.getBoundingBox().inflate(3),a->a.entityTags().contains("alch.gift")&&a.isAlive());
  for(var d:drops)d.baseTick();
 }
 ok(score(p,"alch.gifts")==5,"repeated real pickups at full health accumulate to five");near(p.getAttributeValue(Attributes.LUCK),27,"five actual gifts provide thirty-five percent defence");
 set(p,"alch.gifts",1);fn(p,"7/refresh");
 p.setHealth(18);fn(p,"player_tick");p.baseTick();net.minecraft.advancements.CriteriaTriggers.TICK.trigger(p);
 h.runAfterDelay(3,()->{try{near(p.getHealth(),19,"gift healing completes through real entity ticks");ok(score(p,"alch.gifts")==0,"real healing consumes one layer");System.out.println("GIFT_ROUTE_PASS checks="+checks);h.succeed();}catch(Throwable t){h.fail(net.minecraft.network.chat.Component.literal(t.toString()));}});
 }catch(Throwable t){h.fail(net.minecraft.network.chat.Component.literal(t.toString()));}});
 }catch(Throwable t){h.fail(net.minecraft.network.chat.Component.literal(t.toString()));}});
 }catch(Throwable t){h.fail(net.minecraft.network.chat.Component.literal(t.toString()));}});
 }catch(Throwable t){h.fail(net.minecraft.network.chat.Component.literal(t.toString()));}
 }
}
