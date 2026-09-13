# Preserve stronger absorption; refresh level I so an exhausted shield refills.
execute if score @s pot.sswap matches 1 run effect give @s absorption 5 0 true
execute if score @s pot.sswap matches 2 run effect give @s absorption 3 0 true
function core:class/ability/alchemist/4/next
execute at @s run function core:class/ability/alchemist/4/particle
