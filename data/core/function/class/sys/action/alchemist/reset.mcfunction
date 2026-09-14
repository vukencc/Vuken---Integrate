scoreboard players set @s alch.pas1 0
scoreboard players set @s pot.lc 0
scoreboard players set @s pot.swap 0
scoreboard players set @s pot.sswap 0
scoreboard players set @s pot.drop 0
scoreboard players set @s alch.pas2 0
scoreboard players set @s alch.pas3 0
scoreboard players set @s alch.pas4 0
function core:class/ability/alchemist/clear_skills

execute if score @s class_menu.trigger matches 9 run function core:class/sys/ui/alchemist
