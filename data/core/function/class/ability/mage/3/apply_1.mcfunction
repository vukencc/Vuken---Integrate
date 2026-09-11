execute if score @s mage.3.in matches 1.. run return run scoreboard players set @s mage.3.in 2
effect give @s slowness 6 1 true
scoreboard players add @s mage.8.count 1
scoreboard players add @s mage.8.count.2 1
function core:damage/magic/do with storage input
scoreboard players set @s mage.3.in 2