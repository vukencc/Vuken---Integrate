execute unless items entity @s armor.* *[enchantments~[{enchantments:"core:forge/pf/research"}]] unless items entity @s weapon.offhand *[enchantments~[{enchantments:"core:forge/pf/research"}]] unless items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:forge/pf/research"}]] run return 0

execute store result score @s stdTemp1 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:forge/pf/research" 2
execute store result score @s stdTemp2 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:forge/pf/research" 2
execute store result score @s stdTemp3 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:forge/pf/research" 2
execute store result score @s stdTemp4 run data get entity @s equipment.head.components."minecraft:enchantments"."core:forge/pf/research" 2
execute store result score @s stdTemp5 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:forge/pf/research" 2
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."core:forge/pf/research" 2

scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6

execute store result storage input value int 1 run scoreboard players get @s stdTemp1
function core:data/mana_add with storage input