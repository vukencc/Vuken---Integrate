scoreboard players remove @s alch.life 1
execute if score @s alch.life matches ..0 run return run kill @s
scoreboard players remove @s alch.pulse 1
execute if score @s alch.pulse matches ..0 run function core:class/ability/alchemist/6/pulse with entity @s data
function core:class/ability/alchemist/6/particle_tick
