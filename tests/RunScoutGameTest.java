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

class RunScoutGameTest {
 static final String F="core:class/ability/scout/";
 static GameTestHelper h;
 static int checks;
 static List<String> bars=new ArrayList<>();
 public static void main(String[] args)throws Exception {
  SharedConstants.tryDetectVersion();
  TestFunctionLoader.registerLoader(new TestFunctionLoader(){
   public void load(BiConsumer<ResourceKey<Consumer<GameTestHelper>>,Consumer<GameTestHelper>> sink){
    sink.accept(ResourceKey.create(Registries.TEST_FUNCTION,Identifier.parse("test:alchemist")),RunScoutGameTest::run);
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
 static List<Entity> tagged(Entity p,String tag){return h.getLevel().getEntities(p,p.getBoundingBox().inflate(40),e->e.entityTags().contains(tag));}
 static net.minecraft.world.entity.monster.zombie.Zombie enemy(int x,int z){var e=h.spawnWithNoFreeWill(EntityType.ZOMBIE,new BlockPos(x,3,z));e.setNoGravity(true);cmd(e,"attribute @s armor base set 0");return e;}
 static void route(ServerPlayer p){
 cmd(p,"kill @e[type=#arrows]");cmd(p,"kill @e[type=zombie]");cmd(p,"kill @e[tag=scout.mark]");cmd(p,"kill @e[tag=scout.mine]");
 p.setPos(Vec3.atBottomCenterOf(h.absolutePos(new BlockPos(2,3,2))));p.setYRot(0);p.setXRot(0);set(p,"range.drop",1);set(p,"range.lc",1);set(p,"range.lc.cd",0);set(p,"scout.pas1",1);set(p,"scout.pas1.cd",0);set(p,"charging_bow",20);set(p,"range.swap",1);set(p,"range.swap.cd",0);
 fn(p,"1/cast");ok(score(p,"range.lc.cd")==80 && score(p,"scout.charges")==0,"level I shot has one charge and 4 second CD");cmd(p,"kill @e[type=#arrows]");
 var e=enemy(2,5);e.setHealth(20);fn(p,"4/cast");
 cmd(p,"item replace entity @s weapon.offhand with arrow");p.setShiftKeyDown(true);p.setPose(Pose.CROUCHING);
 var bow=(net.minecraft.world.item.BowItem)p.getMainHandItem().getItem();boolean fired=bow.releaseUsing(p.getMainHandItem(),h.getLevel(),p,bow.getUseDuration(p.getMainHandItem(),p)-20);ok(fired,"vanilla bow release fires successfully");
 var a=tagged(p,"scout.explosive").getFirst();ok(((net.minecraft.world.entity.projectile.arrow.AbstractArrow)a).getOwner()==p,"vanilla projectile_spawned resolves actual owner");ok(score(p,"scout.pas1.cd")==240,"vanilla bow release arms skill II");
 a.setPos(e.getX(),e.getY()+0.8,e.getZ()-1.2);a.setDeltaMovement(0,0,2);a.tick();
 System.out.println("NATURAL_HIT health="+e.getHealth()+" aliveArrow="+a.isAlive()+" marks="+tagged(p,"scout.mark").size());
 ok(!a.isAlive(),"natural entity collision consumes explosive arrow");ok(e.getHealth()<12,"natural collision applies ranged hit, mark bonus and explosion");ok(tagged(p,"scout.mine").isEmpty(),"level I explosion does not create mine");
 ok(tagged(p,"scout.mark").stream().anyMatch(m->score(m,"scout.used")==1),"natural projectile consumes level I mark bonus");
 cmd(e,"kill @s");set(p,"range.swap.cd",100);for(var m:tagged(p,"scout.mark"))fn(m,"4/tick");ok(score(p,"range.swap.cd")==100,"level I marked kill does not refund cooldown");
 set(p,"scout.pas1",2);set(p,"scout.pas1.cd",0);cmd(p,"item replace entity @s weapon.offhand with arrow");bow.releaseUsing(p.getMainHandItem(),h.getLevel(),p,bow.getUseDuration(p.getMainHandItem(),p)-20);
 var a2=tagged(p,"scout.explosive").getFirst();cmd(a2,"data merge entity @s {inGround:1b}");fn(a2,"2/tick");ok(!a2.isAlive() && tagged(p,"scout.mine").size()==1,"grounded level II arrow creates mine through tick route");
 p.setShiftKeyDown(false);p.setPose(Pose.STANDING);var s1=enemy(3,2);var s2=enemy(4,2);cmd(s1,"data merge entity @s {NoAI:0b}");cmd(s2,"data merge entity @s {NoAI:0b}");set(p,"scout.level",1);fn(p,"3/land");ok(score(s1,"stats.stunned.duration")==15 && score(s2,"stats.stunned.duration")==0,"level I landing only stuns nearest enemy");
 System.out.println("SCOUT_RUNTIME_PASS checks="+checks);h.succeed();
 }
 static void run(GameTestHelper helper){h=helper;try{
 cmd(null,"function test:setup");var p=mock("ScoutTester");p.setPos(Vec3.atBottomCenterOf(h.absolutePos(new BlockPos(2,3,2))));p.setNoGravity(true);set(p,"class",4);set(p,"player.Strength",0);set(p,"player.Weakness",0);cmd(p,"attribute @s water_movement_efficiency base set 0.01");
 cmd(p,"item replace entity @s weapon.mainhand with bow[custom_data={range:4.0},enchantments={\"core:inter/arrow_effect\":1}]");set(p,"range.lc",2);set(p,"range.drop",2);set(p,"range.swap",2);set(p,"scout.pas1",2);set(p,"charging_bow",7);
 fn(p,"player_tick");ok(score(p,"scout.charges")==2,"level II initializes two charges");near(p.getAttributeValue(Attributes.MOVEMENT_SPEED),0.115,"passive speed adds 15 percent");fn(p,"player_tick");near(p.getAttributeValue(Attributes.MOVEMENT_SPEED),0.115,"passive does not stack each tick");
 fn(p,"1/cast");ok(score(p,"scout.charges")==1 && score(p,"range.lc.cd")==60,"first shot spends charge and starts 3 second CD");ok(score(p,"charging_bow")==7,"manual shot preserves bow draw score");
 var arrows=h.getLevel().getEntities(p,p.getBoundingBox().inflate(8),e->e instanceof net.minecraft.world.entity.projectile.arrow.AbstractArrow);ok(arrows.size()==1,"manual shot creates one arrow");var arrow=arrows.getFirst();near(arrow.getDeltaMovement().length(),3,"arrow launches at full velocity");
 fn(p,"1/cast");fn(p,"1/cast");ok(score(p,"scout.charges")==0,"second charge works during CD and third shot rejected");
 for(int i=0;i<60;i++){cmd(p,"function core:data/ability_off_cd");fn(p,"player_tick");}ok(score(p,"scout.charges")==2,"cooldown replenishes both charges");
 fn(p,"snapshot");cmd(p,"execute store result score @s scout.tmp run data get storage core:scout shot.damage 1000");ok(score(p,"scout.tmp")==4000,"snapshot is full weapon damage");
 p.setShiftKeyDown(true);p.setPose(Pose.CROUCHING);ok(((net.minecraft.world.entity.projectile.arrow.AbstractArrow)arrow).getOwner()==p,"manual arrow retains owner");fn(arrow,"2/on_shoot");ok(arrow.entityTags().contains("scout.explosive") && score(p,"scout.pas1.cd")==240,"sneaking owner arms explosive arrow");p.setShiftKeyDown(false);p.setPose(Pose.STANDING);
 var e=enemy(2,4);arrow.setPos(e.position());fn(arrow,"2/impact");near(e.getHealth(),13,"level II explosion is 175 percent weapon damage");ok(e.hasEffect(MobEffects.SLOW_FALLING),"explosion applies slow falling");near(e.getDeltaMovement().y,0.65,"explosion launches victim");
 var mines=tagged(p,"scout.mine");ok(mines.size()==1,"level II creates one mine");e.invulnerableTime=0;set(mines.getFirst(),"scout.life",190);fn(mines.getFirst(),"2/mine_tick");near(e.getHealth(),9.8,"mine deals 80 percent weapon damage");ok(!mines.getFirst().isAlive(),"mine triggers once");
 e.invulnerableTime=0;fn(p,"4/cast");ok(e.hasEffect(MobEffects.GLOWING),"mark makes enemies glow");ok(score(e,"stats.vulnerable.duration")==200,"mark applies 10 second vulnerability");var marks=tagged(p,"scout.mark");ok(marks.size()>=1 && marks.getFirst().isPassenger(),"marks ride targets");
 cmd(p,"tag @s add stdTemp1");float before=e.getHealth();fn(e,"4/on_hit");near(e.getHealth(),before-4,"level II first-hit bonus is 100 percent weapon damage");e.invulnerableTime=0;fn(e,"4/on_hit");near(e.getHealth(),before-4,"mark bonus cannot repeat");cmd(p,"tag @s remove stdTemp1");
 set(p,"range.swap.cd",100);cmd(e,"damage @s 1000");for(var m:marks)fn(m,"4/tick");ok(score(p,"range.swap.cd")==80,"marked kill refunds one second once");
 var s1=enemy(3,2);var s2=enemy(4,2);cmd(s1,"data merge entity @s {NoAI:0b}");cmd(s2,"data merge entity @s {NoAI:0b}");set(p,"scout.level",2);fn(p,"3/land");ok(score(s1,"stats.stunned.duration")==15 && score(s2,"stats.stunned.duration")==15,"level II landing stuns all nearby enemies");
 p.drop(false);fn(p,"3/drop");ok(p.getMainHandItem().is(net.minecraft.world.item.Items.BOW),"real Q restores player's bow");ok(score(p,"range.drop.cd")==60 && score(p,"scout.dash")==60,"Q starts dash with level II cooldown");
 set(p,"range.drop",0);fn(p,"player_tick");near(p.getAttributeValue(Attributes.MOVEMENT_SPEED),0.1,"unlearning removes passive speed");
 route(p);
 }catch(Throwable t){t.printStackTrace();h.fail(net.minecraft.network.chat.Component.literal(t.toString()));}}
}
