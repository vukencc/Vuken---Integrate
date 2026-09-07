$attribute @s attack_damage base set $(melee)
item modify entity @s weapon.mainhand [{function:set_enchantments,enchantments:{power:1}}]
execute store result entity @s SelectedItem.components."minecraft:enchantments"."minecraft:power" int 0.33 run data get entity @s data.mob.range
$attribute @s max_health base set $(mhp)
$data modify entity @s Health set value $(mhp)