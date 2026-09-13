scoreboard players remove @s scout.life 1
execute unless predicate {condition:entity_properties,entity:this,predicate:{vehicle:{}}} run return run function core:class/ability/scout/7/explode
execute if score @s scout.life matches ..0 run return run function core:class/ability/scout/7/expire
particle cloud ~ ~ ~ 0.08 0.08 0.08 0.01 2 normal
