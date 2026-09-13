advancement revoke @s only core:class/scout/using_range
execute unless score @s class matches 4 run return fail
execute unless score @s scout.pas3 matches 1..2 run return fail
scoreboard players set @s scout.using 2
execute unless entity @s[tag=scout.using] run attribute @s movement_speed modifier add core:scout_using 4.0 add_multiplied_total
tag @s add scout.using
execute if score @s scout.pas3 matches 2 run effect give @s slow_falling 1 0 true
