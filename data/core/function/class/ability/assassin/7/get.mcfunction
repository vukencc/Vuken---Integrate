execute unless score @s class matches 5 run return fail
execute unless score @s assassin.pas2 matches 1..2 run return fail
execute unless score @s assassin.7.count matches 0.. run scoreboard players set @s assassin.7.count 0
execute if score @s assassin.pas2 matches 1 if score @s assassin.7.count matches 2.. run return run scoreboard players set @s assassin.7.count 2
execute if score @s assassin.pas2 matches 2 if score @s assassin.7.count matches 3.. run return run scoreboard players set @s assassin.7.count 3
scoreboard players add @s assassin.7.count 1
function core:class/ability/assassin/7/display
execute at @s anchored eyes positioned ^ ^-0.25 ^0.8 run particle end_rod ~ ~ ~ 0.35 0.15 0.1 0.02 8 force @s
execute at @s run playsound block.amethyst_block.chime player @s ~ ~ ~ 0.45 1.6
