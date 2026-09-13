function core:class/ability/scout/snapshot
data modify storage core:scout chain_shot set from storage core:scout shot
execute store result storage core:scout chain_shot.level int 1 run scoreboard players get @s scout.pas2
execute store result score @s scout.tmp run data get storage core:scout chain_shot.damage 600
execute if score @s scout.pas2 matches 2 store result score @s scout.tmp run data get storage core:scout chain_shot.damage 1000
execute store result storage core:scout chain_shot.value double 0.001 run scoreboard players get @s scout.tmp
