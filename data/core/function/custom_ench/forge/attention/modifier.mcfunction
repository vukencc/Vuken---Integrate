execute unless items entity @p armor.* *[enchantments~[{enchantments:"core:forge/pf/attention"}]] unless items entity @p weapon.offhand *[enchantments~[{enchantments:"core:forge/pf/attention"}]] unless items entity @p weapon.mainhand *[enchantments~[{enchantments:"core:forge/pf/attention"}]] run return fail

execute store result score @p stdTemp1 run data get entity @p equipment.chest.components."minecraft:enchantments"."core:forge/pf/attention" 25
execute store result score @p stdTemp2 run data get entity @p equipment.legs.components."minecraft:enchantments"."core:forge/pf/attention" 25
execute store result score @p stdTemp3 run data get entity @p equipment.offhand.components."minecraft:enchantments"."core:forge/pf/attention" 25
execute store result score @p stdTemp4 run data get entity @p equipment.head.components."minecraft:enchantments"."core:forge/pf/attention" 25
execute store result score @p stdTemp5 run data get entity @p equipment.feet.components."minecraft:enchantments"."core:forge/pf/attention" 25
execute store result score @p stdTemp6 run data get entity @p SelectedItem.components."minecraft:enchantments"."core:forge/pf/attention" 25

scoreboard players operation @p stdTemp1 += @p stdTemp2
scoreboard players operation @p stdTemp1 += @p stdTemp3
scoreboard players operation @p stdTemp1 += @p stdTemp4
scoreboard players operation @p stdTemp1 += @p stdTemp5
scoreboard players operation @p stdTemp1 += @p stdTemp6
scoreboard players add @p stdTemp1 100

$data modify storage temp temp set value $(damage)
execute store result score @p bacTemp1 run data get storage temp temp 100
scoreboard players operation @p stdTemp1 *= @p bacTemp1
execute store result entity @s data.damage double 0.0001 run scoreboard players get @p stdTemp1
scoreboard players set @p ench.attention.count 0