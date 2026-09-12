scoreboard players remove @s alch.life 1
execute if score @s alch.life matches ..0 run return run kill @s
scoreboard players remove @s alch.pulse 1
execute if score @s alch.pulse matches ..0 run function core:class/ability/alchemist/6/pulse with entity @s data
particle spore_blossom_air ~ ~0.15 ~ 0.7 0.05 0.7 0 2 normal
