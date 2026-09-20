execute unless score @s assassin.5.duration matches ..-1 run return fail
function core:class/ability/assassin/5/reward_2 with entity @s data
scoreboard players reset @s assassin.5.duration
tag @s remove assassin.5.2.apply
