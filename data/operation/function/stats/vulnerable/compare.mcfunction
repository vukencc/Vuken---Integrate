execute store result score @s stdTemp2 run data get entity @s equipment.saddle.components."minecraft:enchantments"."operation:stats/vulnerable"
execute if score @s stdTemp1 < @s stdTemp2 run return fail
return 1
