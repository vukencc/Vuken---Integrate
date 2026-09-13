execute unless entity @p[tag=TempPotOwner,scores={pot.lc=1..2}] run return fail
function core:class/ability/alchemist/2/clear
tag @s add alch.2.marked
execute if score @p[tag=TempPotOwner] pot.lc matches 1 run tag @s add alch.2.marked.1
execute if score @p[tag=TempPotOwner] pot.lc matches 2 run tag @s add alch.2.marked.2
scoreboard players operation @s alch.2.owner = @p[tag=TempPotOwner] marker
$data modify entity @s data.alch2.damage set value $(damage)
scoreboard players set @s alch.2.time 80
execute at @s anchored eyes positioned ^ ^ ^0 anchored feet run function core:class/ability/alchemist/2/mark_particle
