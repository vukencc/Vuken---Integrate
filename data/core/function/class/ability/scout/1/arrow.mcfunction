data modify storage core:scout shot set from storage core:scout volley.shot
data modify entity @s Owner set from storage core:scout volley.shot.owner
data modify entity @s weapon set from storage core:scout volley.shot.weapon
data modify entity @s weapon.components."minecraft:enchantments"."core:inter/arrow_effect" set value 1
data modify entity @s PierceLevel set from storage core:scout volley.shot.pierce_level
execute if data storage core:scout volley.shot{flame:1b} run data merge entity @s {Fire:100s}
data modify entity @s data.scout set from storage core:scout volley.shot
tag @s add scout.quickshot
function core:class/ability/scout/1/set_motion with storage core:scout volley.direction
data modify entity @s Motion set from storage motion set_forward
function core:custom_ench/range/arrow_center
particle crit ~ ~ ~ 0.08 0.08 0.08 0.05 8 normal
