scoreboard players remove @s scout.life 1
execute if score @s scout.life matches ..0 run return run kill @s
particle dust{color:[1.0,0.3,0.05],scale:0.8} ~ ~0.15 ~ 0.25 0 0.25 0 2 normal
execute if score @s scout.life matches ..190 if entity @e[type=!#bypass,distance=..1.25,nbt=!{Health:0.0f}] run function core:class/ability/scout/2/mine_burst
