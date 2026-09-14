import java.nio.file.*;
import java.util.*;
import net.minecraft.SharedConstants;
import net.minecraft.server.Bootstrap;
import net.minecraft.commands.*;
import net.minecraft.commands.functions.CommandFunction;
import net.minecraft.server.permissions.PermissionSet;
import net.minecraft.data.registries.VanillaRegistries;
import net.minecraft.resources.Identifier;
import net.minecraft.nbt.CompoundTag;
class CheckScout {
 public static void main(String[] args) throws Exception {
  SharedConstants.tryDetectVersion(); Bootstrap.bootStrap();
  Path root=Path.of(args[0]);
  var vanilla=VanillaRegistries.createLookup();
  var builder=new net.minecraft.core.RegistrySetBuilder();
  var damageJson=com.google.gson.JsonParser.parseString(Files.readString(root.resolve("data/core/damage_type/custom_magic.json")));
  var damage=net.minecraft.world.damagesource.DamageType.DIRECT_CODEC.parse(com.mojang.serialization.JsonOps.INSTANCE,damageJson).getOrThrow();
  builder.add(net.minecraft.core.registries.Registries.DAMAGE_TYPE,context->{
   net.minecraft.world.damagesource.DamageTypes.bootstrap(context);
   context.register(net.minecraft.resources.ResourceKey.create(net.minecraft.core.registries.Registries.DAMAGE_TYPE,Identifier.parse("core:custom_magic")),damage);
   context.register(net.minecraft.resources.ResourceKey.create(net.minecraft.core.registries.Registries.DAMAGE_TYPE,Identifier.parse("core:custom_ranged")),damage);
  });
  builder.add(net.minecraft.core.registries.Registries.ENCHANTMENT,context->{
   vanilla.lookupOrThrow(net.minecraft.core.registries.Registries.ENCHANTMENT).listElements().forEach(h->context.register(h.key(),h.value()));
   // Only the identity is needed by command predicates; no enchantment effect is executed.
   try(var paths=Files.walk(root.resolve("data"))) {
    paths.filter(p->p.toString().endsWith(".json") && p.toString().replace('\\','/').contains("/enchantment/") && !p.toString().replace('\\','/').contains("/tags/")).forEach(p->{
     var relative=root.resolve("data").relativize(p);String ns=relative.getName(0).toString();
     if(ns.equals("minecraft"))return;
     String id=ns+":"+relative.subpath(2,relative.getNameCount()).toString().replace('\\','/').replace(".json","");
     context.register(net.minecraft.resources.ResourceKey.create(net.minecraft.core.registries.Registries.ENCHANTMENT,Identifier.parse(id)),vanilla.lookupOrThrow(net.minecraft.core.registries.Registries.ENCHANTMENT).listElements().findFirst().orElseThrow().value());
    });
   }catch(Exception e){throw new RuntimeException(e);}
  });
  var extra=builder.build(net.minecraft.core.RegistryAccess.fromRegistryOfRegistries(net.minecraft.core.registries.BuiltInRegistries.REGISTRY));
  var lookup=net.minecraft.core.HolderLookup.Provider.create(java.util.stream.Stream.concat(vanilla.listRegistries().filter(r->!r.key().equals(net.minecraft.core.registries.Registries.DAMAGE_TYPE)&&!r.key().equals(net.minecraft.core.registries.Registries.ENCHANTMENT)),java.util.stream.Stream.of(extra.lookupOrThrow(net.minecraft.core.registries.Registries.DAMAGE_TYPE),extra.lookupOrThrow(net.minecraft.core.registries.Registries.ENCHANTMENT))));
  var commands = new Commands(Commands.CommandSelection.ALL, Commands.createValidationContext(lookup));
  var dispatcher = commands.getDispatcher();
  var source = Commands.createCompilationContext(PermissionSet.ALL_PERMISSIONS);
  var paths=new ArrayList<Path>();
  try(var stream=Files.walk(root.resolve("data/core/function/class/ability/scout"))) {stream.filter(p->p.toString().endsWith(".mcfunction")).sorted().forEach(paths::add);}
  for(String p:List.of("core/function/trigger/basic/arcane_pot/cast","core/function/trigger/basic/arcane_pot/set_attributes","core/function/trigger/basic/arcane_pot/apply","core/function/tick","core/function/init","core/function/data/player/tick","core/function/data/_tick_","core/function/class/sys/action/alchemist/reset","operation/function/event/enemy/on_death/trigger","operation/function/trigger/drop","operation/function/trigger/swap","operation/function/trigger/sswap","operation/function/stats/timing_limited/init")) paths.add(root.resolve("data/"+p+".mcfunction"));
  for(String p:List.of("core/function/custom_ench/range/arrow_hit","core/function/custom_ench/range/capture_arrow","core/function/custom_ench/range/impact_target","core/function/custom_ench/range/resolve_hit","core/function/custom_ench/range/basic_damage","core/function/custom_ench/range/arrow_as_center","core/function/custom_ench/range/effects_transform_pre","core/function/custom_ench/range/tick_load","operation/function/container/swap_holding","operation/function/container/offhand_to_main","operation/function/trigger/lc_refresh/bow","core/function/data/drop_offhand")) paths.add(root.resolve("data/"+p+".mcfunction"));
  int count=0;
  for(Path path:paths) {
   var fn=CommandFunction.fromLines(Identifier.parse("test:"+path.getFileName().toString().replace(".mcfunction","")),dispatcher,source,Files.readAllLines(path));
   for(int level=1;level<=2;level++) {
    var data=new CompoundTag();
    data.putString("slot","hotbar.0");data.putInt("nbt_slot",0);data.putString("scout8_slot","weapon.mainhand");
    var applied=new CompoundTag();applied.putFloat("speed_multiplier",1);data.put("scout8_applied_use_effects",applied);
    var original=new CompoundTag();original.putFloat("speed_multiplier",0.3f);data.put("scout8_original_use_effects",original);data.put("scout8_custom_data",new CompoundTag());
    data.putInt("cooldown",200);data.putIntArray("target",new int[]{1,2,3,4});data.putIntArray("owner",new int[]{-123456,234567,-345678,456789});
    data.putDouble("value",0.235);data.putDouble("damage",7.375);data.putDouble("pool_damage",1.106);data.putDouble("coefficient",1.25);data.putDouble("base",4.5);data.putInt("spring",level);data.putInt("level",level);data.putInt("interval",level==1?20:15);data.putDouble("speed",2.5);data.putInt("color",12345);data.putInt("id",1);data.putInt("duration",120);data.putDouble("radius",level==1?3.5:5.0);
    data.putInt("vulnerable",level==1?2:4);data.putInt("lifetime",level==1?100:160);
    data.putDouble("x",-120.125);data.putDouble("y",64.5);data.putDouble("z",32.75);
    fn.instantiate(data,dispatcher);
   }
   System.out.println("PASS "+root.relativize(path));count++;
  }
  var ops=lookup.createSerializationContext(com.mojang.serialization.JsonOps.INSTANCE);
  net.minecraft.world.item.enchantment.Enchantment.DIRECT_CODEC.parse(ops,com.google.gson.JsonParser.parseString(Files.readString(root.resolve("data/core/enchantment/class/scout/entity.json")))).getOrThrow();
  net.minecraft.advancements.Advancement.CODEC.parse(ops,com.google.gson.JsonParser.parseString(Files.readString(root.resolve("data/core/advancement/class/scout/using_range.json")))).getOrThrow();
  System.out.println("PASS new enchantment and advancement codecs");
  System.out.println("Minecraft "+SharedConstants.getCurrentVersion().name()+": "+count+" functions compiled; both macro parameter sets instantiated.");
 }
}
