rotate @s ~5 ~
scoreboard players remove @s alch.life 1
execute if score @s alch.life matches ..0 run return run kill @s
function core:class/ability/alchemist/7/particle_tick
execute if entity @a[distance=..1.25,gamemode=!spectator,nbt=!{Health:0.0f}] run function core:class/ability/alchemist/7/collect
