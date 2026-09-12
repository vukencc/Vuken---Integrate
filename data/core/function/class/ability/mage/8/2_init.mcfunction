scoreboard players set @s mage.8.count.2 0
scoreboard players set $temp stdTemp1 0
execute as @a run function core:class/ability/mage/8/2_cal
execute if score $temp stdTemp1 matches 0 run return fail

execute anchored eyes positioned ^ ^ ^0 run particle infested ~ ~-0.5 ~ 1 0.1 1 0.1 35 normal
playsound block.bamboo.break hostile @a ~ ~ ~ 1 0.5 1
playsound block.bamboo.break hostile @a ~ ~ ~ 1 0.5 1
playsound block.bamboo.break hostile @a ~ ~ ~ 1 0.5 1

tag @p[scores={mage.pas1=2,class=2}] add DamageOwner
execute store result storage input value double 1.0 run scoreboard players get $temp stdTemp1
execute at @s as @e[type=!#bypass,distance=..5] run function core:damage/magic/do with storage input
tag @a remove DamageOwner