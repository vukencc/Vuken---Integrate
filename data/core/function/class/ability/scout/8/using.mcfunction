advancement revoke @s only core:class/scout/using_range
execute unless score @s class matches 4 run return fail
execute unless score @s scout.pas3 matches 1..2 run return fail
scoreboard players set @s scout.using 2
tag @s add scout.using
function core:class/ability/scout/8/tick
execute if score @s scout.pas3 matches 2 unless predicate {condition:entity_properties,entity:"this",predicate:{effects:{slow_falling:{}}}} run effect give @s slow_falling 1 0 true
