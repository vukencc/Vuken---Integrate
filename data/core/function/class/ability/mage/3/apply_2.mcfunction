execute if score @s mage.3.in matches 1.. run return run scoreboard players set @s mage.3.in 2
effect give @s slowness 10 2 true
function core:damage/magic/do with storage input
scoreboard players set @s mage.3.in 2