scoreboard players add @s assassin.3.interval 1
execute if score @s assassin.3.interval matches ..4 run return fail
scoreboard players set @s assassin.3.interval 0

particle witch ~ ~0.1 ~ 0.9 0.2 0.9 0.04 16 normal
particle large_smoke ~ ~0.15 ~ 0.9 0.2 0.9 0.02 12 normal

execute if entity @s[type=player] run return run execute positioned ~-4 ~-1 ~-4 as @e[type=!#bypass,dx=7,dy=3,dz=7] run function core:class/ability/assassin/3/effect_2

execute if entity @s[tag=assassin.3.1] positioned ~-4 ~-1 ~-4 as @e[type=!#bypass,dx=7,dy=3,dz=7] run function core:class/ability/assassin/3/effect_1
execute if entity @s[tag=assassin.3.2] positioned ~-4 ~-1 ~-4 as @e[type=!#bypass,dx=7,dy=3,dz=7] run function core:class/ability/assassin/3/effect_2
