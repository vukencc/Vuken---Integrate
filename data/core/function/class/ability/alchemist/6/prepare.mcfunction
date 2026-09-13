execute store result storage core:alchemist pot.pool int 1 run scoreboard players get @s alch.pas2
execute if score @s alch.pas2 matches 1 store result storage core:alchemist pot.pool_damage double 0.00015 run data get storage element damage 1000
execute if score @s alch.pas2 matches 2 store result storage core:alchemist pot.pool_damage double 0.00025 run data get storage element damage 1000
execute if score @s alch.pas2 matches 2 run data modify storage core:alchemist pot.interval set value 15
execute store result score @s pot.src.cd run function core:custom_ench/aptitude/cal {time:200}
function core:class/ability/alchemist/4/on_skill
