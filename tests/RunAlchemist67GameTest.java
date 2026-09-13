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

class RunAlchemist67GameTest {
 static final String F="core:class/ability/alchemist/";
 static GameTestHelper h;
 static int checks;
 static List<String> bars=new ArrayList<>();
 public static void main(String[] args)throws Exception {
  SharedConstants.tryDetectVersion();
  TestFunctionLoader.registerLoader(new TestFunctionLoader(){
   public void load(BiConsumer<ResourceKey<Consumer<GameTestHelper>>,Consumer<GameTestHelper>> sink){
    sink.accept(ResourceKey.create(Registries.TEST_FUNCTION,Identifier.parse("test:alchemist")),RunAlchemist67GameTest::run);
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
 try {
 cmd(null,"function test:setup");var p=mock("Alchemist67");p.setPos(Vec3.atBottomCenterOf(h.absolutePos(new BlockPos(2,3,2))));p.setNoGravity(true);
 fn(p,"player_init");set(p,"class",3);set(p,"pot.sswap",0);cmd(p,"attribute @s luck base set 20");
 for(int i=0;i<5;i++)fn(p,"7/pickup {level:1}");
 ok(score(p,"alch.gifts")==3,"full health level I caps at three gifts");near(p.getAttributeValue(Attributes.LUCK),23,"three level I gifts grant 15 percent defence");
 ticks(p,40);ok(score(p,"alch.gifts")==3,"full health never consumes saved gifts");
 for(int i=0;i<6;i++)fn(p,"7/pickup {level:2}");ok(score(p,"alch.gifts")==5,"full health level II caps at five gifts");near(p.getAttributeValue(Attributes.LUCK),27,"five level II gifts grant 35 percent defence");
 set(p,"player.ManaBar",0);ticks(p,20);ok(score(p,"player.ManaBar")==70,"stored gifts provide fractional mana regeneration");
 p.setHealth(18);ticks(p,1);near(p.getHealth(),19,"injury consumes one layer for one health");ok(score(p,"alch.gifts")==4,"first heal consumes exactly one layer");near(p.getAttributeValue(Attributes.LUCK),25.6,"defence follows remaining layers");
 ticks(p,20);near(p.getHealth(),20,"healing continues until full health");ok(score(p,"alch.gifts")==3,"unused layers survive reaching full health");ticks(p,40);ok(score(p,"alch.gifts")==3,"remaining layers stay stored at full health");
 p.setHealth(10);ticks(p,41);near(p.getHealth(),13,"all three remaining gifts heal exactly three health");ok(score(p,"alch.gifts")==0,"healing stops when gifts run out");near(p.getAttributeValue(Attributes.LUCK),20,"last layer removes defence modifier");ticks(p,30);near(p.getHealth(),13,"empty gifts never heal again");
 fn(p,"7/pickup {level:1}");p.baseTick();net.minecraft.advancements.CriteriaTriggers.TICK.trigger(p);near(p.getHealth(),14,"new gift is used immediately when injured");ok(score(p,"alch.gifts")==0,"immediate heal spends newly acquired gift");
 set(p,"alch.pool.cd",73);set(p,"pot.src.cd",0);fn(p,"6/migrate_cd");ok(score(p,"pot.src.cd")==73,"legacy cooldown migrated");
 set(p,"alch.pool.cd",20);set(p,"pot.src.cd",80);fn(p,"6/migrate_cd");ok(score(p,"pot.src.cd")==80,"migration never shortens current cooldown");
 set(p,"alch.pas2",2);set(p,"pot.src.cd",0);p.setShiftKeyDown(true);p.setPose(Pose.CROUCHING);
 cmd(null,"data modify storage element damage set value 10.0");cmd(null,"data modify storage element radius set value 3.0");set(p,"stdTemp1",10000);fn(p,"pot/snapshot");
 ok(score(p,"pot.src.cd")==200,"shadow pool starts standard src cooldown");
 cmd(p,"execute store result score @s alch.tmp run data get storage core:alchemist pot.pool");ok(score(p,"alch.tmp")==2,"ready potion reserves level II pool");fn(p,"pot/snapshot");cmd(p,"execute store result score @s alch.tmp run data get storage core:alchemist pot.pool");ok(score(p,"alch.tmp")==0,"cooldown blocks another pool");
 fn(p,"player_tick");ok(score(p,"pot.src.cd")==200,"private player tick does not double-decrement cooldown");
 bars.clear();for(int i=0;i<198;i++)cmd(p,"function core:data/ability_off_cd");ok(score(p,"pot.src.cd")==2 && bars.isEmpty(),"no early cooldown notification");
 cmd(p,"function core:data/ability_off_cd");ok(score(p,"pot.src.cd")==1 && bars.size()==1 && bars.getFirst().contains("class.alchemist.ability6.name.text") && bars.getFirst().contains("class.ability.off_cooldown"),"actual actionbar packet announces skill six cooldown");
 cmd(p,"function core:data/ability_off_cd");ok(score(p,"pot.src.cd")==0 && bars.size()==1,"cooldown reaches zero with no duplicate notification");
 fn(p,"pot/snapshot");cmd(p,"execute store result score @s alch.tmp run data get storage core:alchemist pot.pool");ok(score(p,"alch.tmp")==2 && score(p,"pot.src.cd")==200,"pool becomes available after cooldown ends");

 p.setHealth(20);set(p,"alch.runtime",1);cmd(p,"scoreboard players reset @s alch.gifts");cmd(p,"scoreboard players reset @s alch.gift.level");fn(p,"7/pickup {level:2}");ok(score(p,"alch.gifts")==1 && score(p,"alch.gift.level")==2,"old initialized player with absent counters can stack level II gift");near(p.getAttributeValue(Attributes.LUCK),21.4,"repaired state grants correct level II bonus");
 bars.clear();set(p,"alch.pas3",2);set(p,"alch.gift.cd",3);fn(p,"player_tick");ok(bars.isEmpty(),"gift cooldown has no early notification");fn(p,"player_tick");ok(bars.size()==1 && bars.getFirst().contains("class.alchemist.ability7.name.text"),"gift cooldown sends actual completion actionbar");fn(p,"player_tick");ok(bars.size()==1 && score(p,"alch.gift.cd")==0,"gift notification is sent once");
 System.out.println("ALCHEMIST_67_RUNTIME_PASS checks="+checks);h.succeed();
 }catch(Throwable t){t.printStackTrace();h.fail(net.minecraft.network.chat.Component.literal(t.toString()));}
 }
}
