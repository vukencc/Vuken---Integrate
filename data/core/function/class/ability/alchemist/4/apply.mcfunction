# Preserve stronger absorption; refresh level I so an exhausted shield refills.
execute unless entity @s[nbt={AbsorptionAmount:0.0f}] if predicate {condition:entity_properties,entity:this,predicate:{effects:{absorption:{amplifier:{min:1}}}}} run return run function core:class/ability/alchemist/4/next
effect clear @s absorption
execute if score @s pot.sswap matches 1 run effect give @s absorption 5 0 true
execute if score @s pot.sswap matches 2 run effect give @s absorption 3 0 true
function core:class/ability/alchemist/4/next
particle cherry_leaves ~ ~1 ~ 0.4 0.8 0.4 0.05 12 normal
