advancement revoke @s only core:class/warrior/2

execute unless score @s class matches 1 run return fail
execute if score @s melee.src matches 0 run return fail

execute unless predicate {condition:entity_properties,entity:"this",predicate:{effects:{absorption:{}}}} run return fail

execute store result score @s stdTemp1 run data get entity @s active_effects.[{id:"minecraft:absorption"}].duration 0.05
execute if score @s melee.src matches 1 run scoreboard players add @s stdTemp1 2
execute if score @s melee.src matches 2 run scoreboard players add @s stdTemp1 4
execute if score @s melee.src matches 1 store result storage input duration int 1 run scoreboard players get @s stdTemp1
execute if score @s melee.src matches 2 store result storage input duration int 1 run scoreboard players get @s stdTemp1
execute store result storage input level int 1 run data get entity @s active_effects.[{id:"minecraft:absorption"}].amplifier

function core:class/ability/warrior/2/effect with storage input