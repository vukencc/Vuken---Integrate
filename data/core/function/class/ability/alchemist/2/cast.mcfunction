execute if score @s pot.lc.cd matches 1.. run return fail

execute store result score @s stdTemp1 run data get entity @s SelectedItem.components."minecraft:custom_data".ArcanePot.cost 80
execute if score @s class matches 3 if score @s alch.pas1 matches 2 store result score @s stdTemp1 run data get entity @s SelectedItem.components."minecraft:custom_data".ArcanePot.cost 64
execute if score @s player.ManaBar < @s stdTemp1 run return fail

execute store result score @s pot.lc.cd run function core:custom_ench/aptitude/cal {time:100}

tag @s add alch.2.casting
execute rotated ~-30 ~ run function core:trigger/basic/arcane_pot/cast
execute rotated ~ ~ run function core:trigger/basic/arcane_pot/cast
tag @s add alch.no_pot_cost
execute rotated ~30 ~ run function core:trigger/basic/arcane_pot/cast
tag @s remove alch.no_pot_cost
tag @s remove alch.2.casting

function core:class/ability/alchemist/4/on_skill

