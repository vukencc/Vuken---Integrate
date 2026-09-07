execute positioned ^ ^ ^2.3 run particle explosion ~ ~0.2 ~ 0 0 0 1.5 1 normal
execute positioned ^ ^ ^2.3 run particle cloud ~ ~ ~ 0.9 0.1 0.9 0.6 35 normal
playsound block.stone.break hostile @p ~ ~ ~ 3 0.8 0.7
playsound block.stone.break hostile @p ~ ~ ~ 3 0.8 0.7
playsound block.stone.break hostile @p ~ ~ ~ 3 0.8 0.7
playsound block.stone.break hostile @p ~ ~ ~ 3 0.8 0.7
$execute positioned ^ ^ ^2.3 as @e[type=!#minecraft:bypass,distance=..3,nbt=!{HurtTime:10s}] run scoreboard players add @s enemy.Taken.Melee $(quake)

execute positioned ^ ^ ^2.3 as @e[type=!#minecraft:bypass,distance=..3,nbt=!{HurtTime:10s}] run function core:damage/melee/direct_apply