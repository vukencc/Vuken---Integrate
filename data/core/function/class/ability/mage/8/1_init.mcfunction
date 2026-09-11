scoreboard players set @s mage.8.count 0
scoreboard players set $temp stdTemp1 0
execute as @a run function core:class/ability/mage/8/1_cal
execute if score $temp stdTemp1 matches 0 run return fail

execute anchored eyes positioned ^ ^ ^0 run particle firefly ~ ~-0.5 ~ 0.4 0.4 0.4 0.1 35 normal
playsound block.bamboo.break hostile @a ~ ~ ~ 1 2 1

tag @p[scores={mage.pas1=1..,class=2}] add DamageOwner
execute store result storage input value double 1.0 run scoreboard players get $temp stdTemp1
execute at @s as @e[type=!#bypass,distance=..3] run function core:damage/magic/do with storage input
tag @a remove DamageOwner