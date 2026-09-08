# One lifecycle driver avoids ordering conflicts with the generic lifetime enchantment.
execute if entity @s[tag=mage.5.active] run return run function core:class/ability/mage/5/active
execute unless predicate {condition:entity_properties,entity:this,predicate:{vehicle:{}}} run return run function core:class/ability/mage/5/effect

# A projectile that never hits anything expires without creating a black hole.
function core:class/ability/mage/5/particle
