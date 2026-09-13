attribute @s water_movement_efficiency modifier remove vanilla_wme_modifier
execute store result score @s stdTemp1 run attribute @s water_movement_efficiency get 10000
attribute @s water_movement_efficiency modifier add vanilla_wme_modifier -1 add_multiplied_total

scoreboard players set @s stdTemp7 100
scoreboard players operation @s stdTemp7 += @s player.Strength
scoreboard players operation @s stdTemp7 += @s player.Weakness
scoreboard players operation @s stdTemp1 *= @s stdTemp7

function core:class/ability/scout/8/multiplier
return run scoreboard players get @s stdTemp1