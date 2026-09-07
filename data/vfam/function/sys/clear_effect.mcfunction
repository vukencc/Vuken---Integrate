#vfam.p_index: index e_index
#scb: e_index
$execute store result score @s vfam.tmp run data get storage vfam vfam.[$(index)].count 1
scoreboard players remove @s vfam.tmp 1
$execute store result storage vfam vfam.[$(index)].count int 1 run scoreboard players get @s vfam.tmp
$function vfam:clear/remove_vanilla with storage vfam vfam.[$(index)].modifiers.[$(e_index)]
$data remove storage vfam vfam.[$(index)].modifiers.[$(e_index)]