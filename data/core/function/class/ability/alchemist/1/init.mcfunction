execute as @p[tag=TempPotOwner] unless score @s class matches 3 run return fail
execute as @p[tag=TempPotOwner] if score @s alch.pas1 matches 0 run return fail

execute as @p[tag=TempPotOwner] if score @s alch.pas1 matches 1 store result storage input value double 0.1 run function core:damage/magic/get {value:10}
execute as @p[tag=TempPotOwner] if score @s alch.pas1 matches 2 store result storage input value double 0.1 run function core:damage/magic/get {value:20}

function core:class/ability/alchemist/1/vln_add

tag @p[tag=TempPotOwner] add DamageOwner
function core:damage/magic/do with storage input
tag @a remove DamageOwner

execute at @s anchored eyes positioned ^ ^ ^0 run particle crimson_spore ~ ~ ~ 0.4 1 0.4 0.1 30 normal