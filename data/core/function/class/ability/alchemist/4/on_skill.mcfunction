execute unless score @s class matches 3 run return fail
execute unless score @s pot.sswap matches 2 run return fail
effect give @s absorption 5 1 true
execute at @s run function core:class/ability/alchemist/4/shield_particle
execute at @s anchored eyes positioned ^ ^ ^0 anchored feet run function core:class/ability/alchemist/4/view_particle
