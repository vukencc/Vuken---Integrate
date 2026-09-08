execute unless score @s wand.swap matches 1..2 run return fail
execute if score @s wand.swap.cd matches 1.. run return fail
execute store result score @s wand.swap.cd run function core:custom_ench/aptitude/cal {time:260}

scoreboard players set @s mage.6.delay -20