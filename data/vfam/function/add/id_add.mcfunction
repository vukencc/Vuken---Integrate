$execute store result score @s vfam.tmp run data get storage vfam vfam.[$(index)].count
scoreboard players add @s vfam.tmp 1
$function vfam:add/add_vanilla $(modifier)
$execute store result storage vfam vfam.[$(index)].count int 1 run scoreboard players get @s vfam.tmp

$data modify storage vfam vfam.[$(index)].modifiers append value $(modifier)
