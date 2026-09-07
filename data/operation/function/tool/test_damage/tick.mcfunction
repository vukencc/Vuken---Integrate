execute store result score @s stdTemp1 run data get entity @s Health 100
execute if score @s stdTemp1 matches 102400 run return fail

scoreboard players remove @s data_delay 1
execute unless score @s data_delay matches ..0 run return fail

scoreboard players set @s stdTemp2 102400
scoreboard players operation @s stdTemp2 -= @s stdTemp1
execute store result storage temp temp double 0.05 run scoreboard players get @s stdTemp2
execute store result score @s stdTemp3 run data get storage temp temp 10

scoreboard players operation @s stdTemp4 = @s stdTemp3
scoreboard players operation @s stdTemp4 %= $10 math.times
scoreboard players operation @s stdTemp3 /= $10 math.times

execute store result storage string a int 1 run scoreboard players get @s stdTemp3
execute store result storage string b int 1 run scoreboard players get @s stdTemp4

execute at @s run function operation:tool/test_damage/display with storage string

scoreboard players set @s data_delay 2
function operation:tool/test_damage/heal
tag @s remove first_striked

# Special for pf enchantment Observation
# to be removed in other maps
tag @s remove EnchObsShot