# Fixed geometric particles; cosmetic only.
scoreboard players operation @s alch.fx.phase = @s alch.2.time
scoreboard players set @s alch.fx.divisor 10
scoreboard players operation @s alch.fx.phase %= @s alch.fx.divisor
execute if score @s alch.fx.phase matches 0 run execute at @s anchored eyes positioned ^ ^ ^0 anchored feet run function core:class/ability/alchemist/2/mark_particle
