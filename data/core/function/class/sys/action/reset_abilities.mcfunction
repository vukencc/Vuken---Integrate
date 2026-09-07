scoreboard players operation @s left_class_points = @s max_class_points
execute if score @s class matches 1 run function core:class/sys/action/warrior/reset
execute if score @s class matches 2 run function core:class/sys/action/mage/reset
execute if score @s class matches 3 run function core:class/sys/action/alchemist/reset
execute if score @s class matches 4 run function core:class/sys/action/scout/reset
execute if score @s class matches 5 run function core:class/sys/action/assassin/reset

