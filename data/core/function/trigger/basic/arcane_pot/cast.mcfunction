execute unless predicate operation:stats/sneaking run function operation:trigger/rc
execute if predicate operation:stats/sneaking run function operation:trigger/src
#speed radius color cost damage

execute store result score @s stdTemp1 run data get entity @s SelectedItem.components."minecraft:custom_data".ArcanePot.cost 40

### Only for this map
### to be removed -
execute if score @s class matches 3 if score @s alch.pas1 matches 2 store result score @s stdTemp1 run data get entity @s SelectedItem.components."minecraft:custom_data".ArcanePot.cost 32
### End

### Only for this map
### to be removed -
execute if entity @s[tag=alch.no_pot_cost] run scoreboard players set @s stdTemp1 0
### End

execute if score @s player.ManaBar < @s stdTemp1 run return fail
item modify entity @s weapon.mainhand [{function:"set_enchantments",enchantments:{"core:inter/pot_effect":0}}]
scoreboard players operation @s player.ManaBar -= @s stdTemp1
execute store result storage element speed double 0.1 run data get entity @s SelectedItem.components."minecraft:custom_data".ArcanePot.speed 10
execute store result storage element radius double 0.1 run data get entity @s SelectedItem.components."minecraft:custom_data".ArcanePot.radius 10
execute store result storage element color int 1 run data get entity @s SelectedItem.components."minecraft:custom_data".ArcanePot.color

execute store result score @s stdTemp8 run data get entity @s SelectedItem.components."minecraft:custom_data".ArcanePot.damage 10
function core:damage/magic/calculation
scoreboard players operation @s stdTemp8 *= @s stdTemp1
execute store result storage element damage double 0.00001 run scoreboard players get @s stdTemp8

function core:class/ability/alchemist/pot/snapshot
data modify storage core:alchemist pot_item set from entity @s SelectedItem
execute store result storage core:alchemist pot_id int 1 run scoreboard players get @s marker
data modify storage core:alchemist pot_effects set value {}
data modify storage core:alchemist pot_effects set from entity @s SelectedItem.components."minecraft:custom_data".ArcanePot.effects
data modify storage core:alchemist pot_tag set value "pot_as"
data modify storage core:alchemist pot_tag set from entity @s SelectedItem.components."minecraft:custom_data".ArcanePot.tag
data modify storage core:alchemist pot_sneak set value 0
execute if predicate operation:stats/sneaking run data modify storage core:alchemist pot_sneak set value 1
data modify storage core:alchemist pot_scatter set value 0
execute if entity @s[tag=alch.2.casting] run data modify storage core:alchemist pot_scatter set value 1

execute at @s anchored eyes positioned ^ ^ ^0.5 summon splash_potion run function core:trigger/basic/arcane_pot/set_attributes with storage element

function operation:event/player/use/pot