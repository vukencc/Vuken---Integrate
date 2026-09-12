# Called as the caster after normal potion damage has been calculated.
data modify storage core:alchemist pot set value {spring:0,pool:0,coefficient:1.0,damage:0.0,radius:0.0,pool_damage:0.0,interval:20}
data modify storage core:alchemist pot.owner set from entity @s UUID
data modify storage core:alchemist pot.damage set from storage element damage
data modify storage core:alchemist pot.radius set from storage element radius
execute store result storage core:alchemist pot.coefficient double 0.0001 run scoreboard players get @s stdTemp1
execute if score @s class matches 3 store result storage core:alchemist pot.spring int 1 run scoreboard players get @s alch.pas4
execute if score @s class matches 3 if score @s alch.pas2 matches 1..2 if predicate operation:stats/sneaking unless score @s alch.pool.cd matches 1.. run function core:class/ability/alchemist/6/prepare
