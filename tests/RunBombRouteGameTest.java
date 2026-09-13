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

class RunBombRouteGameTest {
 static final String F="core:class/ability/alchemist/";
 static GameTestHelper h;
 static int checks;
 static List<String> bars=new ArrayList<>();
 public static void main(String[] args)throws Exception {
  SharedConstants.tryDetectVersion();
  TestFunctionLoader.registerLoader(new TestFunctionLoader(){
   public void load(BiConsumer<ResourceKey<Consumer<GameTestHelper>>,Consumer<GameTestHelper>> sink){
    sink.accept(ResourceKey.create(Registries.TEST_FUNCTION,Identifier.parse("test:alchemist")),RunBombRouteGameTest::run);
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
 h=helper;try{
 cmd(null,"function test:setup");var p=mock("BombTester");p.setPos(Vec3.atBottomCenterOf(h.absolutePos(new BlockPos(2,3,2))));p.setNoGravity(true);fn(p,"player_init");set(p,"class",3);set(p,"pot.drop",2);set(p,"player.Strength",0);set(p,"player.Weakness",0);cmd(p,"attribute @s movement_efficiency base set 0.01");
 set(p,"alch.pas3",2);set(p,"alch.gift.level",0);set(p,"alch.gifts",0);bars.clear();fn(p,"7/show_stacks");ok(score(p,"alch.gift.cap")==5 && bars.getFirst().contains("0/5"),"empty gifts show learned level II capacity");
 for(int i=0;i<3;i++){var e=h.spawnWithNoFreeWill(EntityType.ZOMBIE,new BlockPos(4+i,3,2));cmd(e,"damage @s 1000 core:custom_magic by @a[name=BombTester,limit=1]");}
 ok(score(p,"alch.charges")==2,"actual kill advancement grants two charges after three kills");
 cmd(p,"item replace entity @s weapon.mainhand with carrot_on_a_stick[custom_data={IsArcanePot:true,ArcanePot:{damage:4.5,radius:3.0,cost:10.0}}]");
 cmd(p,"summon item ~ ~ ~ {Thrower:"+uuid(p)+",Item:{id:stone,count:1},PickupDelay:100}");
 p.drop(false);set(p,"weapon.holding.delay",0);ok(p.getMainHandItem().isEmpty(),"actual Q drop empties main hand");ok(score(p,"drop_trigger")>=1,"actual Q drop increments input objective");
 cmd(p,"function test:drop_input");
 ok(p.getMainHandItem().is(net.minecraft.world.item.Items.CARROT_ON_A_STICK),"input route restores actual dropped potion");
 var balls=h.getLevel().getEntities(p,p.getBoundingBox().inflate(5),e->e.entityTags().contains("alch.bomb.projectile"));ok(balls.size()==1 && score(p,"alch.charges")==1,"input route fires one projectile and spends one charge");
 var bomb=h.getLevel().getEntities(p,p.getBoundingBox().inflate(5),e->e.entityTags().contains("alch.bomb")).getFirst();
 ok(bomb.isPassenger(),"bomb carrier is mounted");var enemy=h.spawnWithNoFreeWill(EntityType.ZOMBIE,new BlockPos(2,3,4));enemy.setNoGravity(true);cmd(enemy,"attribute @s armor base set 0");
 cmd(balls.getFirst(),"kill @s");bomb.baseTick();near(enemy.getHealth(),13.25,"detached bomb damages target for 150 percent");ok(!bomb.isAlive(),"explosion removes bomb carrier");

 ok(h.getLevel().getEntities(p,p.getBoundingBox().inflate(4),e->e instanceof net.minecraft.world.entity.item.ItemEntity item && item.getItem().is(net.minecraft.world.item.Items.STONE)).size()==1,"unrelated dropped item survives potion restore");
 set(p,"alch.charges",0);bars.clear();fn(p,"5/cast");ok(bars.stream().anyMatch(t->t.contains("class.alchemist.ability5.no_charge")),"empty charge has explicit feedback");
 set(p,"alch.gift.level",0);set(p,"alch.pas3",1);fn(p,"7/show_stacks");ok(score(p,"alch.gift.cap")==3,"level I zero gifts still show capacity three");set(p,"alch.gift.level",2);fn(p,"7/show_stacks");ok(score(p,"alch.gift.cap")==5,"retained level II gifts still show capacity five");
 System.out.println("BOMB_ROUTE_PASS checks="+checks);h.succeed();
 }catch(Throwable t){t.printStackTrace();h.fail(net.minecraft.network.chat.Component.literal(t.toString()));}
 }
}
