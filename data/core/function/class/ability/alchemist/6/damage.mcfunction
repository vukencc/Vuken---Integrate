effect give @s slowness 2 0 true
effect give @s weakness 2 0 true
$execute if entity @a[nbt={UUID:$(owner)},limit=1] run function core:class/ability/alchemist/8/apply {owner:$(owner),damage:$(damage)}
