execute at @s anchored eyes positioned ^ ^ ^0 run particle electric_spark ~ ~ ~ 0.2 0.2 0.2 0.1 40 normal
execute at @s run playsound minecraft:block.note_block.pling block @s ~ ~ ~ 0.8 0.25
scoreboard players add @s mage.8.count 1
scoreboard players add @s mage.8.count.2 1
function core:damage/magic/do with storage input