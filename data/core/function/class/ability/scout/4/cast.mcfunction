execute unless score @s class matches 4 run return fail
execute unless score @s range.swap matches 1..2 run return fail
execute unless items entity @s weapon.mainhand #range run return fail
execute if score @s range.swap.cd matches 1.. run return fail
execute unless data entity @s SelectedItem.components."minecraft:custom_data".range run return fail
function core:class/ability/scout/snapshot
execute store result storage core:scout shot.level int 1 run scoreboard players get @s range.swap
execute store result score @s scout.tmp run data get storage core:scout shot.damage 700
execute if score @s range.swap matches 2 store result score @s scout.tmp run data get storage core:scout shot.damage 1000
execute store result storage core:scout shot.value double 0.001 run scoreboard players get @s scout.tmp
execute store result score @s range.swap.cd run function core:custom_ench/aptitude/cal {time:300}
execute as @e[type=!#bypass,distance=..16,nbt=!{Health:0.0f}] at @s run function core:class/ability/scout/4/mark
function core:class/ability/scout/4/particle
playsound block.beacon.activate player @s ~ ~ ~ 0.7 1.7
