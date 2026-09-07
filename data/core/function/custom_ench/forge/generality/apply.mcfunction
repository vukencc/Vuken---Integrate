execute unless items entity @s armor.* *[enchantments~[{enchantments:"core:forge/pf/generality"}]] unless items entity @s weapon.offhand *[enchantments~[{enchantments:"core:forge/pf/generality"}]] unless items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:forge/pf/generality"}]] run return fail

execute on attacker unless items entity @s saddle *[enchantments~[{enchantments:"operation:stats/vulnerable",levels:{min:1}}]] run return fail

execute store result score @s stdTemp1 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:forge/pf/generality" 10
execute store result score @s stdTemp2 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:forge/pf/generality" 10
execute store result score @s stdTemp3 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:forge/pf/generality" 10
execute store result score @s stdTemp4 run data get entity @s equipment.head.components."minecraft:enchantments"."core:forge/pf/generality" 10
execute store result score @s stdTemp5 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:forge/pf/generality" 10
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."core:forge/pf/generality" 10

scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6

scoreboard players operation @s stdTemp1 *= $-1 math.times
scoreboard players add @s stdTemp1 100

execute store result score @s stdTemp2 run data get storage mob_damage value 10
scoreboard players operation @s stdTemp1 *= @s stdTemp2
execute store result storage mob_damage value double 0.001 run scoreboard players get @s stdTemp1