effect give @s slow_falling 1 0 true
execute if block ~ ~-1 ~ air run setblock ~ ~-1 ~ tinted_glass
$tp @s @n[type=armor_stand,tag=void_marker,scores={marker=$(id)}]

execute at @s run playsound block.end_portal.spawn hostile @s ~ ~-0.3 ~ 0.8