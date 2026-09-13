# Fixed geometric particles; cosmetic only.
scoreboard players operation @s alch.fx.phase = @s alch.life
scoreboard players set @s alch.fx.divisor 5
scoreboard players operation @s alch.fx.phase %= @s alch.fx.divisor
execute if score @s alch.fx.phase matches 0 run function core:class/ability/alchemist/6/border_particle with entity @s data
