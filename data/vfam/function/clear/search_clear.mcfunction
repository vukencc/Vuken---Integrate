$function vfam:clear/remove_vanilla with storage vfam vfam.[$(index)].modifiers.[{id:$(id)}] 

$execute store success score @s vfam.tmp run data remove storage vfam vfam.[$(index)].modifiers.[{id:$(id)}]

execute unless score @s vfam.tmp matches 1 run return fail

$execute store result score @s vfam.tmp run data get storage vfam vfam.[$(index)].count
scoreboard players remove @s vfam.tmp 1
$execute store result storage vfam vfam.[$(index)].count int 1 run scoreboard players get @s vfam.tmp