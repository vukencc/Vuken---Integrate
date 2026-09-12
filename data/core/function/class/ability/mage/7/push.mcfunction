scoreboard players set @s mage.7.time 0

$execute if score @s mage.7.queue.3 matches 1.. run return run function core:class/ability/mage/7/pop {id:$(id)}

$execute if score @s mage.7.queue.1 matches 0 run return run scoreboard players set @s mage.7.queue.1 $(id)
$execute if score @s mage.7.queue.2 matches 0 run return run scoreboard players set @s mage.7.queue.2 $(id)
$execute if score @s mage.7.queue.3 matches 0 run return run scoreboard players set @s mage.7.queue.3 $(id)
