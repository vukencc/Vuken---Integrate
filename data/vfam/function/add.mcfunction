###target effect id value duration type
$function vfam:remove {target:"$(target)",id:$(id)}
$data merge storage add_modifier {index:-1,modifier:{effect:$(effect),id:$(id),value:$(value),end:0,type:$(type),index:-1}}
$execute store result storage add_modifier index int 1 run scoreboard players get $(target) vfam.index
$execute store result storage add_modifier modifier.index int 1 run scoreboard players get $(target) vfam.index
$scoreboard players operation @p vfam.tmp = $(target) vfam.timeline
$scoreboard players add @p vfam.tmp $(duration)
execute store result storage add_modifier modifier.end int 1 run scoreboard players get @p vfam.tmp
function vfam:add/id_add with storage add_modifier
