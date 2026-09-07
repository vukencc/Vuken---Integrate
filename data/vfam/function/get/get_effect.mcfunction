#macro: index effect scale type e_index
#scb: e_index
#return: (storage)result: value
data merge storage vfam.tmp {e:{}}
$data modify storage vfam.tmp e set from storage vfam vfam.[$(index)].modifiers.[$(e_index)]
scoreboard players set @s vfam.tmp 0
$execute if data storage vfam.tmp e{type:$(type),effect:$(effect)} store result score @s vfam.tmp run data get storage vfam.tmp e.value 1000

execute store result score @s vfam.tmp2 run data get storage result value 1000
scoreboard players operation @s vfam.tmp += @s vfam.tmp2
execute store result storage result value double 0.001 run scoreboard players get @s vfam.tmp
scoreboard players remove @s vfam.e_index 1
execute if score @s vfam.e_index matches ..-1 run return fail
execute store result storage get_modifier e_index int 1 run scoreboard players get @s vfam.e_index
function vfam:get/get_effect with storage get_modifier