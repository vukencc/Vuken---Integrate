execute if entity @s[tag=scout.using] run attribute @s movement_speed modifier remove core:scout_using
tag @s remove scout.using
scoreboard players set @s scout.using 0
# Short effect leases expire naturally, preserving stronger effects from other skills.
