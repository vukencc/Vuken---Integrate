function core:class/ability/scout/snapshot
execute store result storage core:scout shot.level int 1 run scoreboard players get @s scout.pas1
execute store result score @s scout.pas1.cd run function core:custom_ench/aptitude/cal {time:240}
