attribute @s water_movement_efficiency modifier remove vanilla_wme_modifier
execute store result score @s stdTemp1 run attribute @s water_movement_efficiency get 10000
attribute @s water_movement_efficiency modifier add vanilla_wme_modifier -1 add_multiplied_total

scoreboard players set @s stdTemp7 100
scoreboard players operation @s stdTemp7 += @s player.Strength
scoreboard players operation @s stdTemp7 += @s player.Weakness
scoreboard players operation @s stdTemp1 *= @s stdTemp7

execute store result score @s stdTemp8 run data get entity @s SelectedItem.components."minecraft:custom_data".range

scoreboard players operation @s stdTemp1 *= @s stdTemp8
execute if score @s charging_bow matches 21.. run scoreboard players set @s charging_bow 20
execute if items entity @s weapon.mainhand crossbow run scoreboard players set @s charging_bow 20
scoreboard players operation @s stdTemp1 *= @s charging_bow
scoreboard players operation @s stdTemp1 /= $20 math.times

function core:class/ability/scout/8/multiplier
return run scoreboard players get @s stdTemp1