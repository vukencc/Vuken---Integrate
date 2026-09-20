execute unless block ~ ~ ~ #passable run return fail
particle dust_color_transition{from_color:8046335,to_color:16777215,scale:1.1} ~ ~ ~ 0.12 0.12 0.12 0 3 normal
$execute positioned ~-0.7 ~-0.7 ~-0.7 as @e[type=!#bypass,tag=!assassin.moon.hit,dx=0.4,dy=0.4,dz=0.4] at @s run function core:class/ability/assassin/7/hit {owner:$(owner),value:$(value)}
scoreboard players remove @s assassin.7.step 1
$execute if score @s assassin.7.step matches 1.. positioned ^ ^ ^0.5 run function core:class/ability/assassin/7/ray {owner:$(owner),value:$(value)}
