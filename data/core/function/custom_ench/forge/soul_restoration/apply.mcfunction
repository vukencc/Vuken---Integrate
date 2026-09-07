execute unless items entity @s armor.* *[enchantments~[{enchantments:"core:forge/pf/soul_restoration"}]] unless items entity @s weapon.offhand *[enchantments~[{enchantments:"core:forge/pf/soul_restoration"}]] unless items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:forge/pf/soul_restoration"}]] run return 0

execute store result score @s stdTemp1 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:forge/pf/soul_restoration" 4
execute store result score @s stdTemp2 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:forge/pf/soul_restoration" 4
execute store result score @s stdTemp3 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:forge/pf/soul_restoration" 4
execute store result score @s stdTemp4 run data get entity @s equipment.head.components."minecraft:enchantments"."core:forge/pf/soul_restoration" 4
execute store result score @s stdTemp5 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:forge/pf/soul_restoration" 4
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."core:forge/pf/soul_restoration" 4

scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6

execute store result score @s bacTemp1 run attribute @s max_health get 10
scoreboard players operation @s stdTemp1 *= @s bacTemp1
execute store result storage input health double 0.001 run scoreboard players get @s stdTemp1

function operation:stats/player_heal/single/init with storage input