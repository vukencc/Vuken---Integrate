###target effect

$execute store result storage clear_modifier index int 1 run scoreboard players get $(target) vfam.index
$data merge storage clear_modifier {effect:$(effect)}
$execute as $(target) run function vfam:clear/effect_clear with storage clear_modifier