scoreboard players remove @s alch.life 1
execute if score @s alch.life matches ..0 run return run kill @s
particle happy_villager ~ ~0.5 ~ 0.15 0.2 0.15 0 1 normal
execute if entity @a[distance=..1.25,gamemode=!spectator,nbt=!{Health:0.0f}] run function core:class/ability/alchemist/7/collect
