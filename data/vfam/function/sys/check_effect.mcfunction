#vfam.p_index: index e_index
#scb: e_index
$execute store result score @s vfam.tmp run data get storage vfam vfam.[$(index)].modifiers.[$(e_index)].end
execute if score @s vfam.tmp <= @s vfam.timeline run function vfam:sys/clear_effect with storage vfam.p_index
scoreboard players remove @s vfam.e_index 1
execute if score @s vfam.e_index matches ..-1 run return fail
execute store result storage vfam.p_index e_index int 1 run scoreboard players get @s vfam.e_index
function vfam:sys/check_effect with storage vfam.p_index