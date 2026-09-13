scoreboard players remove @s alch.life 1
execute if score @s alch.life matches ..0 run return run function core:class/ability/alchemist/5/expire
execute unless predicate {condition:entity_properties,entity:this,predicate:{vehicle:{}}} run return run function core:class/ability/alchemist/5/explode
function core:class/ability/alchemist/5/particle_tick
