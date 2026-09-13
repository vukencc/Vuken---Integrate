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

class RunSkillFixesGameTest {
 static final String F="core:class/ability/alchemist/";
 static GameTestHelper h;
 static int checks;
 static List<net.minecraft.network.protocol.game.ClientboundLevelParticlesPacket> particles=new ArrayList<>();
 public static void main(String[] args)throws Exception {
  SharedConstants.tryDetectVersion();
  TestFunctionLoader.registerLoader(new TestFunctionLoader(){
   public void load(BiConsumer<ResourceKey<Consumer<GameTestHelper>>,Consumer<GameTestHelper>> sink){
    sink.accept(ResourceKey.create(Registries.TEST_FUNCTION,Identifier.parse("test:skill_fixes")),RunSkillFixesGameTest::run);
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
    if(name.equals("MarkerOwner") && packet instanceof net.minecraft.network.protocol.game.ClientboundLevelParticlesPacket particle)particles.add(particle);
    super.send(packet,listener,flush);
   }
  };
  new io.netty.channel.embedded.EmbeddedChannel(connection);
  server.getPlayerList().placeNewPlayer(connection,player,cookie);
  player.setGameMode(net.minecraft.world.level.GameType.SURVIVAL);
  return player;
 }
 static int markDamage(Entity e){cmd(e,"execute store result score @s alch.tmp run data get entity @s data.alch2.damage 1000");return score(e,"alch.tmp");}
 static LivingEntity mob(Vec3 pos) {
  var m=(LivingEntity)EntityType.ZOMBIE.create(h.getLevel(),EntitySpawnReason.COMMAND);
  m.setPos(pos);m.getAttribute(Attributes.ARMOR).setBaseValue(0);m.getAttribute(Attributes.MAX_HEALTH).setBaseValue(1000);m.setHealth(1000);
  h.getLevel().addFreshEntity(m);
  cmd(m,"data merge entity @s {NoAI:1b,NoGravity:1b,equipment:{saddle:{id:saddle,count:1,components:{enchantments:{\"core:system/enemy/tick\":1}}}}}");
  return m;
 }
 static void run(GameTestHelper helper){
  h=helper;
  try {
   cmd(null,"function test:setup");
   ServerPlayer p=mock("MarkerOwner"),other=mock("OtherOwner");
   Vec3 pos=Vec3.atBottomCenterOf(h.absolutePos(new BlockPos(2,3,2)));
   p.setPos(pos.add(8,0,0));other.setPos(pos.add(10,0,0));
   set(p,"marker",11);set(other,"marker",22);set(p,"pot.lc",1);set(other,"pot.lc",2);
   p.addTag("TempPotOwner");
   var target=mob(pos);var neighbour=mob(pos.add(2,0,0));var distant=mob(pos.add(6,0,0));
   set(target,"marker",777);
   fn(target,"2/mark {damage:10.5}");
   ok(markDamage(target)==10500,"fractional mark damage persists on ordinary zombie");
   ok(score(target,"marker")==777 && score(target,"alch.2.owner")==11,"mark preserves enemy identity and stores its own owner");
   ok(target.entityTags().contains("alch.2.marked.1") && score(target,"alch.2.time")==80,"level I mark starts with 80 ticks");
   other.addTag("DamageOwner");
   cmd(target,"function core:damage/magic/do {value:1}");
   near(neighbour.getHealth(),991.6,"real magic damage callback bursts for 80 percent");
   near(distant.getHealth(),1000,"burst respects four-block radius");
   ok(!target.entityTags().contains("alch.2.marked"),"level I mark consumed after damage");
   ok(other.entityTags().contains("DamageOwner") && !p.entityTags().contains("DamageOwner"),"nested burst restores incoming damage owner");
   ok(neighbour.getLastHurtByMob()==p,"burst attributed to marking player rather than triggering attacker");
   p.removeTag("TempPotOwner");other.addTag("TempPotOwner");
   fn(target,"2/mark {damage:10}");
   neighbour.invulnerableTime=0;target.invulnerableTime=0;
   float before=neighbour.getHealth();
   cmd(target,"function core:class/ability/alchemist/8/apply {damage:1,owner:"+uuid(p)+"}");
   near(before-neighbour.getHealth(),12,"level II burst deals 120 percent");
   ok(target.entityTags().contains("alch.2.marked.2"),"level II mark persists after burst");
   neighbour.invulnerableTime=0;target.invulnerableTime=0;before=neighbour.getHealth();
   cmd(target,"function core:class/ability/alchemist/8/apply {damage:1,owner:"+uuid(p)+"}");
   near(before-neighbour.getHealth(),12,"level II can trigger again");
   other.removeTag("TempPotOwner");p.addTag("TempPotOwner");fn(target,"2/mark {damage:5}");
   ok(!target.entityTags().contains("alch.2.marked.2") && target.entityTags().contains("alch.2.marked.1"),"remark replaces old level and owner");
   set(target,"alch.2.time",1);cmd(target,"function core:data/enemy/tick");
   ok(!target.entityTags().contains("alch.2.marked") && markDamage(target)==0,"expiry clears mark and damage");
   fn(target,"2/mark {damage:10}");fn(neighbour,"2/mark {damage:10}");
   float targetBefore=target.getHealth();
   cmd(target,"function core:damage/magic/do {value:1}");
   near(targetBefore-target.getHealth(),1,"marked neighbours cannot recursively burst back into origin");
   ok(neighbour.entityTags().contains("alch.2.marked.1") && !neighbour.entityTags().contains("alch.2.suppress"),"suppressed mark is retained and suppression cleared");
   fn(target,"2/clear");fn(neighbour,"2/clear");
   // Execute actual potion impact, including before/after hooks and projectile identity check.
   cmd(null,"tag @a remove DamageOwner");cmd(null,"tag @a remove TempPotOwner");
   set(p,"class",3);set(p,"alch.pas1",0);
   cmd(target,"summon armor_stand ~ ~ ~ {Tags:[\"fixture_pot\",\"alch.2.pot\"],Marker:1b,Invisible:1b}");
   cmd(target,"execute as @n[type=armor_stand,tag=fixture_pot] at @s run function core:trigger/basic/arcane_pot/apply {id:11,damage:2.5,radius:3}");
   ok(target.entityTags().contains("alch.2.marked") && neighbour.entityTags().contains("alch.2.marked"),"scatter potion impact marks actual affected enemies");
   near(markDamage(target),2500,"impact preserves potion damage in mark");
   fn(target,"2/clear");fn(neighbour,"2/clear");
   cmd(target,"summon armor_stand ~ ~ ~ {Tags:[\"unrelated_scatter\",\"alch.2.pot\"],Marker:1b}");
   cmd(target,"summon armor_stand ~ ~ ~ {Tags:[\"fixture_normal\"],Marker:1b}");
   cmd(target,"execute as @n[type=armor_stand,tag=fixture_normal] at @s run function core:trigger/basic/arcane_pot/apply {id:11,damage:2.5,radius:3}");
   ok(!target.entityTags().contains("alch.2.marked"),"ordinary potion beside scatter projectile does not apply mark");
   for(Vec3 offset:List.of(new Vec3(8,0,0),new Vec3(-3,6,5),new Vec3(2,-5,-7))){
    p.setPos(pos.add(offset));particles.clear();
    cmd(target,"execute anchored eyes positioned ^ ^ ^0 anchored feet facing entity @a[name=MarkerOwner,limit=1] eyes run function core:class/ability/mage/6/particle");
    ok(particles.size()==20,"mage ring emits twenty particles: "+offset);
    Vec3 center=target.getEyePosition(),normal=p.getEyePosition().subtract(center).normalize(),sum=Vec3.ZERO;
    var unique=new HashSet<String>();boolean radial=true,plane=true,outward=true;
    for(var q:particles){
     Vec3 r=new Vec3(q.getX(),q.getY(),q.getZ()).subtract(center);
     Vec3 v=new Vec3(q.getXDist(),q.getYDist(),q.getZDist()).scale(q.getMaxSpeed());
     sum=sum.add(r);radial &= Math.abs(r.length()-1)<0.002;plane &= Math.abs(r.dot(normal))<0.002;
     outward &= v.dot(r)>0.74 && Math.abs(v.dot(normal))<0.002;
     unique.add(String.format(java.util.Locale.ROOT,"%.3f,%.3f,%.3f",r.x,r.y,r.z));
    }
    ok(unique.size()==20 && radial,"ring has twenty distinct evenly-radius positions");
    ok(sum.scale(1.0/20).length()<0.002 && plane,"ring centered on target eyes and facing caster");
    ok(outward,"all ring particle velocities point outward in ring plane");
   }
   System.out.println("SKILL_FIXES_RUNTIME_PASS checks="+checks);h.succeed();
  }catch(Throwable t){t.printStackTrace();h.fail(net.minecraft.network.chat.Component.literal(t.toString()));}
 }
}
