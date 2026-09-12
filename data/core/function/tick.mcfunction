#singleton for loop
function core:data/s_tick
execute if score $s_vir repeat_25_timing matches 10 run function core:data/s_low_tick
function core:dungeon/_tick_
function map_only:area/tick
execute as @a at @s run function core:class/ability/alchemist/player_tick
