tag @s add scout.mine
data modify entity @s data.scout set from storage core:scout hit
execute store result score @s scout.tmp run data get entity @s data.scout.damage 800
execute store result entity @s data.scout.value double 0.001 run scoreboard players get @s scout.tmp
scoreboard players set @s scout.life 200
