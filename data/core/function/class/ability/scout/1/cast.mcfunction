execute unless score @s class matches 4 run return fail
execute unless score @s range.lc matches 1..2 run return fail
execute unless items entity @s weapon.mainhand #range run return fail
execute if score @s range.lc.cd matches 1.. run return fail
execute if score @s range.lc matches 1 if score @s scout.charges matches 2.. run scoreboard players set @s scout.charges 1
execute unless score @s scout.charges matches 1.. run function core:class/ability/scout/1/refill
execute unless score @s scout.charges matches 1.. run return fail
scoreboard players remove @s scout.charges 1
execute if score @s scout.charges matches 0 if score @s range.lc matches 1 store result score @s range.lc.cd run function core:custom_ench/aptitude/cal {time:80}
execute if score @s scout.charges matches 0 if score @s range.lc matches 2 store result score @s range.lc.cd run function core:custom_ench/aptitude/cal {time:60}
data modify storage core:scout volley set value {multishot:0,direction:{x:0.0d,z:3.0d}}
execute store result storage core:scout volley.charging_bow int 1 run scoreboard players get @s charging_bow
function core:class/ability/scout/snapshot
data modify storage core:scout shot.weapon set from entity @s SelectedItem
execute store result storage core:scout shot.pierce_level byte 1 run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:piercing"
execute if data entity @s SelectedItem.components."minecraft:enchantments"."minecraft:flame" run data modify storage core:scout shot.flame set value 1b
data modify storage core:scout volley.shot set from storage core:scout shot
execute store result score @s multicharge.temp5 run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:multishot"
execute if score @s multicharge.temp5 matches ..-1 run scoreboard players set @s multicharge.temp5 0
execute if score @s multicharge.temp5 matches 4.. run scoreboard players set @s multicharge.temp5 3
execute store result storage core:scout volley.multishot int 1 run scoreboard players get @s multicharge.temp5
scoreboard players set @s charging_bow 20
particle crit ^ ^1.6 ^0.5 0.12 0.12 0.12 0.08 12 force @s
execute anchored eyes positioned ^ ^ ^0.3 summon arrow run function core:class/ability/scout/1/arrow
execute if data storage core:scout volley{multishot:1} run data modify storage core:scout volley.direction set value {x:0.520944533d,z:2.954423259d}
execute if data storage core:scout volley{multishot:1} anchored eyes positioned ^ ^ ^0.3 summon arrow run function core:class/ability/scout/1/arrow
execute if data storage core:scout volley{multishot:1} run data modify storage core:scout volley.direction set value {x:-0.520944533d,z:2.954423259d}
execute if data storage core:scout volley{multishot:1} anchored eyes positioned ^ ^ ^0.3 summon arrow run function core:class/ability/scout/1/arrow
execute if data storage core:scout volley{multishot:2} run data modify storage core:scout volley.direction set value {x:0.520944533d,z:2.954423259d}
execute if data storage core:scout volley{multishot:2} anchored eyes positioned ^ ^ ^0.3 summon arrow run function core:class/ability/scout/1/arrow
execute if data storage core:scout volley{multishot:2} run data modify storage core:scout volley.direction set value {x:-0.520944533d,z:2.954423259d}
execute if data storage core:scout volley{multishot:2} anchored eyes positioned ^ ^ ^0.3 summon arrow run function core:class/ability/scout/1/arrow
execute if data storage core:scout volley{multishot:2} run data modify storage core:scout volley.direction set value {x:1.02606043d,z:2.819077862d}
execute if data storage core:scout volley{multishot:2} anchored eyes positioned ^ ^ ^0.3 summon arrow run function core:class/ability/scout/1/arrow
execute if data storage core:scout volley{multishot:2} run data modify storage core:scout volley.direction set value {x:-1.02606043d,z:2.819077862d}
execute if data storage core:scout volley{multishot:2} anchored eyes positioned ^ ^ ^0.3 summon arrow run function core:class/ability/scout/1/arrow
execute if data storage core:scout volley{multishot:3} run data modify storage core:scout volley.direction set value {x:0.520944533d,z:2.954423259d}
execute if data storage core:scout volley{multishot:3} anchored eyes positioned ^ ^ ^0.3 summon arrow run function core:class/ability/scout/1/arrow
execute if data storage core:scout volley{multishot:3} run data modify storage core:scout volley.direction set value {x:-0.520944533d,z:2.954423259d}
execute if data storage core:scout volley{multishot:3} anchored eyes positioned ^ ^ ^0.3 summon arrow run function core:class/ability/scout/1/arrow
execute if data storage core:scout volley{multishot:3} run data modify storage core:scout volley.direction set value {x:1.02606043d,z:2.819077862d}
execute if data storage core:scout volley{multishot:3} anchored eyes positioned ^ ^ ^0.3 summon arrow run function core:class/ability/scout/1/arrow
execute if data storage core:scout volley{multishot:3} run data modify storage core:scout volley.direction set value {x:-1.02606043d,z:2.819077862d}
execute if data storage core:scout volley{multishot:3} anchored eyes positioned ^ ^ ^0.3 summon arrow run function core:class/ability/scout/1/arrow
execute if data storage core:scout volley{multishot:3} run data modify storage core:scout volley.direction set value {x:1.5d,z:2.598076211d}
execute if data storage core:scout volley{multishot:3} anchored eyes positioned ^ ^ ^0.3 summon arrow run function core:class/ability/scout/1/arrow
execute if data storage core:scout volley{multishot:3} run data modify storage core:scout volley.direction set value {x:-1.5d,z:2.598076211d}
execute if data storage core:scout volley{multishot:3} anchored eyes positioned ^ ^ ^0.3 summon arrow run function core:class/ability/scout/1/arrow
execute store result score @s charging_bow run data get storage core:scout volley.charging_bow
playsound entity.arrow.shoot player @s ~ ~ ~ 1 1.3
