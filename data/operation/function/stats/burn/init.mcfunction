execute store result score @s stdTemp1 run data get entity @s Fire 0.05
$scoreboard players set @s stdTemp2 $(duration)
scoreboard players operation @s stdTemp2 /= $20 math.times
scoreboard players operation @s stdTemp1 += @s stdTemp2
execute store result entity @s Fire int 20 run scoreboard players get @s stdTemp1