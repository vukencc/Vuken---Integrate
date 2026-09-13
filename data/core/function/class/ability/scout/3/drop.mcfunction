data modify storage core:scout dropped.owner set from entity @s UUID
execute store result score @s scout.tmp run function core:class/ability/scout/3/restore with storage core:scout dropped
execute if score @s scout.tmp matches 1 run function core:class/ability/scout/3/cast
