execute unless score @s class matches 5 run return run function core:class/ability/assassin/clear
execute if entity @s[gamemode=spectator] run return run function core:class/ability/assassin/clear
tag @s add assassin.active
execute unless score @s assassin.pas2 matches 1..2 if score @s assassin.7.count matches 1.. run scoreboard players set @s assassin.7.count 0
execute if score @s assassin.pas2 matches 1 if score @s assassin.7.count matches 3.. run scoreboard players set @s assassin.7.count 2
execute if score @s assassin.pas2 matches 2 if score @s assassin.7.count matches 4.. run scoreboard players set @s assassin.7.count 3
execute if score @s melee.src matches 2 if score @s assassin.3.duration matches ..-1 run function core:class/ability/assassin/3/tick
