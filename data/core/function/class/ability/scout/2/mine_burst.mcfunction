data modify storage core:scout mine set from entity @s data.scout
execute as @e[type=!#bypass,distance=..2.5,nbt=!{Health:0.0f}] run function core:class/ability/scout/damage with storage core:scout mine
function core:class/ability/scout/2/particle
kill @s
