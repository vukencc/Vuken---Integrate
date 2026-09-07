###target id

$execute store result storage clear_modifier index int 1 run scoreboard players get $(target) vfam.index
$data merge storage clear_modifier {id:$(id)}
$execute as $(target) run function vfam:clear/search_clear with storage clear_modifier
