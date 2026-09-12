tag @s add alch.2.marked
execute if score @p[tag=TempPotOwner] pot.lc matches 1 run tag @s add alch.2.marked.1
execute if score @p[tag=TempPotOwner] pot.lc matches 2 run tag @s add alch.2.marked.2
execute store result score @s marker run scoreboard players get @p[tag=TempPotOwner] marker
$data modify entity @s data.alch2.damage set value $(damage)
scoreboard players set @s alch.2.time 80
