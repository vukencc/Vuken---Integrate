tag @e[tag=scout.hit_target] remove scout.hit_target
tag @n[type=!#bypass,nbt={HurtTime:10s}] add scout.hit_target
function core:custom_ench/range/basic_damage with entity @s data
execute if entity @s[tag=starlit_as] run function core:custom_ench/range/starlit/effect with entity @s data
function operation:event/player/arrow_hurt_entity/trigger
execute as @n[tag=scout.hit_target] at @s run function operation:event/enemy/take_damage/direct_ranged
function core:class/ability/scout/6/hit
execute if entity @s[tag=scout.explosive] positioned as @n[tag=scout.hit_target] run function core:class/ability/scout/2/impact
tag @e[tag=scout.hit_target] remove scout.hit_target
