scoreboard players operation @s bacTemp1 = @s mage.7.queue.1
scoreboard players operation @s mage.7.queue.1 = @s mage.7.queue.2
scoreboard players operation @s mage.7.queue.2 = @s mage.7.queue.3
$scoreboard players set @s mage.7.queue.3 $(id)

execute if score @s bacTemp1 matches 1 run function core:class/ability/mage/7/pop_event/1
execute if score @s bacTemp1 matches 2 run function core:class/ability/mage/7/pop_event/2
execute if score @s bacTemp1 matches 3 run function core:class/ability/mage/7/pop_event/3
execute if score @s bacTemp1 matches 4 run function core:class/ability/mage/7/pop_event/4
execute if score @s bacTemp1 matches 5 run function core:class/ability/mage/7/pop_event/5
execute if score @s bacTemp1 matches 6 run function core:class/ability/mage/7/pop_event/6