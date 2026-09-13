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

class RunAlchemistFxGameTest {
 static final String F="core:class/ability/alchemist/";
 static GameTestHelper h;
 static int checks;
 static List<net.minecraft.network.protocol.game.ClientboundLevelParticlesPacket> particles=new ArrayList<>();
 static List<String> bars=new ArrayList<>();
 public static void main(String[] args)throws Exception {
  SharedConstants.tryDetectVersion();
  TestFunctionLoader.registerLoader(new TestFunctionLoader(){
   public void load(BiConsumer<ResourceKey<Consumer<GameTestHelper>>,Consumer<GameTestHelper>> sink){
    sink.accept(ResourceKey.create(Registries.TEST_FUNCTION,Identifier.parse("test:alchemist")),RunAlchemistFxGameTest::run);
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
    if(packet instanceof net.minecraft.network.protocol.game.ClientboundLevelParticlesPacket particle)particles.add(particle);
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
 cmd(null,"function test:setup");var p=mock("AlchemistFx");p.setPos(Vec3.atBottomCenterOf(h.absolutePos(new BlockPos(2,3,2))));
 for(String file:List.of("1/particle","2/mark_particle","2/particle","3/particle","4/particle","4/shield_particle","5/flight_particle","7/particle","7/pickup_particle","7/heal_particle","8/particle")){
  particles.clear();fn(p,file);ok(!particles.isEmpty(),file+" emits visible packets");
  if(!file.equals("5/flight_particle"))ok(particles.stream().allMatch(q->q.getCount()==1 && q.getXDist()==0 && q.getYDist()==0 && q.getZDist()==0 && q.getMaxSpeed()==0),file+" uses fixed positions without random emission spread");
 }
 for(double radius:new double[]{2,5}){
  particles.clear();fn(p,"6/border_particle {radius:"+radius+"}");
  ok(particles.size()==32,"pool border has thirty-two samples");
  boolean shape=true;var distinct=new HashSet<String>();
  for(var q:particles){double x=q.getX()-p.getX(),z=q.getZ()-p.getZ();shape &= Math.abs(Math.hypot(x,z)-radius)<0.002 && Math.abs(q.getY()-p.getY()-.12)<0.002;distinct.add(String.format(Locale.ROOT,"%.3f,%.3f",x,z));}
  ok(shape && distinct.size()==32,"border matches actual radius "+radius+" without collapsed directions");
 }
 particles.clear();fn(p,"5/explode_particle {radius:3.75}");ok(particles.size()==56,"bomb explosion renders radius ring and core");
 cmd(p,"summon armor_stand ~ ~ ~ {Tags:[\"fx_fixture\"],Marker:1b,data:{radius:3.0}}");
 var entity=h.getLevel().getEntities(p,p.getBoundingBox().inflate(4),e->e.entityTags().contains("fx_fixture")).getFirst();set(entity,"alch.life",119);set(entity,"alch.tmp",777);particles.clear();fn(entity,"6/particle_tick");ok(particles.isEmpty(),"pool border skips intermediate frames");
 set(entity,"alch.life",115);fn(entity,"6/particle_tick");ok(particles.size()==32 && score(entity,"alch.life")==115 && score(entity,"alch.tmp")==777,"five-tick refresh preserves gameplay counters");

 for(String skill:List.of("3","4","7","8")){
  particles.clear();cmd(p,"execute at @s anchored eyes positioned ^ ^ ^0 anchored feet run function core:class/ability/alchemist/"+skill+"/view_particle");
  Vec3 forward=p.getLookAngle();boolean inFront=particles.stream().allMatch(q->new Vec3(q.getX(),q.getY(),q.getZ()).subtract(p.getEyePosition()).dot(forward)>1.9);
  ok(inFront && particles.size()>=20,"skill "+skill+" has first-person particles ahead of eyes");ok(particles.stream().anyMatch(q->q.getCount()==0 && q.getMaxSpeed()>0),"skill "+skill+" includes expanding sparks");
 }
 System.out.println("ALCHEMIST_FX_RUNTIME_PASS checks="+checks);h.succeed();
 }catch(Throwable t){t.printStackTrace();h.fail(net.minecraft.network.chat.Component.literal(t.toString()));}
 }
}
