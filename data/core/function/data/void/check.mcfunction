$execute store result score @s stdTemp1 if entity @e[type=armor_stand,tag=void_marker,scores={marker=$(id)}]
execute if score @s stdTemp1 matches 1 run return fail
$kill @e[type=armor_stand,tag=void_marker,scores={marker=$(id)}]
execute summon armor_stand run function core:data/void/init with storage temp_id