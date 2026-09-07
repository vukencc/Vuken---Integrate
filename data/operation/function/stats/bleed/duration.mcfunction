scoreboard players remove @s stats.bleed.duration 1
execute if score @s stats.bleed.duration matches 0 run return run function operation:stats/bleed/end

execute if score $s_vir repeat_20_timing matches 10 store result storage temp temp int 1 run data get entity @s equipment.saddle.components."minecraft:enchantments"."operation:stats/bleed" 1
execute if score $s_vir repeat_20_timing matches 10 run function operation:stats/bleed/damage with storage temp