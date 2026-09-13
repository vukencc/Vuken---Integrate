# Arrow executor; caller has identified the directly hit victim before secondary damage begins.
execute unless data entity @s data.scout_chain run return fail
data modify storage core:scout chain set from entity @s data.scout_chain
execute if data storage core:scout chain{level:1} positioned as @n[tag=scout.hit_target] as @e[type=!#bypass,tag=!scout.hit_target,distance=..6,nbt=!{Health:0.0f},sort=nearest,limit=1] run function core:class/ability/scout/6/target
execute if data storage core:scout chain{level:2} positioned as @n[tag=scout.hit_target] as @e[type=!#bypass,tag=!scout.hit_target,distance=..6,nbt=!{Health:0.0f},sort=nearest,limit=2] run function core:class/ability/scout/6/target
