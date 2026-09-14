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

class RunScout58GameTest {
 static final String F="core:class/ability/scout/";
 static GameTestHelper h;
 static int checks;
 static List<String> bars=new ArrayList<>();
 public static void main(String[] args)throws Exception {
  SharedConstants.tryDetectVersion();
  TestFunctionLoader.registerLoader(new TestFunctionLoader(){
   public void load(BiConsumer<ResourceKey<Consumer<GameTestHelper>>,Consumer<GameTestHelper>> sink){
    sink.accept(ResourceKey.create(Registries.TEST_FUNCTION,Identifier.parse("test:alchemist")),RunScout58GameTest::run);
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
 static void extra(ServerPlayer p){
 cmd(p,"kill @e[type=zombie]");cmd(p,"kill @e[tag=scout.cloud]");set(p,"scout.pas3",0);set(p,"range.slc",1);set(p,"range.slc.cd",0);fn(p,"5/cast");var d=(net.minecraft.world.entity.LivingEntity)tagged(p,"scout.decoy").getFirst();d.setPos(p.getX(),p.getY(),p.getZ()+1);
 var mob=h.spawn(EntityType.SKELETON,new BlockPos(6,3,2));mob.setNoGravity(true);cmd(mob,"item replace entity @s weapon.mainhand with bow");mob.setTarget(p);fn(d,"5/taunt");for(int i=0;i<100;i++){mob.tickCount++;if(i%10==0)fn(d,"5/taunt");mob.tick();}System.out.println("TAUNT_DEBUG target="+mob.getTarget()+" last="+mob.getLastHurtByMob()+" noAI="+mob.isNoAi()+" canAttack="+mob.canAttack(d));ok(mob.getTarget()==d,"skeleton AI switches aggro from player to decoy");ok(!h.getLevel().getEntities(mob,mob.getBoundingBox().inflate(20),x->x instanceof net.minecraft.world.entity.projectile.arrow.AbstractArrow arrow && arrow.getOwner()==mob).isEmpty(),"taunted skeleton still releases arrows");
 set(p,"range.slc",2);fn(p,"5/cast");cmd(mob,"kill @s");set(p,"range.sswap.cd",0);set(p,"range.sswap",1);p.setYRot(0);p.setXRot(0);fn(p,"7/cast");var ball=tagged(p,"scout.wind.projectile").getFirst();var carrier=tagged(p,"scout.wind").getFirst();
 cmd(p,"fill ~-1 ~ ~2 ~1 ~3 ~2 stone");ball.tick();ok(!ball.isAlive(),"wind snowball collides with actual solid blocks");carrier.baseTick();ok(tagged(p,"scout.cloud").size()==1 && !carrier.isAlive(),"block collision creates exactly one cloud and removes carrier");
 set(p,"scout.pas3",2);cmd(p,"item replace entity @s weapon.mainhand with crossbow[custom_data={range:4.0}]");net.minecraft.advancements.CriteriaTriggers.USING_ITEM.trigger(p,p.getMainHandItem());near(p.getMainHandItem().get(net.minecraft.core.component.DataComponents.USE_EFFECTS).speedMultiplier(),1,"crossbow use component cancels slowdown");set(p,"class",2);fn(p,"player_tick");near(p.getAttributeValue(Attributes.MOVEMENT_SPEED),0.1,"changing class removes active compensation");
 System.out.println("SCOUT58_PASS checks="+checks);h.succeed();
 }
 static void run(GameTestHelper helper){h=helper;try{
 cmd(null,"function test:setup");var p=mock("Scout58");p.setPos(Vec3.atBottomCenterOf(h.absolutePos(new BlockPos(2,3,2))));p.setNoGravity(true);p.setOnGround(true);set(p,"class",4);set(p,"player.Strength",0);set(p,"player.Weakness",0);set(p,"charging_bow",20);cmd(p,"attribute @s water_movement_efficiency base set 0.01");cmd(p,"item replace entity @s weapon.mainhand with bow[custom_data={range:4.0},enchantments={\"core:inter/arrow_effect\":1}]");
 set(p,"range.slc",1);fn(p,"5/cast");var d=(net.minecraft.world.entity.LivingEntity)tagged(p,"scout.decoy").getFirst();ok(((net.minecraft.world.entity.npc.villager.Villager)d).isBaby(),"decoy is a baby villager");var thrownFrom=d.position();d.tick();ok(d.position().distanceTo(thrownFrom)>0.5,"decoy physically moves after throw");ok(score(d,"scout.hits")==5 && d.getHealth()==1024,"level I decoy has five hits");ok(score(p,"range.slc.cd")==0,"decoy has no cooldown while alive");fn(p,"5/cast");ok(tagged(p,"scout.decoy").size()==1,"level I cannot replace live decoy");
 var e=enemy(4,2);d.setPos(p.getX(),p.getY(),p.getZ()+1);fn(d,"5/taunt");ok(e.getLastHurtByMob()==d,"taunt writes actual retaliation target");
 for(int i=0;i<4;i++){d.invulnerableTime=0;ok(e.doHurtTarget(h.getLevel(),d),"enemy naturally damages decoy "+i);ok(score(d,"scout.hits")==4-i,"each actual attack consumes exactly one hit "+i);d.baseTick();ok(score(d,"scout.hits")==4-i,"tick does not double count attack "+i);}
 d.invulnerableTime=0;e.doHurtTarget(h.getLevel(),d);ok(!d.entityTags().contains("scout.decoy") && score(p,"range.slc.cd")==200,"fifth attack kills decoy and starts CD");ok(score(e,"stats.blinded.duration")==60,"decoy death blinds enemies for three seconds");near(e.getHealth(),20,"level I decoy death has no damage");
 set(p,"range.slc.cd",0);set(p,"range.slc",2);fn(p,"5/cast");var d2=tagged(p,"scout.decoy").getFirst();ok(score(d2,"scout.hits")==8,"level II decoy has eight hits");d2.setPos(p.position());e.invulnerableTime=0;fn(p,"5/cast");ok(!d2.entityTags().contains("scout.decoy"),"level II can detonate own decoy");near(e.getHealth(),16,"level II decoy death deals full weapon damage");
 cmd(p,"kill @e[type=zombie]");set(p,"scout.pas2",1);set(p,"range.lc",1);set(p,"range.lc.cd",0);fn(p,"1/cast");var a=h.getLevel().getEntities(p,p.getBoundingBox().inflate(8),x->x instanceof net.minecraft.world.entity.projectile.arrow.AbstractArrow).getFirst();
 var direct=enemy(2,5);var t1=enemy(3,5);var t2=enemy(4,5);a.setPos(direct.getX(),direct.getY()+0.8,direct.getZ()-1.2);a.setDeltaMovement(0,0,2);a.tick();near(t1.getHealth(),17.6,"level I natural hit chains for 60 percent");near(t2.getHealth(),20,"level I chains to only nearest enemy");
 set(p,"scout.pas2",2);set(p,"range.lc.cd",0);fn(p,"1/cast");var a2=h.getLevel().getEntities(p,p.getBoundingBox().inflate(8),x->x instanceof net.minecraft.world.entity.projectile.arrow.AbstractArrow && x.isAlive()).getFirst();direct.invulnerableTime=0;t1.invulnerableTime=0;t2.invulnerableTime=0;a2.setPos(direct.getX(),direct.getY()+0.8,direct.getZ()-1.2);a2.setDeltaMovement(0,0,2);a2.tick();near(t1.getHealth(),13.6,"level II first chain target receives 100 percent");near(t2.getHealth(),16,"level II second chain target receives 100 percent");
 cmd(p,"kill @e[type=zombie]");set(p,"range.sswap",1);fn(p,"7/cast");ok(score(p,"range.sswap.cd")==240,"wind bomb starts 12 second cooldown");var ball=tagged(p,"scout.wind.projectile").getFirst();var carrier=tagged(p,"scout.wind").getFirst();ok(carrier.isPassenger(),"wind carrier rides actual snowball");var windVictim=enemy(4,2);cmd(ball,"kill @s");carrier.baseTick();near(windVictim.getHealth(),8,"level I wind bomb deals 12 damage");var cloud=tagged(p,"scout.cloud").getFirst();ok(score(cloud,"scout.life")==99,"level I cloud lasts 100 ticks including initial application");ok(windVictim.hasEffect(MobEffects.SLOWNESS) && windVictim.getEffect(MobEffects.SLOWNESS).getAmplifier()==1,"cloud applies slowness II");ok(windVictim.getDeltaMovement().x<0,"cloud pulls victim toward center");ok(!windVictim.hasEffect(MobEffects.WEAKNESS),"level I cloud has no weakness");for(int i=0;i<100;i++)fn(cloud,"7/cloud_tick");ok(!cloud.isAlive(),"cloud expires after configured duration");
 set(p,"range.sswap.cd",0);set(p,"range.sswap",2);windVictim.setHealth(20);windVictim.invulnerableTime=0;fn(p,"7/cast");var ball2=tagged(p,"scout.wind.projectile").getFirst();var carrier2=tagged(p,"scout.wind").getFirst();cmd(ball2,"kill @s");carrier2.baseTick();near(windVictim.getHealth(),2,"level II wind bomb deals 18 damage");var cloud2=tagged(p,"scout.cloud").getFirst();ok(score(cloud2,"scout.life")==139 && windVictim.getEffect(MobEffects.WEAKNESS).getAmplifier()==1,"level II cloud lasts 140 ticks and applies weakness II");
 set(p,"scout.pas3",1);fn(p,"8/tick");ok(p.getEffect(MobEffects.HASTE).getAmplifier()==0,"level I provides haste I");p.setOnGround(false);fn(p,"snapshot");cmd(p,"execute store result score @s scout.tmp run data get storage core:scout shot.damage 1000");ok(score(p,"scout.tmp")==4600,"airborne level I weapon damage gains 15 percent");set(p,"scout.pas3",2);fn(p,"snapshot");cmd(p,"execute store result score @s scout.tmp run data get storage core:scout shot.damage 1000");ok(score(p,"scout.tmp")==5000,"airborne level II weapon damage gains 25 percent");p.setOnGround(true);fn(p,"snapshot");cmd(p,"execute store result score @s scout.tmp run data get storage core:scout shot.damage 1000");ok(score(p,"scout.tmp")==4000,"grounded damage has no airborne bonus");
 fn(p,"8/tick");ok(p.getEffect(MobEffects.HASTE).getAmplifier()==1,"level II provides haste II");net.minecraft.advancements.CriteriaTriggers.USING_ITEM.trigger(p,p.getMainHandItem());near(p.getMainHandItem().get(net.minecraft.core.component.DataComponents.USE_EFFECTS).speedMultiplier(),1,"bow use component cancels slowdown");near(p.getAttributeValue(Attributes.MOVEMENT_SPEED),0.1,"bow use does not boost movement attribute");ok(p.hasEffect(MobEffects.SLOW_FALLING),"using bow at level II gives slow falling");fn(p,"8/tick");fn(p,"8/tick");near(p.getAttributeValue(Attributes.MOVEMENT_SPEED),0.1,"stopping use removes movement compensation");
 extra(p);
 }catch(Throwable t){t.printStackTrace();h.fail(net.minecraft.network.chat.Component.literal(t.toString()));}}
}
