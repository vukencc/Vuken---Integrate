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

class RunReduceCdGameTest {
 static final String F="core:class/ability/util/";
 static GameTestHelper h;
 static int checks;
 public static void main(String[] args)throws Exception {
  SharedConstants.tryDetectVersion();
  TestFunctionLoader.registerLoader(new TestFunctionLoader(){
   public void load(BiConsumer<ResourceKey<Consumer<GameTestHelper>>,Consumer<GameTestHelper>> sink){
    sink.accept(ResourceKey.create(Registries.TEST_FUNCTION,Identifier.parse("test:reduce_cd")),RunReduceCdGameTest::run);
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
 static ServerPlayer mock(String name){
  var cookie=net.minecraft.server.network.CommonListenerCookie.createInitial(new com.mojang.authlib.GameProfile(UUID.randomUUID(),name),false);
  var server=h.getLevel().getServer();
  var player=new ServerPlayer(server,h.getLevel(),cookie.gameProfile(),cookie.clientInformation());
  var connection=new net.minecraft.network.Connection(net.minecraft.network.protocol.PacketFlow.SERVERBOUND);
  new io.netty.channel.embedded.EmbeddedChannel(connection);
  server.getPlayerList().placeNewPlayer(connection,player,cookie);
  player.setGameMode(net.minecraft.world.level.GameType.SURVIVAL);
  return player;
 }
 static void run(GameTestHelper helper){
  h=helper;
  try {
   cmd(null,"function test:setup");
   ServerPlayer p=mock("CooldownTester");
   ServerPlayer other=mock("OtherPlayer");
   p.setPos(Vec3.atBottomCenterOf(h.absolutePos(new BlockPos(1,2,1))));
   other.setPos(p.position().add(3,0,0));
   set(p,"class",2);set(other,"wand.rc",2);set(other,"wand.rc.cd",80);
   set(p,"wand.rc",1);set(p,"wand.rc.cd",100);fn(p,"reduce_cd_pattern {scb:wand.rc,value:20}");
   ok(score(p,"wand.rc.cd")==80 && score(p,"wand.rc")==1,"reduce actual cooldown without changing skill level");
   ok(score(other,"wand.rc.cd")==80 && score(other,"wand.rc")==2,"other players are unchanged");
   set(p,"wand.rc",2);set(p,"wand.rc.cd",10);fn(p,"reduce_cd_pattern {scb:wand.rc,value:999}");
   ok(score(p,"wand.rc.cd")==2 && score(p,"wand.rc")==2,"over-reduction clamps cooldown to two");
   cmd(p,"function core:data/ability_off_cd");ok(score(p,"wand.rc.cd")==1,"normal tick reaches notification state");
   cmd(p,"function core:data/ability_off_cd");ok(score(p,"wand.rc.cd")==0,"normal tick completes cooldown");
   for(int remaining:new int[]{0,1,2,-1}) {
    set(p,"wand.rc.cd",remaining);fn(p,"reduce_cd_pattern {scb:wand.rc,value:20}");
    ok(score(p,"wand.rc.cd")==remaining,"ready or finishing cooldown is not extended: "+remaining);
   }
   set(p,"wand.rc",0);set(p,"wand.rc.cd",100);fn(p,"reduce_cd_pattern {scb:wand.rc,value:20}");
   ok(score(p,"wand.rc")==0 && score(p,"wand.rc.cd")==100,"unlearned skill is unchanged");
   cmd(p,"scoreboard players reset @s wand.rc");fn(p,"reduce_cd_pattern {scb:wand.rc,value:20}");
   ok(score(p,"wand.rc.cd")==100,"missing skill score is ignored");
   set(p,"wand.rc",1);cmd(p,"scoreboard players reset @s wand.rc.cd");fn(p,"reduce_cd_pattern {scb:wand.rc,value:20}");
   ok(h.getLevel().getScoreboard().getPlayerScoreInfo(p,h.getLevel().getScoreboard().getObjective("wand.rc.cd"))==null,"missing cooldown is not created");
   set(p,"wand.rc.cd",100);fn(p,"reduce_cd_pattern {scb:wand.rc,value:0}");ok(score(p,"wand.rc.cd")==100,"zero reduction is harmless");
   set(p,"wand.drop",2);set(p,"wand.sdrop",2);set(p,"wand.drop.cd",100);
   cmd(p,"function core:class/ability/mage/7/pop_event/4");
   ok(score(p,"wand.drop.cd")==20 && score(p,"wand.drop")==2,"story level II applies both 40-tick reductions");
   for(String name:List.of("wand.rc","wand.src","wand.lc","wand.slc","wand.drop","wand.sdrop","wand.sswap")){set(p,name,1);set(p,name+".cd",100);}
   set(p,"wand.swap",1);set(p,"wand.swap.cd",100);cmd(p,"function core:class/ability/mage/6/reduce_cd");
   for(String name:List.of("wand.rc","wand.src","wand.lc","wand.slc","wand.drop","wand.sdrop","wand.sswap"))ok(score(p,name+".cd")==80 && score(p,name)==1,"mirror reduces "+name+" cooldown only");
   ok(score(p,"wand.swap.cd")==100,"mirror level I excludes itself");
   set(p,"wand.swap",2);cmd(p,"function core:class/ability/mage/6/reduce_cd");ok(score(p,"wand.swap.cd")==80 && score(p,"wand.swap")==2,"mirror level II includes itself");
   set(p,"mage.7.queue.3",2);set(p,"mage.7.queue.2",5);set(p,"wand.sdrop",2);set(p,"wand.rc.cd",100);set(p,"wand.slc.cd",200);
   cmd(p,"function core:class/ability/mage/7/pop_event/6");
   ok(score(p,"wand.rc.cd")==2 && score(p,"wand.slc.cd")==2,"story refreshes two selected cooldowns");
   ok(score(p,"wand.rc")==1 && score(p,"wand.slc")==1,"story refresh preserves skill levels");
   System.out.println("REDUCE_CD_RUNTIME_PASS checks="+checks);h.succeed();
  }catch(Throwable t){t.printStackTrace();h.fail(net.minecraft.network.chat.Component.literal(t.toString()));}
 }
}
