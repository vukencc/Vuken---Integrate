execute unless items entity @s armor.* *[enchantments~[{enchantments:"core:forge/pf/parry"}]] unless items entity @s weapon.offhand *[enchantments~[{enchantments:"core:forge/pf/parry"}]] run return fail

scoreboard players add @s ench.parry.timer 1
execute if score @s ench.parry.timer matches 300.. unless predicate {condition:entity_properties,entity:"this",predicate:{effects:{absorption:{}}}} at @s run function core:custom_ench/forge/parry/apply
