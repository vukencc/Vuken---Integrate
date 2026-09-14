scoreboard players set @s wand.lc 0
scoreboard players set @s wand.rc 0
scoreboard players set @s wand.src 0
scoreboard players set @s wand.drop 0
scoreboard players set @s wand.slc 0
scoreboard players set @s wand.swap 0
scoreboard players set @s wand.sdrop 0
scoreboard players set @s mage.pas1 0

execute if score @s class_menu.trigger matches 9 run function core:class/sys/ui/mage
