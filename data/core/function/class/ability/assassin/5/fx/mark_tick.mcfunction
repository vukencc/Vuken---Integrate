# The existing mark lifetime owns this visual; never search for marked targets here.
execute unless score @s assassin.5.duration matches ..-1 run return fail
scoreboard players add @s assassin.5.fx 1
execute if score @s assassin.5.fx matches 5 at @s rotated 0 0 run function core:class/ability/assassin/5/fx/bind
execute if score @s assassin.5.fx matches 10 at @s rotated 45 0 run function core:class/ability/assassin/5/fx/bind
execute if score @s assassin.5.fx matches 15 at @s rotated 90 0 run function core:class/ability/assassin/5/fx/bind
execute if score @s assassin.5.fx matches 20.. at @s rotated 135 0 run function core:class/ability/assassin/5/fx/bind
execute if score @s assassin.5.fx matches 20.. run scoreboard players set @s assassin.5.fx 0
