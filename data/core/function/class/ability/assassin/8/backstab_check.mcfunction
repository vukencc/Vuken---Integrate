# Compare victim yaw to the horizontal bearing toward the attacker; independent of world coordinates.
execute store result score @s assassin.8.facing run data get entity @s Rotation[0] 100
execute at @s facing entity @p[tag=assassin.8.attacker] feet summon marker run function core:class/ability/assassin/8/bearing
scoreboard players operation @s assassin.8.facing -= $assassin.bearing assassin.8.facing
scoreboard players operation @s assassin.8.facing %= $36000 assassin.8.facing
execute if score @s assassin.8.facing matches 18001.. run scoreboard players remove @s assassin.8.facing 36000
execute if score @s assassin.8.facing matches ..-18001 run scoreboard players add @s assassin.8.facing 36000
execute if score @s assassin.8.facing matches 9001.. run function core:class/ability/assassin/8/backstab_damage
execute if score @s assassin.8.facing matches ..-9001 run function core:class/ability/assassin/8/backstab_damage
