execute unless score @s class matches 3 run return fail
execute unless score @s pot.drop matches 1..2 run return fail
execute unless score @s alch.charges matches 1.. run return fail
execute unless data entity @s SelectedItem.components."minecraft:custom_data".ArcanePot.damage run return fail
execute unless data entity @s SelectedItem.components."minecraft:custom_data".ArcanePot.radius run return fail
data modify storage core:alchemist bomb set value {damage:0.0,radius:0.0,spring:0,coefficient:1.0}
data modify storage core:alchemist bomb.owner set from entity @s UUID
execute store result storage core:alchemist bomb.radius double 0.00125 run data get entity @s SelectedItem.components."minecraft:custom_data".ArcanePot.radius 1000
function core:damage/magic/calculation
execute store result storage core:alchemist bomb.coefficient double 0.0001 run scoreboard players get @s stdTemp1
execute store result storage core:alchemist bomb.base double 0.0015 run data get entity @s SelectedItem.components."minecraft:custom_data".ArcanePot.damage 1000
function core:class/ability/alchemist/5/scale with storage core:alchemist bomb
execute store result storage core:alchemist bomb.spring int 1 run scoreboard players get @s alch.pas4
scoreboard players remove @s alch.charges 1
execute anchored eyes positioned ^ ^ ^0.5 summon snowball run function core:class/ability/alchemist/5/projectile
function core:class/ability/alchemist/4/on_skill
playsound entity.ender_dragon.shoot hostile @s ~ ~ ~ 0.8 1.8
