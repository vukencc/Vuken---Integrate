function core:custom_ench/range/basic_damage with entity @s data
execute if entity @s[tag=starlit_as] run function core:custom_ench/range/starlit/effect with entity @s data
function operation:event/player/arrow_hurt_entity/trigger
execute as @n[type=!#bypass,nbt={HurtTime:10s}] at @s run function operation:event/enemy/take_damage/direct_ranged
execute if entity @s[tag=scout.explosive] positioned as @n[type=!#bypass,nbt={HurtTime:10s}] run function core:class/ability/scout/2/impact
