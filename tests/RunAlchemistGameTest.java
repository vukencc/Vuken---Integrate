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

class RunAlchemistGameTest {
 static final String F="core:class/ability/alchemist/";
 static GameTestHelper h;
 static int checks;
 public static void main(String[] args)throws Exception {
  SharedConstants.tryDetectVersion();
  TestFunctionLoader.registerLoader(new TestFunctionLoader(){
   public void load(BiConsumer<ResourceKey<Consumer<GameTestHelper>>,Consumer<GameTestHelper>> sink){
    sink.accept(ResourceKey.create(Registries.TEST_FUNCTION,Identifier.parse("test:alchemist")),RunAlchemistGameTest::run);
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
   ServerPlayer p=mock("Alchemist");
   ServerPlayer ally=mock("Ally");
   Vec3 pos=Vec3.atBottomCenterOf(h.absolutePos(new BlockPos(2,3,2)));
   p.setPos(pos);ally.setPos(pos.add(8,0,0));p.setNoGravity(true);ally.setNoGravity(true);
   fn(p,"player_init");fn(ally,"player_init");set(p,"class",3);set(ally,"class",1);
   set(p,"player.Weakness",0);set(p,"player.Strength",0);set(p,"player.ManaBar",4000);
   cmd(p,"attribute @s movement_efficiency base set 0.01");cmd(p,"attribute @s luck base set 20");cmd(ally,"attribute @s luck base set 20");
   cmd(p,"item replace entity @s weapon.mainhand with glass_bottle[custom_data={IsArcanePot:true,ArcanePot:{damage:4.5,cost:10.0,radius:3.0,speed:1.0,color:65280}}]");
   set(p,"pot.swap",1);set(p,"pot.swap.cd",0);fn(p,"3/cast");
   near(p.getAttributeValue(Attributes.MOVEMENT_EFFICIENCY),0.01235,"3 I fractional damage bonus 23.5%");
   ok(score(p,"player.ManaBar")==3600,"3 I consumes one potion cost");
   fn(p,"3/cast");ok(score(p,"player.ManaBar")==3600,"3 cooldown rejects recast");
   ticks(p,120);near(p.getAttributeValue(Attributes.MOVEMENT_EFFICIENCY),0.01,"3 buff expires after 120 ticks");
   set(p,"pot.swap",2);set(p,"pot.swap.cd",0);set(p,"alch.pas1",2);fn(p,"3/cast");
   near(p.getAttributeValue(Attributes.MOVEMENT_EFFICIENCY),0.01325,"3 II fractional bonus 32.5%");
   ok(score(p,"player.ManaBar")==3280,"3 honors level II mana discount");ticks(p,160);
   set(p,"pot.swap.cd",0);set(p,"player.ManaBar",0);fn(p,"3/cast");ok(score(p,"alch.elixir")==0,"3 rejects insufficient mana");
   set(p,"pot.sswap",1);set(p,"pot.sswap.cd",0);fn(p,"4/cast");
   ticks(p,99);ok(!p.hasEffect(MobEffects.ABSORPTION),"4 I waits five seconds");ticks(p,1);near(p.getAbsorptionAmount(),4,"4 I first shield");
   p.setAbsorptionAmount(0);ticks(p,100);near(p.getAbsorptionAmount(),4,"4 refills an exhausted shield");ticks(p,200);ok(score(p,"alch.garden")==0,"4 stops after twenty seconds");
   set(p,"pot.sswap",2);fn(p,"4/on_skill");near(p.getAbsorptionAmount(),8,"4 II skill hook grants absorption II");
   p.setAbsorptionAmount(0);fn(p,"4/on_skill");near(p.getAbsorptionAmount(),8,"4 II repeated skill refills shield");
   set(p,"pot.sswap.cd",0);fn(p,"4/cast");p.setAbsorptionAmount(0);ticks(p,60);near(p.getAbsorptionAmount(),4,"4 II replenishes empty shields every three seconds");
   set(p,"pot.sswap",0);cmd(p,"effect clear @s absorption");
   set(p,"pot.drop",1);set(p,"alch.kills",0);set(p,"alch.charges",0);
   for(int i=0;i<2;i++)fn(p,"5/kill");ok(score(p,"alch.charges")==0,"5 no charge before three kills");fn(p,"5/kill");ok(score(p,"alch.charges")==1,"5 I three kills give one charge");
   for(int i=0;i<9;i++)fn(p,"5/kill");ok(score(p,"alch.charges")==2,"5 I charge cap two");
   set(p,"pot.drop",2);set(p,"alch.charges",0);for(int i=0;i<6;i++)fn(p,"5/kill");ok(score(p,"alch.charges")==3,"5 II grants two charges, cap three");
   cmd(p,"attribute @s movement_efficiency modifier remove vanilla_mme_modifier");
   fn(p,"5/cast");ok(score(p,"alch.charges")==2,"5 cast consumes exactly one charge");
   var balls=h.getLevel().getEntities(p,p.getBoundingBox().inflate(5),e->e.entityTags().contains("alch.bomb.projectile"));
   ok(balls.size()==1 && balls.getFirst().isNoGravity(),"5 creates one gravity-free projectile");
   near(balls.getFirst().getDeltaMovement().length(),2.5,"5 projectile speed");
   cmd(p,"kill @e[tag=alch.bomb.projectile]");cmd(p,"kill @e[tag=alch.bomb]");
   fn(ally,"7/pickup {level:1}");near(ally.getAttributeValue(Attributes.LUCK),21,"7 other classes receive defence bonus");
   for(int i=0;i<5;i++)fn(ally,"7/pickup {level:1}");ok(score(ally,"alch.gifts")==3,"7 I stack cap three");near(ally.getAttributeValue(Attributes.LUCK),23,"7 I defence +15%");
   for(int i=0;i<5;i++)fn(ally,"7/pickup {level:2}");ok(score(ally,"alch.gifts")==5,"7 II stack cap five");near(ally.getAttributeValue(Attributes.LUCK),27,"7 II defence +35%");
   set(ally,"player.ManaBar",0);ticks(ally,20);ok(score(ally,"player.ManaBar")==70,"7 fractional mana produces exactly 35% bonus");
   ally.setHealth(18);ticks(ally,1);near(ally.getHealth(),19,"7 one gift heals one health");ok(score(ally,"alch.gifts")==4,"7 healing consumes a stack");
   ticks(ally,20);near(ally.getHealth(),20,"7 heals to maximum without overheal");ok(score(ally,"alch.gifts")==3,"7 stops consuming at full health");
   cmd(ally,"effect give @s weakness 30 1 true");cmd(ally,"effect give @s unluck 30 1 true");set(ally,"player.Weakness",-40);set(ally,"player.Vulnerable",20);fn(ally,"8/cleanse");
   ok(!ally.hasEffect(MobEffects.WEAKNESS)&&!ally.hasEffect(MobEffects.UNLUCK),"8 removes player weakness and vulnerability effects");ok(score(ally,"player.Weakness")==0&&score(ally,"player.Vulnerable")==0,"8 clears derived player scores");
   var enemy=h.spawnWithNoFreeWill(EntityType.ZOMBIE,new BlockPos(4,3,2));enemy.setNoGravity(true);enemy.setSilent(true);
   cmd(enemy,"attribute @s armor base set 0");cmd(enemy,"attribute @s max_health base set 100");enemy.setHealth(100);
   cmd(enemy,"effect give @s slowness 30 1 true");cmd(enemy,"effect give @s weakness 30 0 true");fn(enemy,"8/count");
   ok(score(enemy,"alch.debuffs")==2&&score(enemy,"alch.strong")==1,"8 counts distinct debuffs and level II effects");
   fn(enemy,"8/damage {owner:"+uuid(p)+",damage:4.5,spring:2,coefficient:1.0}");near(enemy.getHealth(),89.5,"8 II deals base + two per debuff + two per strong debuff");
   cmd(enemy,"effect clear @s");enemy.setHealth(100);
   cmd(null,"data modify storage core:alchemist pool set value {owner:"+uuid(p)+",radius:3.0,pool_damage:1.5,interval:20}");
   cmd(enemy,"execute summon armor_stand run function "+F+"6/set");
   var pools=h.getLevel().getEntities(enemy,enemy.getBoundingBox().inflate(4),e->e.entityTags().contains("alch.pool"));ok(pools.size()==1,"6 creates one pool");var pool=pools.getFirst();
   near(enemy.getHealth(),98.5,"6 immediate pulse");for(int i=0;i<119;i++)pool.baseTick();near(enemy.getHealth(),91,"6 I six pulses over six seconds");pool.baseTick();ok(!pool.isAlive(),"6 pool expires at 120 ticks");
   enemy.setHealth(100);cmd(null,"data modify storage core:alchemist pool set value {owner:"+uuid(p)+",radius:3.0,pool_damage:2.5,interval:15}");cmd(enemy,"execute summon armor_stand run function "+F+"6/set");
   pool=h.getLevel().getEntities(enemy,enemy.getBoundingBox().inflate(4),e->e.entityTags().contains("alch.pool")&&e.isAlive()).getFirst();for(int i=0;i<119;i++)pool.baseTick();near(enemy.getHealth(),80,"6 II eight pulses at 15-tick intervals");pool.baseTick();
   set(p,"alch.pas3",1);set(p,"alch.gift.cd",0);cmd(enemy,"function "+F+"7/on_enemy_death");
   ok(h.getLevel().getEntities(enemy,enemy.getBoundingBox().inflate(4),e->e.entityTags().contains("alch.gift")).size()==1,"7 enemy death creates a gift at death position");cmd(enemy,"function "+F+"7/on_enemy_death");
   ok(h.getLevel().getEntities(enemy,enemy.getBoundingBox().inflate(4),e->e.entityTags().contains("alch.gift")).size()==1,"7 cooldown prevents duplicate gifts");
   var gift=h.getLevel().getEntities(enemy,enemy.getBoundingBox().inflate(4),e->e.entityTags().contains("alch.gift")).getFirst();
   ally.setPos(gift.position());gift.baseTick();ok(!gift.isAlive()&&score(ally,"alch.gifts")==4,"7 enchantment tick collects a gift exactly once");ally.setPos(pos.add(8,0,0));
   enemy.setHealth(100);cmd(enemy,"effect clear @s");set(p,"alch.pas4",0);fn(p,"5/cast");
   var bomb=h.getLevel().getEntities(p,p.getBoundingBox().inflate(5),e->e.entityTags().contains("alch.bomb")).getFirst();
   cmd(p,"kill @e[tag=alch.bomb.projectile]");bomb.baseTick();near(enemy.getHealth(),93.25,"5 detached bomb explodes for 150% snapshot damage");ok(!bomb.isAlive(),"5 explosion cleans the carrier");
   set(p,"alch.charges",0);cmd(p,"item replace entity @s weapon.mainhand with air");
   cmd(p,"summon item ~ ~ ~ {Thrower:"+uuid(ally)+",Item:{id:diamond,count:1},PickupDelay:100}");
   cmd(p,"summon item ~1 ~ ~ {Thrower:"+uuid(p)+",Item:{id:glass_bottle,count:1,components:{custom_data:{IsArcanePot:true,ArcanePot:{damage:4.5,cost:10.0,radius:3.0,speed:1.0,color:65280}}}},PickupDelay:100}");
   fn(p,"5/drop");ok(p.getMainHandItem().is(net.minecraft.world.item.Items.GLASS_BOTTLE),"5 drop restores only the caster's bottle even without charges");
   ok(h.getLevel().getEntities(p,p.getBoundingBox().inflate(4),e->e instanceof net.minecraft.world.entity.item.ItemEntity).size()==1,"5 leaves the closer teammate's item untouched");
   set(p,"pot.src.cd",0);set(p,"alch.pas2",2);set(p,"player.ManaBar",4000);set(p,"marker",77);p.setShiftKeyDown(true);p.setPose(Pose.CROUCHING);
   cmd(p,"function core:trigger/basic/arcane_pot/cast");cmd(p,"function core:trigger/basic/arcane_pot/cast");p.setShiftKeyDown(false);p.setPose(Pose.STANDING);
   var pots=h.getLevel().getEntities(p,p.getBoundingBox().inflate(4),e->e.entityTags().contains("pot_as"));ok(pots.size()==2,"6 integrates with ordinary potion casting");
   int reserved=0;for(var pot:pots){cmd(pot,"execute store result score @s alch.tmp run data get entity @s data.alch.pool");if(score(pot,"alch.tmp")==2)reserved++;}
   ok(reserved==1&&score(p,"pot.src.cd")==200,"6 only the first potion reserves the passive cooldown (reserved="+reserved+", cd="+score(p,"pot.src.cd")+")");
   for(var pot:pots){pot.baseTick();pot.baseTick();ok(pot.isPassenger(),"6 potion carrier survives flight initialization");}
   cmd(p,"kill @e[type=splash_potion]");for(var pot:pots)pot.baseTick();
   ok(h.getLevel().getEntities(p,p.getBoundingBox().inflate(5),e->e.entityTags().contains("alch.pool")&&e.isAlive()).size()==1,"6 real potion landing creates exactly one pool");
   System.out.println("ALCHEMIST_RUNTIME_PASS checks="+checks);h.succeed();
  }catch(Throwable t){t.printStackTrace();h.fail(net.minecraft.network.chat.Component.literal(t.toString()));}
 }
}
