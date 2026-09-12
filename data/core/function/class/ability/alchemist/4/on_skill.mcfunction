execute unless score @s class matches 3 run return fail
execute unless score @s pot.sswap matches 2 run return fail
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{absorption:{amplifier:{min:2}}}}} run return fail
effect clear @s absorption
effect give @s absorption 20 1 true
