execute if score @s pot.lc.cd matches 1.. run return fail
execute store result score @s pot.lc.cd run function core:custom_ench/aptitude/cal {time:100}

execute rotated ~-30 ~ run function core:trigger/basic/arcane_pot/cast
execute rotated ~ ~ run function core:trigger/basic/arcane_pot/cast