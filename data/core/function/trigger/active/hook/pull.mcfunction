tag @s add stdTemp2
execute as @e[type=arrow,tag=hook_target,predicate=core:player/static] at @s on origin if entity @s[tag=stdTemp2] run function core:trigger/active/hook/set_to_target
function operation:motion/target/init with entity @s SelectedItem.components."minecraft:custom_data".hook
execute as @e[type=arrow,tag=hook_target,predicate=core:player/static] at @s on origin if entity @s[tag=stdTemp2] run kill @n[type=arrow,tag=hook_target]
tag @s remove stdTemp2
kill @e[type=marker,tag=hook_to_target]
function vfam:addp {args:["safe_fall_distance",100,100,"++",hook_land]}