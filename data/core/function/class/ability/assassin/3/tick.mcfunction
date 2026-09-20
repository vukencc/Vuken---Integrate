scoreboard players add @s assassin.3.interval 1
execute if score @s assassin.3.interval matches ..4 run return fail
scoreboard players set @s assassin.3.interval 0

execute if entity @s[type=player] run return run execute positioned ~-4 ~-1 ~-4 as @e[type=!#bypass,dx=7,dy=3,dz=7] run function core:class/ability/assassin/3/effect_2

execute if entity @s[tag=assassin.3.1] positioned ~-4 ~-1 ~-4 as @e[type=!#bypass,dx=7,dy=3,dz=7] run function core:class/ability/assassin/3/effect_1
execute if entity @s[tag=assassin.3.2] positioned ~-4 ~-1 ~-4 as @e[type=!#bypass,dx=7,dy=3,dz=7] run function core:class/ability/assassin/3/effect_2

function core:class/ability/assassin/3/particle