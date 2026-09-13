tag @s remove scout.wind
data modify storage core:scout cloud set from entity @s data.scout
execute as @e[type=!#bypass,distance=..5,nbt=!{Health:0.0f}] run function core:class/ability/scout/damage with storage core:scout cloud
execute summon marker run function core:class/ability/scout/7/cloud
function core:class/ability/scout/7/particle
kill @s
