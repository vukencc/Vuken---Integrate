execute store result score @s stdTemp1 run function core:damage/range/calculation
$data modify storage range_get_return value set value $(value)
execute store result score @s stdTemp2 run data get storage range_get_return value 100
scoreboard players operation @s stdTemp1 *= @s stdTemp2
execute store result storage range_get_return value double 0.0001 run scoreboard players get @s stdTemp1
return run data get storage range_get_return value