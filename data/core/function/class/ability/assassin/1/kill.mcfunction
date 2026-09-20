execute unless score @s assassin.rc.duration matches ..-1 run return fail
execute if score @s melee.rc matches 0 run return fail
execute unless score @s class matches 5 run return fail

execute if score @s melee.rc matches 1 run function core:class/ability/util/reduce_cd_pattern {scb:melee.rc,value:20}
execute if score @s melee.rc matches 2 run function core:class/ability/util/reduce_cd_pattern {scb:melee.rc,value:40}