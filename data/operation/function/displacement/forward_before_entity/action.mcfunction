function operation:displacement/forward_before_entity/with_event

tp @s ~ ~ ~

execute unless block ~ ~ ~ #passable run return run tp @s ^ ^ ^-0.5
execute unless block ~ ~1 ~ #passable run return run tp @s ^ ^ ^-0.5

execute positioned ~-0.5 ~ ~-0.5 if entity @e[type=!#bypass,dx=0.1,dy=1.1,dz=0.1] positioned ~0.5 ~ ~0.5 run return run tp @s ^ ^ ^-0.5

scoreboard players remove @s stdTemp1 1
execute if score @s stdTemp1 matches 0.. at @s positioned ^ ^ ^0.5 run function operation:displacement/forward_before_entity/action