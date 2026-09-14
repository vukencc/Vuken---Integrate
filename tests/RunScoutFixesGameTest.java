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

class RunScoutFixesGameTest {
 static final String F="core:class/ability/scout/";
 static GameTestHelper h;
 static int checks;
 static int particles,sounds;
 static List<String> bars=new ArrayList<>();
 public static void main(String[] args)throws Exception {
  SharedConstants.tryDetectVersion();
  TestFunctionLoader.registerLoader(new TestFunctionLoader(){
   public void load(BiConsumer<ResourceKey<Consumer<GameTestHelper>>,Consumer<GameTestHelper>> sink){
    sink.accept(ResourceKey.create(Registries.TEST_FUNCTION,Identifier.parse("test:alchemist")),RunScoutFixesGameTest::run);
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
    if(packet instanceof net.minecraft.network.protocol.game.ClientboundLevelParticlesPacket)particles++;
    if(packet instanceof net.minecraft.network.protocol.game.ClientboundSoundPacket)sounds++;
    if(packet instanceof net.minecraft.network.protocol.game.ClientboundSetActionBarTextPacket bar)bars.add(bar.text().getString());
    super.send(packet,listener,flush);
   }
  };
  new io.netty.channel.embedded.EmbeddedChannel(connection);
  server.getPlayerList().placeNewPlayer(connection,player,cookie);
  player.connection.handleAcceptPlayerLoad(new net.minecraft.network.protocol.game.ServerboundPlayerLoadedPacket());player.setGameMode(net.minecraft.world.level.GameType.SURVIVAL);
  return player;
 }
 static List<Entity> tagged(Entity p,String tag){return h.getLevel().getEntities(p,p.getBoundingBox().inflate(40),e->e.entityTags().contains(tag));}
 static net.minecraft.world.entity.monster.zombie.Zombie enemy(int x,int z){var e=h.spawnWithNoFreeWill(EntityType.ZOMBIE,new BlockPos(x,3,z));e.setNoGravity(true);cmd(e,"attribute @s armor base set 0");return e;}
 static void swap(ServerPlayer p){p.connection.handlePlayerAction(new net.minecraft.network.protocol.game.ServerboundPlayerActionPacket(net.minecraft.network.protocol.game.ServerboundPlayerActionPacket.Action.SWAP_ITEM_WITH_OFFHAND,BlockPos.ZERO,net.minecraft.core.Direction.DOWN));p.inventoryMenu.broadcastChanges();}
 static List<Entity> arrows(ServerPlayer p){return h.getLevel().getEntities(p,p.getBoundingBox().inflate(20),e->e instanceof net.minecraft.world.entity.projectile.arrow.AbstractArrow && e.isAlive());}
 static void click(ServerPlayer p){var weapon=p.getMainHandItem().get(net.minecraft.core.component.DataComponents.PIERCING_WEAPON);ok(weapon!=null,"left click component is available");weapon.attack(p,EquipmentSlot.MAINHAND);}
 static void multishot(ServerPlayer p){
  p.setShiftKeyDown(false);p.setPose(Pose.STANDING);p.setOnGround(true);set(p,"class",4);set(p,"range.lc",2);set(p,"scout.pas3",0);set(p,"scout.pas2",2);set(p,"scout.pas1",0);
  for(String item:List.of("bow","crossbow"))for(int level:new int[]{0,1,2,3,4,255})for(int pitch:new int[]{0,-90,43}){
   cmd(p,"kill @e[type=#arrows]");set(p,"range.lc.cd",0);set(p,"scout.charges",2);set(p,"charging_bow",7);p.setYRot(37);p.setXRot(pitch);
   cmd(p,"item replace entity @s weapon.mainhand with "+item+"[custom_data={range:4.0},enchantments={\"core:inter/arrow_effect\":1,"+(level==0?"":"\"minecraft:multishot\":"+level+",")+"\"minecraft:flame\":1,\"minecraft:punch\":2,\"minecraft:piercing\":2}]");p.inventoryMenu.broadcastChanges();cmd(p,"function operation:trigger/lc_refresh/bow");click(p);
   var volley=arrows(p);int capped=Math.min(level,3),expected=1+2*capped;String label=item+" multishot "+level+" pitch "+pitch;
   ok(volley.size()==expected,label+" arrow count");ok(score(p,"scout.charges")==1 && score(p,"range.lc.cd")==0 && score(p,"charging_bow")==7,label+" consumes one charge and preserves draw progress");
   var angles=new ArrayList<Integer>();boolean states=true,speeds=true,damage=true,chain=true,spread=true;double yawRad=Math.toRadians(37),pitchRad=Math.toRadians(pitch);var forward=new Vec3(-Math.sin(yawRad)*Math.cos(pitchRad),-Math.sin(pitchRad),Math.cos(yawRad)*Math.cos(pitchRad));
   for(var entity:volley){var a=(net.minecraft.world.entity.projectile.arrow.AbstractArrow)entity;states &= a.getOwner()==p && a.getPierceLevel()==2 && a.isOnFire();var velocity=a.getDeltaMovement();speeds &= Math.abs(velocity.length()-3)<0.001;double angle=Math.toDegrees(Math.acos(Math.max(-1,Math.min(1,velocity.normalize().dot(forward)))));int rounded=(int)Math.round(angle);angles.add(rounded);spread &= Math.abs(angle-rounded)<0.02;
    cmd(a,"execute store result score @s scout.tmp run data get entity @s data.damage 1000");damage &= score(a,"scout.tmp")==4000;
    cmd(a,"execute store result score @s scout.tmp run data get entity @s weapon.components.\"minecraft:enchantments\".\"minecraft:punch\"");states &= score(a,"scout.tmp")==2;
    cmd(a,"execute store result score @s scout.tmp run data get entity @s data.scout_chain.level");chain &= score(a,"scout.tmp")==2;
   }
   Collections.sort(angles);var wanted=new ArrayList<Integer>();wanted.add(0);for(int n=1;n<=capped;n++){wanted.add(n*10);wanted.add(n*10);}for(int i=0;i<volley.size();i++)for(int j=i+1;j<volley.size();j++)spread &= volley.get(i).getDeltaMovement().distanceTo(volley.get(j).getDeltaMovement())>0.1;
   ok(speeds && spread && angles.equals(wanted),label+" symmetric view-plane spread at full speed: "+angles+" speeds="+speeds+" spread="+spread+" velocities="+volley.stream().map(Entity::getDeltaMovement).toList());ok(states && damage && chain,label+" every arrow retains shooter damage enchantments and chain snapshot states="+states+" damage="+damage+" chain="+chain);
  }
 }
 static void clock(ServerPlayer p,int n){for(int i=0;i<n;i++){net.minecraft.world.item.enchantment.EnchantmentHelper.tickEffects(h.getLevel(),p);fn(p,"player_tick");}}
 static void repeatInputs(ServerPlayer p){
  cmd(p,"kill @e[type=#arrows]");cmd(p,"kill @e[tag=scout.decoy]");cmd(p,"item replace entity @s weapon.offhand with air");
  p.setShiftKeyDown(false);p.setPose(Pose.STANDING);set(p,"class",4);set(p,"range.lc",2);set(p,"range.swap",1);set(p,"range.sswap",1);set(p,"range.slc",2);set(p,"scout.pas3",2);set(p,"range.drop",0);
  cmd(p,"effect give @s resistance infinite 11 true");cmd(p,"item replace entity @s saddle with saddle[enchantments={\"core:inter/tick_load\":1}]");
  cmd(p,"item replace entity @s weapon.mainhand with bow[custom_data={range:4.0,keep:7},enchantments={\"core:inter/arrow_effect\":1},use_effects={speed_multiplier:0.3}]");p.inventoryMenu.broadcastChanges();clock(p,300);
  // Simulate the interval between swapping hands and broadcasting inventory changes.
  p.setItemSlot(EquipmentSlot.OFFHAND,p.getMainHandItem());p.setItemSlot(EquipmentSlot.MAINHAND,net.minecraft.world.item.ItemStack.EMPTY);fn(p,"8/tick");
  var restored=p.getMainHandItem().isEmpty()?p.getOffhandItem():p.getMainHandItem();var metadata=restored.get(net.minecraft.core.component.DataComponents.CUSTOM_DATA);
  ok(metadata!=null && metadata.copyTag().getIntOr("keep",0)==7,"offhand component restore preserves custom data through F dispatch");
  near(restored.get(net.minecraft.core.component.DataComponents.USE_EFFECTS).speedMultiplier(),1,"offhand is not scanned or rewritten");
  p.inventoryMenu.broadcastChanges();ok(score(p,"range.swap.cd")==300,"F still dispatches after offhand component restoration");clock(p,300);
  // Previously damaged bows still have the trigger enchantment, but no custom_data.
  cmd(p,"item replace entity @s weapon.mainhand with bow[enchantments={\"core:inter/arrow_effect\":1}]");p.inventoryMenu.broadcastChanges();clock(p,1);
  for(int round=0;round<3;round++){
   p.setShiftKeyDown(false);p.setPose(Pose.STANDING);clock(p,1);click(p);clock(p,20);ok(score(p,"scout.charges")==1 && score(p,"range.lc.cd")==0,"round "+round+" retains one charge without refilling");click(p);ok(score(p,"scout.charges")==0 && score(p,"range.lc.cd")==60,"round "+round+" second shot exhausts charges and starts cooldown");int shots=arrows(p).size();fn(p,"1/cast");ok(arrows(p).size()==shots,"round "+round+" rejects extra shot during cooldown");
   swap(p);ok(score(p,"range.swap.cd")==300,"round "+round+" F works on existing bow without custom data");
   p.setShiftKeyDown(true);p.setPose(Pose.CROUCHING);swap(p);ok(score(p,"range.sswap.cd")==240,"round "+round+" sneak F works");clock(p,1);click(p);ok(tagged(p,"scout.decoy").size()==1,"round "+round+" sneak click summons decoy");click(p);ok(tagged(p,"scout.decoy").isEmpty() && score(p,"range.slc.cd")==200,"round "+round+" sneak click detonates and starts cooldown");
   clock(p,1);ok(score(p,"range.slc.cd")==199,"equipment tick decrements cooldown exactly once");clock(p,298);p.setShiftKeyDown(false);p.setPose(Pose.STANDING);clock(p,2);ok(score(p,"range.swap.cd")==0 && score(p,"range.slc.cd")==0 && score(p,"scout.charges")==2,"round "+round+" cooldowns finish and both charges return");
  }
 }
 static void enchantments(ServerPlayer p){
  cmd(p,"kill @e[type=#arrows]");cmd(p,"kill @e[type=zombie]");set(p,"range.lc.cd",0);set(p,"scout.pas1",0);set(p,"scout.pas2",0);set(p,"scout.pas3",0);fn(p,"1/cast");
  var arrow=(net.minecraft.world.entity.projectile.arrow.AbstractArrow)arrows(p).getFirst();
  ok(arrow.getPierceLevel()==2 && arrow.isOnFire(),"quickshot carries Piercing II and Flame");
  var one=enemy(2,5);var two=enemy(2,6);var friendly=h.spawnWithNoFreeWill(EntityType.VILLAGER,new BlockPos(2,3,7));friendly.setNoGravity(true);cmd(p,"summon arrow ~ ~1 ~ {Tags:[\"test.other_arrow\"],data:{damage:100.0}}");cmd(p,"item replace entity @s weapon.mainhand with diamond_sword");arrow.setPos(one.getX(),one.getY()+0.8,one.getZ()-1.2);arrow.setDeltaMovement(0,0,4);arrow.tick();
  System.out.println("PIERCE_DEBUG health="+one.getHealth()+","+two.getHealth()+" knock="+one.getDeltaMovement()+","+two.getDeltaMovement());
  near(friendly.getHealth(),20,"bypass villagers do not receive custom ranged damage");near(one.getHealth(),16,"piercing first victim receives full quickshot damage");near(two.getHealth(),16,"piercing second victim receives full quickshot damage in same tick");
  ok(one.isOnFire() && two.isOnFire(),"Flame burns both pierced victims");ok(one.getDeltaMovement().z>0.5 && two.getDeltaMovement().z>0.5,"Punch II knocks both pierced victims back");
 }
 static void components(ServerPlayer p){
  p.setShiftKeyDown(false);
  for(String item:List.of("bow","crossbow")){
   set(p,"class",4);set(p,"scout.pas3",2);cmd(p,"item replace entity @s weapon.mainhand with "+item+"[custom_data={range:4.0,keep:7},use_effects={speed_multiplier:0.3}]");fn(p,"8/tick");
   near(p.getMainHandItem().get(net.minecraft.core.component.DataComponents.USE_EFFECTS).speedMultiplier(),1,item+" selected skill removes slowdown");
   var stable=p.getMainHandItem().getComponents();fn(p,"8/tick");ok(stable.equals(p.getMainHandItem().getComponents()),item+" repeated tick preserves components");
   cmd(p,"item replace entity @s inventory.0 from entity @s weapon.mainhand");cmd(p,"item replace entity @s weapon.mainhand with air");set(p,"scout.pas3",0);fn(p,"8/tick");near(p.getInventory().getItem(9).get(net.minecraft.core.component.DataComponents.USE_EFFECTS).speedMultiplier(),1,item+" stowed weapon waits until held");
   cmd(p,"item replace entity @s weapon.mainhand from entity @s inventory.0");fn(p,"8/tick");near(p.getMainHandItem().get(net.minecraft.core.component.DataComponents.USE_EFFECTS).speedMultiplier(),0.3,item+" deselected skill restores slowdown on holding");
   set(p,"scout.pas3",1);fn(p,"8/tick");near(p.getMainHandItem().get(net.minecraft.core.component.DataComponents.USE_EFFECTS).speedMultiplier(),1,item+" selecting again reapplies component");
   set(p,"class",2);fn(p,"player_tick");near(p.getMainHandItem().get(net.minecraft.core.component.DataComponents.USE_EFFECTS).speedMultiplier(),0.3,item+" class change restores slowdown");
   ok(p.getMainHandItem().get(net.minecraft.core.component.DataComponents.CUSTOM_DATA).copyTag().getIntOr("keep",0)==7,item+" preserves unrelated custom data");
   cmd(p,"item replace entity @s weapon.mainhand with "+item+"[custom_data={keep:7,core:{scout8:{version:1b}}},use_effects={speed_multiplier:1}]");fn(p,"8/tick");near(p.getMainHandItem().get(net.minecraft.core.component.DataComponents.USE_EFFECTS).speedMultiplier(),0.3,item+" legacy marker restores when held");
   cmd(p,"item replace entity @s weapon.mainhand with "+item+"[use_effects={speed_multiplier:0.6}]");fn(p,"8/tick");near(p.getMainHandItem().get(net.minecraft.core.component.DataComponents.USE_EFFECTS).speedMultiplier(),0.6,item+" unmarked weapon remains unchanged without skill");
  }
 }
 static void run(GameTestHelper helper){h=helper;try{
 cmd(null,"function test:setup");var p=mock("ScoutInputFix");p.setPos(Vec3.atBottomCenterOf(h.absolutePos(new BlockPos(2,3,2))));p.setNoGravity(true);p.setOnGround(true);set(p,"class",4);set(p,"player.Strength",0);set(p,"player.Weakness",0);set(p,"charging_bow",20);set(p,"range.lc",2);set(p,"range.swap",1);set(p,"range.sswap",1);cmd(p,"attribute @s water_movement_efficiency base set 0.01");cmd(p,"item replace entity @s weapon.mainhand with bow[custom_data={range:4.0},enchantments={\"core:inter/arrow_effect\":1,\"minecraft:flame\":1,\"minecraft:punch\":2,\"minecraft:piercing\":2}]");p.inventoryMenu.broadcastChanges();
 fn(p,"player_tick");cmd(p,"function operation:trigger/lc_refresh/bow");particles=0;click(p);ok(arrows(p).size()==1 && score(p,"scout.charges")==1,"actual left click spends first of two charges");ok(particles>0,"manual shot sends particle packets");cmd(p,"function operation:trigger/lc_refresh/bow");click(p);ok(arrows(p).size()==2 && score(p,"scout.charges")==0,"actual second click exhausts the two charges");cmd(p,"function operation:trigger/lc_refresh/bow");ok(!p.getMainHandItem().has(net.minecraft.core.component.DataComponents.PIERCING_WEAPON),"empty charges disable extra left click");
 cmd(p,"kill @e[type=#arrows]");var victim=enemy(2,5);swap(p);ok(p.getMainHandItem().is(net.minecraft.world.item.Items.BOW) && p.getOffhandItem().isEmpty(),"actual F restores legacy bow without s_trigger");ok(score(p,"range.swap.cd")==300 && victim.hasEffect(MobEffects.GLOWING),"actual F triggers skill IV through inventory advancement");
 cmd(p,"item replace entity @s weapon.offhand with shield[custom_data={Offhand:true}]");p.inventoryMenu.broadcastChanges();p.setShiftKeyDown(true);p.setPose(Pose.CROUCHING);swap(p);ok(p.getMainHandItem().is(net.minecraft.world.item.Items.BOW) && p.getOffhandItem().is(net.minecraft.world.item.Items.SHIELD),"F preserves equipped offhand shield");ok(score(p,"range.sswap.cd")==240 && tagged(p,"scout.wind.projectile").size()==1,"actual sneak F triggers skill VII");p.setShiftKeyDown(false);p.setPose(Pose.STANDING);
 set(p,"range.drop",2);set(p,"scout.level",2);set(p,"scout.dash",60);set(p,"scout.air",0);p.setOnGround(false);for(int i=0;i<100;i++)fn(p,"3/tick");ok(score(p,"scout.dash")>0,"landing trigger survives more than three seconds airborne");p.setOnGround(true);particles=0;sounds=0;fn(p,"3/tick");ok(score(p,"scout.dash")==0 && particles>0 && sounds>0,"landing sends particle and sound packets once");
 particles=0;sounds=0;fn(p,"2/particle");ok(particles>40 && sounds>0,"explosion sends enlarged visual and sound feedback");
 enchantments(p);components(p);
 cmd(p,"item replace entity @s weapon.offhand with air");p.inventoryMenu.broadcastChanges();p.setShiftKeyDown(true);p.setPose(Pose.CROUCHING);
 for(String item:List.of("bow","crossbow")){set(p,"range.sswap.cd",0);cmd(p,"item replace entity @s weapon.mainhand with "+item);p.inventoryMenu.broadcastChanges();int before=tagged(p,"scout.wind.projectile").size();swap(p);ok(score(p,"range.sswap.cd")==0 && tagged(p,"scout.wind.projectile").size()==before,"plain "+item+" cannot trigger sneak F skill");}
 repeatInputs(p);
 multishot(p);
 System.out.println("SCOUT_INPUT_FIX_PASS checks="+checks);h.succeed();
 }catch(Throwable t){t.printStackTrace();h.fail(net.minecraft.network.chat.Component.literal(t.toString()));}}
}
