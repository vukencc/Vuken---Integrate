$data modify storage vfam.tmp effect set from storage vfam vfam.[$(index)].modifiers.[$(e_index)].effect

$execute if data storage vfam.tmp {effect:$(effect)} run function vfam:sys/clear_effect with storage clear_modifier

scoreboard players remove @s vfam.e_index 1
execute if score @s vfam.e_index matches ..-1 run return fail
execute store result storage clear_modifier e_index int 1 run scoreboard players get @s vfam.e_index
function vfam:clear/check_effect with storage clear_modifier