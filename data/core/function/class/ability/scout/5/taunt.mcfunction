scoreboard players set @s scout.pulse 0
data modify storage core:scout taunt set from entity @s data.scout
execute as @e[type=!#bypass,distance=..10,nbt=!{Health:0.0f}] run function core:class/ability/scout/5/anger with storage core:scout taunt
