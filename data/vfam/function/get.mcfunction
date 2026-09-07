#target effect type scale

$data merge storage get_modifier {index:-1,effect:$(effect),scale:$(scale),type:"$(type)"}

execute if data storage get_modifier {type:"+"} run data merge storage get_modifier {type:add_value}
execute if data storage get_modifier {type:"++"} run data merge storage get_modifier {type:add_multiplied_base}
execute if data storage get_modifier {type:"+++"} run data merge storage get_modifier {type:add_multiplied_total}

$execute store result storage get_modifier index int 1 run scoreboard players get $(target) vfam.index
data merge storage result {value:0}
execute as @p run function vfam:get/list with storage get_modifier
$return run data get storage result value $(scale)
