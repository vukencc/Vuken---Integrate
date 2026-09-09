execute store result score @s stdTemp1 run data get entity @s equipment.saddle.components.minecraft:enchantments."operation:stats/vulnerable" 2
execute store result entity @s equipment.saddle.components."minecraft:enchantments"."operation:stats/vulnerable" int 1 run scoreboard players get @s stdTemp1

scoreboard players operation @s stdTemp1 = @s stats.vulnerable.duration
scoreboard players add @s stdTemp1 40
execute if score @p wand.slc matches 2 if score @p wand.sdrop matches 2 run scoreboard players add @s stdTemp1 60
scoreboard players operation @s stats.vulnerable.duration = @s stdTemp1

