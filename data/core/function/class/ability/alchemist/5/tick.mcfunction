scoreboard players remove @s alch.life 1
execute if score @s alch.life matches ..0 run return run function core:class/ability/alchemist/5/expire
execute unless predicate {condition:entity_properties,entity:this,predicate:{vehicle:{}}} run return run function core:class/ability/alchemist/5/explode
particle witch ~ ~ ~ 0.1 0.1 0.1 0.01 2 normal
