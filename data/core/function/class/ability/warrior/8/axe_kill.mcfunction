execute if score @s warrior.pas2 matches 0 run return run scoreboard players set @s warrior.damage_dealt 0
execute unless items entity @s weapon.mainhand #axes run return run scoreboard players set @s warrior.damage_dealt 0

execute if score @s warrior.pas2 matches 1 store result storage input value double 0.015 run scoreboard players get @s warrior.damage_dealt
execute if score @s warrior.pas2 matches 2 store result storage input value double 0.025 run scoreboard players get @s warrior.damage_dealt
tag @s add DamageOwner
execute positioned ^ ^ ^2 as @e[distance=..4,type=!#bypass] run function core:damage/melee/do with storage input
tag @s remove DamageOwner

scoreboard players set @s warrior.damage_dealt 0