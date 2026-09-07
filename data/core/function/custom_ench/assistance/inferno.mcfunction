execute store result score @s bacTemp1 run data get entity @s Fire
scoreboard players operation @s bacTemp1 %= $20 math.times
execute unless score @s bacTemp1 matches 19 run return fail

scoreboard players set $inferno_cal marker 0
execute as @a run function core:custom_ench/assistance/inferno_cal
execute store result storage temp temp int 1 run scoreboard players get $inferno_cal marker
function core:custom_ench/assistance/inferno_dmg with storage temp