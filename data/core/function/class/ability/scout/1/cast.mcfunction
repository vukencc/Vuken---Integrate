execute unless score @s class matches 4 run return fail
execute unless score @s range.lc matches 1..2 run return fail
execute unless items entity @s weapon.mainhand #range run return fail
execute unless score @s range.lc.cd matches 1.. run function core:class/ability/scout/1/refill
execute unless score @s scout.charges matches 1.. run return fail
execute unless data entity @s SelectedItem.components."minecraft:custom_data".range run return fail
scoreboard players remove @s scout.charges 1
execute unless score @s range.lc.cd matches 1.. if score @s range.lc matches 1 store result score @s range.lc.cd run function core:custom_ench/aptitude/cal {time:80}
execute unless score @s range.lc.cd matches 1.. if score @s range.lc matches 2 store result score @s range.lc.cd run function core:custom_ench/aptitude/cal {time:60}
data modify storage core:scout shot.owner set from entity @s UUID
scoreboard players operation @s scout.saved = @s charging_bow
scoreboard players set @s charging_bow 20
execute anchored eyes positioned ^ ^ ^0.3 summon arrow run function core:class/ability/scout/1/arrow
scoreboard players operation @s charging_bow = @s scout.saved
playsound entity.arrow.shoot player @s ~ ~ ~ 1 1.3
