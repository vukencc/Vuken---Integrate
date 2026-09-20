scoreboard players add @s assassin.5.fx 1
execute if score @s assassin.5.fx matches ..1 run return fail
scoreboard players set @s assassin.5.fx 0
execute at @s run function core:class/ability/assassin/5/fx/trail_emit
