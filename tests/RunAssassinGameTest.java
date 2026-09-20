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
 static final List<net.minecraft.network.protocol.game.ClientboundLevelParticlesPacket> particlePackets=new ArrayList<>();
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
@Override public void send(net.minecraft.network.protocol.Packet<?> packet,io.netty.channel.ChannelFutureListener listener,boolean flush){if(packet instanceof net.minecraft.network.protocol.game.ClientboundLevelParticlesPacket fx){particles++;particlePackets.add(fx);}if(packet instanceof net.minecraft.network.protocol.game.ClientboundSoundPacket)sounds++;super.send(packet,listener,flush);}};new io.netty.channel.embedded.EmbeddedChannel(c);server.getPlayerList().placeNewPlayer(c,p,cookie);p.connection.handleAcceptPlayerLoad(new net.minecraft.network.protocol.game.ServerboundPlayerLoadedPacket());p.setGameMode(net.minecraft.world.level.GameType.SURVIVAL);cmd(p,"execute store result score @s vfam.index run function vfam:sys/p_set");set(p,"vfam.timeline",0);return p;
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
 static void focused(ServerPlayer p,ServerPlayer ally){
  cmd(p,"tag @s add DamageOwner");set(p,"class",5);
  for(int level=1;level<=2;level++)for(boolean behind:new boolean[]{true,false})for(double amount:new double[]{10,2.55}){
   set(p,"assassin.pas3",level);var e=enemy(p,0,2);e.setYRot(behind?0:180);
   cmd(e,"function core:damage/melee/do {value:"+amount+"}");
   ok(!p.entityTags().contains("assassin.skill.damage"),"temporary damage guard cleared");
   ok(Math.abs((200-e.getHealth())-amount*(behind?(level==1?1.35:1.6):1))<0.002,"custom melee bonus level="+level+" behind="+behind+" amount="+amount);e.discard();
  }
  // A closer bystander must not replace DamageOwner, and an outer skill owns its guard.
  set(p,"assassin.pas3",2);cmd(p,"tag @s add assassin.skill.damage");var guarded=enemy(p,0,2);guarded.setYRot(0);ally.setPos(guarded.position().add(0,0,0.25));
  cmd(p,"execute as "+guarded.getUUID()+" run function core:damage/melee/do {value:10}");near(200-guarded.getHealth(),16,"caller-position context and closer bystander");ok(guarded.getLastHurtByMob()==p,"damage remains attributed to its owner");ok(p.entityTags().contains("assassin.skill.damage"),"outer damage guard preserved");guarded.discard();cmd(p,"tag @s remove assassin.skill.damage");
  var lethal=enemy(p,0,2);lethal.setHealth(12);lethal.setYRot(0);cmd(lethal,"function core:damage/melee/do {value:10}");ok(lethal.isDeadOrDying(),"backstab lethal damage applied");ok(!p.entityTags().contains("assassin.skill.damage"),"guard cleared after lethal hit");lethal.discard();
  cmd(p,"tag @s add assassin.skill.damage");set(p,"class",4);set(p,"assassin.pas3",2);var e=enemy(p,0,2);e.setYRot(0);cmd(e,"function core:damage/melee/do {value:10}");near(200-e.getHealth(),10,"other class unaffected");e.discard();
  set(p,"class",5);set(p,"assassin.pas3",0);e=enemy(p,0,2);e.setYRot(0);cmd(e,"function core:damage/melee/do {value:10}");near(200-e.getHealth(),10,"unselected passive unaffected");e.discard();if(!Boolean.getBoolean("assassin.regression"))focusedFx(p);
 }
 static void focusedFx(ServerPlayer p){
  // Exercise the actual skill caller, including damage calculation and multiple targets.
  cmd(p,"tag @s remove assassin.skill.damage");set(p,"assassin.pas2",0);
  for(int level=1;level<=2;level++){
   prepare(p,2,level);set(p,"assassin.pas3",level);var first=enemy(p,0,2);var second=enemy(p,0,3);first.setYRot(0);second.setYRot(0);fn(p,"2/cast");
   double expected=(level==1?9:17)*(level==1?1.35:1.6);near(200-first.getHealth(),expected,"2 real cast applies backstab level="+level);near(200-second.getHealth(),expected,"2 backstab applies independently to second target");first.discard();second.discard();
  }
  set(p,"class",5);set(p,"assassin.pas3",0);set(p,"assassin.pas2",0);cmd(p,"tag @s remove DamageOwner");
  for(int skill:new int[]{2,3,5}){prepare(p,skill,1);int before=particles;fn(p,skill+"/cast");ok(particles>before,"skill "+skill+" sends particle packets");}
  set(p,"assassin.pas3",2);set(p,"max_class_points",2);set(p,"assassin.8.damage_dealt",500);int before=particles;fn(p,"8/blindness_check");ok(particles>before,"8 blindness burst particles");
  for(float yaw:new float[]{0,90,-135})for(float pitch:new float[]{0,-40,55}){
   p.setYRot(yaw);p.setXRot(pitch);particlePackets.clear();fn(p,"7/particle_1");var view=Vec3.directionFromRotation(pitch,yaw);int directional=0;boolean aligned=true,bounded=true;
   for(var fx:particlePackets)if(fx.getCount()==0 && fx.getParticle().getType()==net.minecraft.core.particles.ParticleTypes.END_ROD){
    var motion=new Vec3(fx.getXDist(),fx.getYDist(),fx.getZDist()).scale(fx.getMaxSpeed());aligned &= motion.normalize().dot(view)>0.999;bounded &= motion.length()>0.1 && motion.length()<1.5;directional++;
   }
   ok(directional>=10 && aligned && bounded,"7 moving blade follows aim at bounded speed yaw="+yaw+" pitch="+pitch);
  }
 }
 static void chainFx(ServerPlayer p,ServerPlayer ally){
  // Load establishes the transient counter used by both the carrier and mark effects.
  fn(p,"load");
  ok(h.getLevel().getScoreboard().getObjective("assassin.5.fx")!=null,"5 chain visual counter is initialized");
  cmd(p,"kill @e[tag=assassin.5.projectile]");cmd(p,"kill @e[tag=assassin.5.1]");cmd(p,"kill @e[tag=assassin.5.2]");
  for(int level=1;level<=2;level++){
   final int skillLevel=level;final String carrierTag="assassin.5."+skillLevel;
   clearEnemies(p);prepare(p,skillLevel);var original=p.getMainHandItem().copy();int soundBefore=sounds;particlePackets.clear();
   fn(p,"5/cast");
   ok(net.minecraft.world.item.ItemStack.matches(original,p.getMainHandItem()),"5 level "+skillLevel+" cast preserves held sword");
   ok(!particlePackets.isEmpty() && sounds>soundBefore,"5 level "+skillLevel+" cast emits chain aperture and sound");
   var carriers=h.getLevel().getEntities(p,p.getBoundingBox().inflate(6),e->e.entityTags().contains(carrierTag));
   ok(!carriers.isEmpty(),"5 level "+skillLevel+" still throws a carrier");var carrier=carriers.getLast();
   ok(carrier.getVehicle()!=null && carrier.getVehicle().getType()==EntityType.ITEM,"5 level "+skillLevel+" carrier remains mounted on thrown item");
   ok(carrier.getVehicle().getDeltaMovement().length()>0.1,"5 level "+skillLevel+" thrown item has forward motion");

   particlePackets.clear();fn(carrier,"5/tick");ok(particlePackets.isEmpty(),"5 level "+skillLevel+" trail is gated on first carrier tick");
   fn(carrier,"5/tick");ok(!particlePackets.isEmpty(),"5 level "+skillLevel+" trail emits on second carrier tick");

   var victim=enemy(p,0,2);carrier.setPos(victim.position().add(0,0.6,0));particlePackets.clear();fn(carrier,"5/tick");
   ok(score(victim,"assassin.5.duration")==-200,"5 level "+skillLevel+" hit marks target for ten seconds");
   ok(victim.entityTags().contains(carrierTag+".apply"),"5 level "+skillLevel+" keeps its existing reward branch");
   ok(!particlePackets.isEmpty(),"5 level "+skillLevel+" hit emits chain convergence");
   ok(particlePackets.stream().allMatch(fx->new Vec3(fx.getX(),fx.getY(),fx.getZ()).distanceTo(victim.position())<4),"5 level "+skillLevel+" hit particles stay at target");

   particlePackets.clear();for(int tick=0;tick<4;tick++)cmd(victim,"function core:data/enemy/tick");
   ok(particlePackets.isEmpty(),"5 level "+skillLevel+" mark does not render every tick");
   cmd(victim,"function core:data/enemy/tick");ok(!particlePackets.isEmpty(),"5 level "+skillLevel+" marked target renders chain bind every five ticks");

   set(p,"melee.rc",1);set(p,"melee.rc.cd",100);set(p,"melee.drop.cd",100);fn(victim,"5/effect_"+skillLevel);
   ok(score(p,"melee.rc.cd")==80 && score(p,"melee.drop.cd")==(skillLevel==1?80:40),"5 level "+skillLevel+" existing cooldown reward is unchanged");
   fn(victim,"5/clear_mark");particlePackets.clear();cmd(victim,"function core:data/enemy/tick");
   ok(particlePackets.isEmpty(),"5 level "+skillLevel+" clear removes chain mark rendering");victim.discard();
  }
 }
 static void nativeRegression(ServerPlayer p,ServerPlayer ally){
  cmd(p,"tag @s remove assassin.skill.damage");cmd(p,"tag @s remove DamageOwner");set(p,"assassin.pas2",0);set(p,"assassin.pas1",0);ally.setPos(p.position().add(20,0,0));
  // Simulate an existing map already at config version 12, but lacking the new objectives.
  cmd(p,"scoreboard objectives remove assassin.8.facing");cmd(p,"scoreboard objectives remove assassin.8.damage_dealt");cmd(p,"scoreboard players set $version_check config 12");cmd(p,"function core:init");
  ok(h.getLevel().getScoreboard().getObjective("assassin.8.facing")!=null,"reload creates facing objective despite version gate");ok(h.getLevel().getScoreboard().getObjective("assassin.8.damage_dealt")!=null,"reload creates damage stat objective");
  for(int level=1;level<=2;level++){
   prepare(p,1,1);set(p,"assassin.pas3",level);var e=enemy(p,0,2);e.setYRot(0);e.setLastHurtByMob(p);cmd(p,"tag @s add tempApply");cmd(p,"tag @s add assassin.skill.damage");cmd(e,"function core:damage/melee/apply {BaseTaken:2.0}");cmd(p,"tag @s remove assassin.skill.damage");fn(e,"8/on_hit");cmd(p,"tag @s remove tempApply");near(200-e.getHealth(),2+(level==1?3.5:6),"native melee apply restores base and backstab level="+level);ok(!p.entityTags().contains("assassin.skill.damage"),"native bonus clears guard");e.discard();
   prepare(p,2,level);set(p,"assassin.pas3",level);e=enemy(p,0,2);var second=enemy(p,0,3);e.setYRot(0);second.setYRot(0);fn(p,"2/cast");near(200-e.getHealth(),(level==1?9:17)*(level==1?1.35:1.6),"full-pack skill 2 damage and backstab");near(second.getHealth(),e.getHealth(),"full-pack multi-target damage");e.discard();second.discard();
  }
  // Reuse the same victim and change its facing between real attacks; never reuse an old angle.
  for(int level=1;level<=2;level++){
   prepare(p,1,1);set(p,"assassin.pas3",level);p.setOnGround(true);p.setKnownMovement(Vec3.ZERO);var repeated=enemy(p,0,2);
   for(float yaw:new float[]{0,180,180,90,0,180}){
    repeated.setHealth(200);repeated.invulnerableTime=0;repeated.setPos(p.position().add(0,0,2));repeated.setYRot(yaw);repeated.setYHeadRot(yaw);float strength=p.getAttackStrengthScale(0.5f);double base=p.getAttributeValue(net.minecraft.world.entity.ai.attributes.Attributes.ATTACK_DAMAGE)*(0.2+strength*strength*0.8);
    p.attack(repeated);near(200-repeated.getHealth(),base+(yaw==0?(level==1?3.5:6):0),"repeated real hit level="+level+" yaw="+yaw);ok(!p.entityTags().contains("assassin.8.attacker"),"repeated hit clears attacker tag");
   }
   repeated.discard();
  }
  // A stale successful gate from another passive must not activate an unselected passive.
  prepare(p,1,1);set(p,"assassin.pas3",0);set(p,"assassin.pas1",0);var stale=enemy(p,0,2);stale.setYRot(0);stale.setLastHurtByMob(p);
  for(String effect:new String[]{"6/effect_1","6/effect_2","8/on_hit"}){set(stale,"assassin.tmp",1);float hp=stale.getHealth();fn(stale,effect);near(stale.getHealth(),hp,"stale successful gate cannot activate "+effect);}
  stale.discard();
  // Real player.attack triggers the actual weapon enchantment and advancement callbacks.
  prepare(p,1,1);set(p,"assassin.pas3",1);var e=enemy(p,0,2);e.setYRot(0);p.setOnGround(true);p.setKnownMovement(Vec3.ZERO);set(p,"max_class_points",2);set(p,"assassin.8.damage_dealt",450);float power=p.getAttackStrengthScale(0.5f);double nativeDamage=p.getAttributeValue(net.minecraft.world.entity.ai.attributes.Attributes.ATTACK_DAMAGE)*(0.2+power*power*0.8);p.attack(e);near(200-e.getHealth(),nativeDamage+3.5,"real melee attack triggers exactly one backstab with full enchantments");ok(!p.entityTags().contains("assassin.skill.damage"),"real swing leaves no guard");ok(score(p,"assassin.8.damage_dealt")>=500,"real melee advances damage statistic past threshold");cmd(p,"function core:data/player/tick");ok(score(e,"stats.blinded.duration")==15,"real player tick applies blindness after threshold");ok(score(p,"assassin.8.damage_dealt")==0,"blindness consumes accumulated damage");e.discard();
 }
 static void run(GameTestHelper helper){h=helper;try{
  cmd(null,"function test:setup");var p=mock("Assassin");var ally=mock("AssassinAlly");p.setPos(Vec3.atBottomCenterOf(h.absolutePos(new BlockPos(2,3,2))));ally.setPos(p.position().add(20,0,0));p.setNoGravity(true);ally.setNoGravity(true);
  cmd(p,"attribute @s attack_damage base set 10");cmd(p,"item replace entity @s weapon.mainhand with netherite_sword[attribute_modifiers=[],enchantments={\"core:inter/sword_effect\":1}]");
  if(Boolean.getBoolean("assassin.chain")){chainFx(p,ally);System.out.println("ASSASSIN_CHAIN_FX_PASS checks="+checks);h.succeed();return;}
  if(Boolean.getBoolean("assassin.regression")){focused(p,ally);nativeRegression(p,ally);System.out.println("ASSASSIN_REGRESSION_PASS checks="+checks);h.succeed();return;}
  if(Boolean.getBoolean("assassin.focus")){focused(p,ally);System.out.println("ASSASSIN_FOCUSED_PASS checks="+checks);h.succeed();return;}
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
