execute unless score @s alch.gifts matches 1.. run return fail
execute if entity @s[gamemode=spectator] run return fail
execute if entity @s[nbt={Health:0.0f}] run return fail
execute if score @s alch.heal.cd matches 1.. run return fail
execute store result score @s alch.tmp run data get entity @s Health 1000
execute store result score @s alch.tmp2 run attribute @s max_health get 1000
execute if score @s alch.tmp < @s alch.tmp2 run function core:class/ability/alchemist/7/heal
