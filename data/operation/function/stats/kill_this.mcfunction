execute on vehicle if entity @s[tag=kill_this_with] run function operation:stats/kill_this
execute if entity @s[type=player] run return fail
tp @s ~ ~-100 ~
kill @s