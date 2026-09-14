scoreboard players set @s range.lc 0
scoreboard players set @s scout.pas1 0
scoreboard players set @s range.drop 0
scoreboard players set @s range.swap 0
scoreboard players set @s range.slc 0
scoreboard players set @s scout.pas2 0
scoreboard players set @s range.sswap 0
scoreboard players set @s scout.pas3 0
function core:class/ability/scout/8/clear

execute if score @s class_menu.trigger matches 9 run function core:class/sys/ui/scout
