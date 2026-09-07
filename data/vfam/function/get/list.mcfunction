#macro: index effect scale type
#return: (storage)result: value
$execute store result score @s vfam.e_index run data get storage vfam vfam.[$(index)].count
scoreboard players remove @s vfam.e_index 1
execute if score @s vfam.e_index matches ..-1 run return fail
execute store result storage get_modifier e_index int 1 run scoreboard players get @s vfam.e_index
function vfam:get/get_effect with storage get_modifier