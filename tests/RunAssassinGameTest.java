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
import net.minecraft.world.phys.Vec3;

class RunAssassinGameTest {
 static final String F="core:class/ability/assassin/";
 static GameTestHelper h; static int checks, particles, sounds;
 public static void main(String[] args)throws Exception {
  SharedConstants.tryDetectVersion();
  TestFunctionLoader.registerLoader(new TestFunctionLoader(){public void load(BiConsumer<ResourceKey<Consumer<GameTestHelper>>,Consumer<GameTestHelper>> sink){sink.accept(ResourceKey.create(Registries.TEST_FUNCTION,Identifier.parse("test:assassin")),RunAssassinGameTest::run);}});
  GameTestMainUtil.runGameTestServer(args,p->{});
 }
 static CommandSourceStack source(Entity e){var s=h.getLevel().getServer().createCommandSourceStack().withLevel(h.getLevel()).withSuppressedOutput();return e==null?s:s.withEntity(e).withPosition(e.position()).withRotation(e.getRotationVector());}
 static void cmd(Entity e,String c){h.getLevel().getServer().getCommands().performPrefixedCommand(source(e),c);}
 static void fn(Entity e,String p){cmd(e,"function "+F+p);}
 static int score(Entity e,String n){var v=h.getLevel().getScoreboard().getPlayerScoreInfo(e,h.getLevel().getScoreboard().getObjective(n));return v==null?0:v.value();}
 static void set(Entity e,String n,int v){cmd(e,"scoreboard players set @s "+n+" "+v);}
 static void ok(boolean v,String m){if(!v)throw new IllegalStateException("ASSERT: "+m);checks++;System.out.println("CHECK "+m);}
 static ServerPlayer mock(String name){
  var cookie=net.minecraft.server.network.CommonListenerCookie.createInitial(new com.mojang.authlib.GameProfile(UUID.randomUUID(),name),false);var server=h.getLevel().getServer();var p=new ServerPlayer(server,h.getLevel(),cookie.gameProfile(),cookie.clientInformation());var c=new net.minecraft.network.Connection(net.minecraft.network.protocol.PacketFlow.SERVERBOUND){
@Override public void send(net.minecraft.network.protocol.Packet<?> packet,io.netty.channel.ChannelFutureListener listener,boolean flush){if(packet instanceof net.minecraft.network.protocol.game.ClientboundLevelParticlesPacket)particles++;if(packet instanceof net.minecraft.network.protocol.game.ClientboundSoundPacket)sounds++;super.send(packet,listener,flush);}};new io.netty.channel.embedded.EmbeddedChannel(c);server.getPlayerList().placeNewPlayer(c,p,cookie);p.connection.handleAcceptPlayerLoad(new net.minecraft.network.protocol.game.ServerboundPlayerLoadedPacket());p.setGameMode(net.minecraft.world.level.GameType.SURVIVAL);cmd(p,"execute store result score @s vfam.index run function vfam:sys/p_set");set(p,"vfam.timeline",0);return p;
 }
 static String uuid(Entity e){return new net.minecraft.nbt.IntArrayTag(net.minecraft.core.UUIDUtil.uuidToIntArray(e.getUUID())).toString();}
 static void near(double a,double b,String m){ok(Math.abs(a-b)<0.03,m+" actual="+a+" expected="+b);}
 static net.minecraft.world.entity.monster.zombie.Zombie enemy(ServerPlayer p,double x,double z){var e=h.spawnWithNoFreeWill(EntityType.ZOMBIE,new BlockPos(2,3,2));e.setPos(p.position().add(x,0,z));e.setNoGravity(true);cmd(e,"attribute @s max_health base set 200");e.setHealth(200);cmd(e,"attribute @s armor base set 0");return e;}
 static void clearEnemies(ServerPlayer p){cmd(p,"kill @e[type=zombie]");}
 static void prepare(ServerPlayer p,int skill,int level){
  p.setPos(Vec3.atBottomCenterOf(h.absolutePos(new BlockPos(2,3,2))));p.setYRot(0);p.setXRot(0);set(p,"player.Strength",0);set(p,"player.Weakness",0);set(p,"class",5);set(p,"melee.rc",0);set(p,"melee.sswap",0);set(p,"melee.src",0);set(p,"melee.slc",0);set(p,"melee.drop",0);
  set(p,"melee.rc.cd",0);set(p,"melee.sswap.cd",0);set(p,"melee.src.cd",0);set(p,"melee.slc.cd",0);set(p,"melee.drop.cd",0);
  if(skill==1)set(p,"melee.rc",level);if(skill==2)set(p,"melee.sswap",level);if(skill==3)set(p,"melee.src",level);if(skill==4)set(p,"melee.slc",level);if(skill==5)set(p,"melee.drop",level);
 }
 static long entities(String tag){return h.getLevel().getEntities((Entity)null,new net.minecraft.world.phys.AABB(Vec3.atLowerCornerOf(h.absolutePos(new BlockPos(-30,-10,-30))),Vec3.atLowerCornerOf(h.absolutePos(new BlockPos(100,120,100)))),e->e.entityTags().contains(tag)).size();}
 static void behavior(ServerPlayer p,ServerPlayer ally){
  set(ally,"class",5);set(ally,"assassin.pas3",2);set(ally,"assassin.8.damage",0);
  for(int level=1;level<=2;level++){
   clearEnemies(p);prepare(p,2,level);set(p,"assassin.pas2",0);set(p,"assassin.pas3",0);var e=enemy(p,0,2);int fp=particles,fs=sounds;cmd(p,"function operation:trigger/sswap");near(e.getHealth(),200-(level==1?9:17),"2 damage formula "+level);ok(score(e,"stats.stunned.duration")==30,"2 freezes for 30 ticks");ok(particles>fp && sounds>fs,"2 particle and sound packets");
   clearEnemies(p);prepare(p,3,level);e=enemy(p,0,2);cmd(p,"function operation:trigger/src");set(p,"assassin.3.interval",4);if(level==2)fn(p,"3/tick");else cmd(p,"execute as @e[type=armor_stand,tag=assassin.3.1,sort=nearest,limit=1] at @s run function core:class/ability/assassin/3/tick");if(level==1)cmd(p,"execute as @e[type=armor_stand,tag=assassin.3.1,sort=nearest,limit=1] run scoreboard players set @s assassin.3.interval 4");if(level==1)cmd(p,"execute as @e[type=armor_stand,tag=assassin.3.1,sort=nearest,limit=1] at @s run function core:class/ability/assassin/3/tick");ok(e.hasEffect(net.minecraft.world.effect.MobEffects.SLOWNESS),"3 smoke affects target");ok(e.getEffect(net.minecraft.world.effect.MobEffects.SLOWNESS).getAmplifier()==level,"3 smoke amplifier "+level);
   clearEnemies(p);prepare(p,4,level);e=enemy(p,0,3);cmd(p,"function operation:trigger/slc");near(e.getHealth(),200-(level==1?4:6),"4 one hit despite overlapping ray samples");ok(score(e,"assassin.4.duration")==-80,"4 mark timer");e.invulnerableTime=0;fn(e,"4/take_damage");near(e.getHealth(),200-(level==1?7:12),"4 marked bonus damage");for(int i=0;i<80;i++)cmd(e,"function core:data/enemy/tick");e.invulnerableTime=0;float hp=e.getHealth();fn(e,"4/take_damage");near(e.getHealth(),hp,"4 mark expires");
   clearEnemies(p);prepare(p,1,level);set(p,"assassin.pas1",level);e=enemy(p,0,2);e.setLastHurtByMob(p);p.setDeltaMovement(0,-0.2,0);p.setKnownMovement(new Vec3(0,-0.2,0));fn(e,"6/effect_"+level);near(e.getHealth(),200-(level==1?1.5:2.5),"6 ordinary critical bonus");e.setHealth(200);e.invulnerableTime=0;cmd(e,"tag @s add Boss");fn(e,"6/effect_"+level);near(e.getHealth(),200-(level==1?3.5:8),"6 boss critical bonus");p.setDeltaMovement(Vec3.ZERO);p.setKnownMovement(Vec3.ZERO);
   clearEnemies(p);prepare(p,1,level);set(p,"assassin.pas1",0);set(p,"assassin.pas2",level);set(p,"assassin.7.count",1);e=enemy(p,0,1.5);var far=enemy(p,0,5);fp=particles;fs=sounds;fn(p,"7/trigger");near(e.getHealth(),200-(level==1?6:12),"7 near and ray target deduplicated");near(far.getHealth(),200-(level==1?6:12),"7 forward target damaged");ok(particles>fp && sounds>fs,"7 effects emitted");fn(p,"7/trigger");ok(score(p,"assassin.7.count")==0,"7 empty stack stays zero");
   clearEnemies(p);prepare(p,1,level);set(p,"assassin.pas2",0);set(p,"assassin.pas3",level);set(p,"max_class_points",2);set(p,"assassin.8.damage",0);e=enemy(p,0,2);e.setYRot(0);e.setLastHurtByMob(p);fn(e,"8/on_hit");near(e.getHealth(),200-(level==1?3.5:6),"8 behind target bonus");ok(score(p,"assassin.8.damage")== (level==1?350:600),"8 accumulates actual bonus damage");e.setHealth(200);e.invulnerableTime=0;e.setYRot(180);fn(e,"8/on_hit");near(e.getHealth(),200,"8 frontal hit gets no bonus");set(p,"assassin.8.damage",0);fn(e,"8/damage_uuid {value:49.5,owner:"+uuid(p)+"}");ok(score(p,"assassin.8.damage")==4950,"8 below total-point threshold");e.invulnerableTime=0;fp=particles;fs=sounds;fn(e,"8/damage_uuid {value:1.0,owner:"+uuid(p)+"}");ok(score(p,"assassin.8.damage")==50,"8 retains excess damage");ok(score(e,"stats.blinded.duration")== (level==1?15:25),"8 exact blind duration");ok(particles>fp && sounds>fs,"8 effects emitted");ok(score(ally,"assassin.8.damage")==0,"8 no attribution to nearby second player");
  }
  set(p,"assassin.7.count",3);set(p,"assassin.8.damage",100);cmd(p,"tag @s add assassin.active");set(p,"class",4);fn(p,"player_tick");ok(score(p,"assassin.7.count")==0 && score(p,"assassin.8.damage")==0,"class change clears passive progress");
 }
 static void routes(ServerPlayer p,ServerPlayer ally){
  clearEnemies(p);prepare(p,2,2);set(p,"assassin.pas1",0);set(p,"assassin.pas2",0);set(p,"assassin.pas3",0);cmd(p,"item replace entity @s weapon.offhand with air");p.setShiftKeyDown(true);p.setPose(Pose.CROUCHING);p.inventoryMenu.broadcastChanges();
  p.connection.handlePlayerAction(new net.minecraft.network.protocol.game.ServerboundPlayerActionPacket(net.minecraft.network.protocol.game.ServerboundPlayerActionPacket.Action.SWAP_ITEM_WITH_OFFHAND,BlockPos.ZERO,net.minecraft.core.Direction.DOWN));p.inventoryMenu.broadcastChanges();ok(score(p,"melee.sswap.cd")==200,"real sneak F dispatches sword dance");p.setShiftKeyDown(false);p.setPose(Pose.STANDING);
  prepare(p,5,2);p.drop(false);cmd(p,"function operation:trigger/drop");ok(!p.getMainHandItem().isEmpty(),"Q returns original sword");ok(score(p,"melee.drop.cd")==160,"Q launches flying blade");var carriers=h.getLevel().getEntities(p,p.getBoundingBox().inflate(4),e->e.entityTags().contains("assassin.5.2"));ok(!carriers.isEmpty(),"5 projectile carrier exists");var carrier=carriers.getLast();var victim=enemy(p,0,2);carrier.setPos(victim.position().add(0,0.6,0));fn(carrier,"5/tick");ok(score(victim,"assassin.5.duration")==-200,"5 marks target for ten seconds");set(p,"melee.rc",1);set(p,"melee.rc.cd",100);set(p,"melee.drop.cd",100);set(ally,"melee.rc",1);set(ally,"melee.rc.cd",100);fn(victim,"5/effect_2");ok(score(p,"melee.rc.cd")==80 && score(p,"melee.drop.cd")==40,"5 level II cooldown rewards");ok(score(ally,"melee.rc.cd")==100,"5 rewards only projectile owner");
  clearEnemies(p);prepare(p,1,1);set(p,"assassin.pas3",1);set(p,"assassin.pas2",1);set(p,"assassin.7.count",1);set(p,"assassin.8.damage",0);set(p,"max_class_points",100);var e=enemy(p,0,2);e.setYRot(180);p.setOnGround(true);p.setKnownMovement(Vec3.ZERO);cmd(p,"item replace entity @s weapon.mainhand with netherite_sword[attribute_modifiers=[],enchantments={\"core:inter/sword_effect\":1}]");p.inventoryMenu.broadcastChanges();for(int i=0;i<25;i++)p.baseTick();float hp=e.getHealth();p.attack(e);System.out.println("TRACE="+h.getLevel().getServer().getCommandStorage().get(Identifier.parse("test:trace")));System.out.println("NATIVE hp="+e.getHealth()+" moon="+score(p,"assassin.7.count")+" damage="+score(p,"assassin.8.damage")+" stat="+score(p,"assassin.8.stat")+" tags="+p.entityTags());ok(score(p,"assassin.7.count")==0,"real melee consumes moonlight exactly once");near(score(p,"assassin.8.damage")/100.0,hp-e.getHealth(),"8 native and skill damage counted exactly once");ok(!p.entityTags().contains("assassin.native.open"),"native transaction closes after real swing");
 }
 static void run(GameTestHelper helper){h=helper;try{
  cmd(null,"function test:setup");var p=mock("Assassin");var ally=mock("AssassinAlly");p.setPos(Vec3.atBottomCenterOf(h.absolutePos(new BlockPos(2,3,2))));ally.setPos(p.position().add(20,0,0));p.setNoGravity(true);ally.setNoGravity(true);
  cmd(p,"attribute @s attack_damage base set 10");cmd(p,"item replace entity @s weapon.mainhand with netherite_sword[attribute_modifiers=[],enchantments={\"core:inter/sword_effect\":1}]");
  for(int level=1;level<=2;level++){
   prepare(p,1,level);fn(p,"1/cast");ok(score(p,"melee.rc.cd")==200,"1 level "+level+" starts cooldown");fn(p,"1/cast");ok(score(p,"melee.rc.cd")==200,"1 level "+level+" rejects repeat during cooldown");
   prepare(p,2,level);fn(p,"2/cast");ok(score(p,"melee.sswap.cd")==(level==1?240:200),"2 level "+level+" cooldown");fn(p,"2/cast");ok(score(p,"melee.sswap.cd")==(level==1?240:200),"2 level "+level+" rejects repeat during cooldown");
   prepare(p,3,level);long before=entities(level==1?"assassin.3.1":"assassin.3.2");fn(p,"3/cast");ok(score(p,"melee.src.cd")==280,"3 level "+level+" cooldown");ok(entities(level==1?"assassin.3.1":"assassin.3.2")==before+1,"3 level "+level+" creates its zone");
   prepare(p,4,level);fn(p,"4/cast");ok(score(p,"melee.slc.cd")==(level==1?200:160),"4 level "+level+" cooldown");fn(p,"4/cast");ok(score(p,"melee.slc.cd")==(level==1?200:160),"4 level "+level+" rejects repeat during cooldown");
   prepare(p,5,level);long blades=entities("kill_this_with");fn(p,"5/cast");ok(score(p,"melee.drop.cd")==160,"5 level "+level+" cooldown");ok(entities("kill_this_with")==blades+1,"5 level "+level+" throws a marked blade");
  }
  set(p,"assassin.pas2",1);set(p,"assassin.7.count",0);fn(p,"7/get");fn(p,"7/get");fn(p,"7/get");ok(score(p,"assassin.7.count")==2,"7 I moonlight caps at two");fn(p,"7/trigger");ok(score(p,"assassin.7.count")==1,"7 I consumes one moonlight");
  set(p,"assassin.pas2",2);set(p,"assassin.7.count",0);for(int i=0;i<4;i++)fn(p,"7/get");ok(score(p,"assassin.7.count")==3,"7 II moonlight caps at three");fn(p,"7/trigger");ok(score(p,"assassin.7.count")==2,"7 II consumes one moonlight");
  behavior(p,ally);
  routes(p,ally);
  System.out.println("ASSASSIN_RUNTIME_PASS checks="+checks);h.succeed();
 }catch(Throwable t){t.printStackTrace();h.fail(net.minecraft.network.chat.Component.literal(t.toString()));}}
}
