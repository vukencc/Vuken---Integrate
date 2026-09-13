$execute in minecraft:overworld if entity @e[type=villager,tag=scout.decoy,nbt={data:{scout:{owner:$(owner)}}}] run return run function core:class/ability/scout/5/found {owner:$(owner)}
$execute in minecraft:the_nether if entity @e[type=villager,tag=scout.decoy,nbt={data:{scout:{owner:$(owner)}}}] run return run function core:class/ability/scout/5/found {owner:$(owner)}
$execute in minecraft:the_end if entity @e[type=villager,tag=scout.decoy,nbt={data:{scout:{owner:$(owner)}}}] run return run function core:class/ability/scout/5/found {owner:$(owner)}
return 0
