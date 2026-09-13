# Full weapon damage, independent of the current bow draw progress.
data modify storage core:scout shot set value {damage:0.0,owner:[I;0,0,0,0],level:0}
data modify storage core:scout shot.owner set from entity @s UUID
scoreboard players operation @s scout.saved = @s charging_bow
scoreboard players set @s charging_bow 20
execute store result storage core:scout shot.damage double 0.0001 run function core:damage/range/base
scoreboard players operation @s charging_bow = @s scout.saved
