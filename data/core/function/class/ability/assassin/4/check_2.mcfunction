execute unless block ~ ~ ~ #passable run return fail
particle dust_color_transition{from_color:1,to_color:16777215,scale:1} ~ ~ ~ 0 0 0 2 0 normal
particle dust_color_transition{from_color:9102591,to_color:11412479,scale:1} ~ ~ ~ 0 0 0 2 0 normal

execute positioned ~-0.5 ~-0.5 ~-0.5 as @e[type=!#bypass,dx=0.1,dy=0.1,dz=0.1] positioned ~0.5 ~0.5 ~0.5 run function core:class/ability/assassin/4/check_3
scoreboard players remove @s assassin.4.step 1
execute if score @s assassin.4.step matches 1.. positioned ^ ^ ^0.5 run function core:class/ability/assassin/4/check_2
