execute unless items entity @s armor.* *[enchantments~[{enchantments:"core:forge/pf/cruelty"}]] unless items entity @s weapon.offhand *[enchantments~[{enchantments:"core:forge/pf/cruelty"}]] unless items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:forge/pf/cruelty"}]] run return fail

execute store result score @s stdTemp1 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:forge/pf/cruelty" 5
execute store result score @s stdTemp2 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:forge/pf/cruelty" 5
execute store result score @s stdTemp3 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:forge/pf/cruelty" 5
execute store result score @s stdTemp4 run data get entity @s equipment.head.components."minecraft:enchantments"."core:forge/pf/cruelty" 5
execute store result score @s stdTemp5 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:forge/pf/cruelty" 5
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."core:forge/pf/cruelty" 5

scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6
scoreboard players add @s stdTemp1 5

execute store result storage input duration double 1 run scoreboard players get @s stdTemp1
execute on attacker as @s at @s run function operation:stats/blinded/init with storage input
