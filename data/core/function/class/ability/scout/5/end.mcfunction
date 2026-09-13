execute unless entity @s[tag=scout.decoy] run return fail
tag @s remove scout.decoy
data modify storage core:scout decoy_end set from entity @s data.scout
execute as @e[type=!#bypass,distance=..5,nbt=!{Health:0.0f}] run function operation:stats/blinded/init {duration:60}
execute if data storage core:scout decoy_end{level:2} as @e[type=!#bypass,distance=..5,nbt=!{Health:0.0f}] run function core:class/ability/scout/damage with storage core:scout decoy_end
function core:class/ability/scout/5/particle
function core:class/ability/scout/5/remove
