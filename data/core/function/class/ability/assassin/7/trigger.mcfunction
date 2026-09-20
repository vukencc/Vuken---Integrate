execute unless score @s class matches 5 run return fail
execute unless score @s assassin.pas2 matches 1..2 run return fail
execute unless score @s assassin.7.count matches 1.. run return fail
execute if entity @s[tag=assassin.moon.busy] run return fail
tag @s add assassin.moon.busy
tag @s add assassin.skill.damage
scoreboard players remove @s assassin.7.count 1

data modify storage core:assassin moon set value {value:6.0}
data modify storage core:assassin moon.owner set from entity @s UUID
execute if score @s assassin.pas2 matches 2 run data modify storage core:assassin moon.value set value 12.0

execute store result storage core:assassin moon.value double 1.0 run function core:damage/melee/get with storage core:assassin moon

execute at @s run function core:class/ability/assassin/7/release with storage core:assassin moon
function core:class/ability/assassin/7/display
tag @s remove assassin.moon.busy
tag @s remove assassin.skill.damage
