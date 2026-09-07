execute if score @s ench.sidestep.time matches -120 run function core:custom_ench/forge/sidestep/clear
execute if score @s ench.sidestep.time matches ..0 run return fail

execute if entity @s[tag=EnchSidestepBuff] run return fail
execute unless items entity @s armor.* *[enchantments~[{enchantments:"core:forge/pf/sidestep"}]] unless items entity @s weapon.offhand *[enchantments~[{enchantments:"core:forge/pf/sidestep"}]] unless items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:forge/pf/sidestep"}]] run return 0
tag @s add EnchSidestepBuff

execute store result score @s stdTemp1 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:forge/pf/sidestep" 20
execute store result score @s stdTemp2 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:forge/pf/sidestep" 20
execute store result score @s stdTemp3 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:forge/pf/sidestep" 20
execute store result score @s stdTemp4 run data get entity @s equipment.head.components."minecraft:enchantments"."core:forge/pf/sidestep" 20
execute store result score @s stdTemp5 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:forge/pf/sidestep" 20
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."core:forge/pf/sidestep" 20

scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6

execute store result storage input value double 0.01 run scoreboard players get @s stdTemp1
function core:custom_ench/forge/sidestep/apply with storage input