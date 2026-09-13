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
class CheckMage5 {
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
  });
  builder.add(net.minecraft.core.registries.Registries.ENCHANTMENT,context->{
   vanilla.lookupOrThrow(net.minecraft.core.registries.Registries.ENCHANTMENT).listElements().forEach(h->context.register(h.key(),h.value()));
   // Only the identity is needed by command predicates; no enchantment effect is executed.
   context.register(net.minecraft.resources.ResourceKey.create(net.minecraft.core.registries.Registries.ENCHANTMENT,Identifier.parse("core:inter/wand_effect")),vanilla.lookupOrThrow(net.minecraft.core.registries.Registries.ENCHANTMENT).listElements().findFirst().orElseThrow().value());
  });
  var extra=builder.build(net.minecraft.core.RegistryAccess.fromRegistryOfRegistries(net.minecraft.core.registries.BuiltInRegistries.REGISTRY));
  var lookup=net.minecraft.core.HolderLookup.Provider.create(java.util.stream.Stream.concat(vanilla.listRegistries().filter(r->!r.key().equals(net.minecraft.core.registries.Registries.DAMAGE_TYPE)&&!r.key().equals(net.minecraft.core.registries.Registries.ENCHANTMENT)),java.util.stream.Stream.of(extra.lookupOrThrow(net.minecraft.core.registries.Registries.DAMAGE_TYPE),extra.lookupOrThrow(net.minecraft.core.registries.Registries.ENCHANTMENT))));
  var commands = new Commands(Commands.CommandSelection.ALL, Commands.createValidationContext(lookup));
  var dispatcher = commands.getDispatcher();
  var source = Commands.createCompilationContext(PermissionSet.ALL_PERMISSIONS);
  var paths=new ArrayList<Path>();
  try(var s=Files.list(root.resolve("data/core/function/class/ability/mage/5"))) {s.filter(p->p.toString().endsWith(".mcfunction")).sorted().forEach(paths::add);}
  paths.add(root.resolve("data/operation/function/trigger/slc.mcfunction"));
  paths.add(root.resolve("data/operation/function/stats/vulnerable/compare.mcfunction"));
  int count=0;
  for(Path path:paths) {
   var fn=CommandFunction.fromLines(Identifier.parse("test:"+path.getFileName().toString().replace(".mcfunction","")),dispatcher,source,Files.readAllLines(path));
   for(int level=1;level<=2;level++) {
    var data=new CompoundTag();
    data.putIntArray("owner",new int[]{-123456,234567,-345678,456789});
    data.putDouble("value",3.75);data.putDouble("radius",level==1?3.5:5.0);
    data.putInt("vulnerable",level==1?2:4);data.putInt("lifetime",level==1?100:160);
    data.putDouble("x",-120.125);data.putDouble("y",64.5);data.putDouble("z",32.75);
    fn.instantiate(data,dispatcher);
   }
   System.out.println("PASS "+root.relativize(path));count++;
  }
  System.out.println("Minecraft "+SharedConstants.getCurrentVersion().name()+": "+count+" functions compiled; both macro parameter sets instantiated.");
 }
}
