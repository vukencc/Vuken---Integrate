execute if score @s scout.life matches ..0 run return run kill @s
scoreboard players remove @s scout.life 1
tag @e[tag=scout.cloud.center] remove scout.cloud.center
tag @s add scout.cloud.center
execute as @e[type=!#bypass,distance=..5,nbt=!{Health:0.0f}] run function core:class/ability/scout/7/pull
tag @s remove scout.cloud.center
execute if data entity @s data.scout{level:2} as @e[type=!#bypass,distance=..5,nbt=!{Health:0.0f}] run effect give @s weakness 1 1 true
particle cloud ~ ~0.3 ~ 1.6 0.25 1.6 0.005 5 normal
