scoreboard players remove @s alch.gifts 1
scoreboard players set @s alch.heal.cd 20
function operation:stats/player_heal/single/init {health:1}
function core:class/ability/alchemist/7/refresh
execute at @s run function core:class/ability/alchemist/7/heal_particle
execute at @s anchored eyes positioned ^ ^ ^0 anchored feet run function core:class/ability/alchemist/7/view_particle
function core:class/ability/alchemist/7/show_stacks
