data merge storage assistance {frenzy:0.0,energy:0.0,hasten:0.0,health:0.0,temp_hp:0}

execute store result score @s stdTemp1 run data get entity @s equipment.head.components."minecraft:enchantments"."core:assistance/frenzy" 25
execute store result score @s stdTemp2 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:assistance/frenzy" 25
execute store result score @s stdTemp3 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:assistance/frenzy" 25
execute store result score @s stdTemp4 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:assistance/frenzy" 25
execute store result score @s stdTemp5 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:assistance/frenzy" 25
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."core:assistance/frenzy" 25
scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6
execute store result storage assistance frenzy float 0.01 run scoreboard players get @s stdTemp1
execute if score @s stdTemp1 matches 1.. at @s run particle dust{color:14096408,scale:1} ~ ~1 ~ 1 1 1 0.1 20 normal
execute if score @s stdTemp1 matches 1.. at @s run playsound entity.item.break hostile @s ~ ~ ~

execute store result score @s stdTemp1 run data get entity @s equipment.head.components."minecraft:enchantments"."core:assistance/energy" 15
execute store result score @s stdTemp2 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:assistance/energy" 15
execute store result score @s stdTemp3 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:assistance/energy" 15
execute store result score @s stdTemp4 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:assistance/energy" 15
execute store result score @s stdTemp5 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:assistance/energy" 15
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."core:assistance/energy" 15
scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6
execute store result storage assistance energy float 0.01 run scoreboard players get @s stdTemp1
execute if score @s stdTemp1 matches 1.. at @s run particle dust{color:10354687,scale:1} ~ ~1 ~ 1 1 1 0.1 20 normal
execute if score @s stdTemp1 matches 1.. at @s run playsound entity.illusioner.cast_spell hostile @s ~ ~ ~

execute store result score @s stdTemp1 run data get entity @s equipment.head.components."minecraft:enchantments"."core:assistance/hasten" 15
execute store result score @s stdTemp2 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:assistance/hasten" 15
execute store result score @s stdTemp3 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:assistance/hasten" 15
execute store result score @s stdTemp4 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:assistance/hasten" 15
execute store result score @s stdTemp5 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:assistance/hasten" 15
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."core:assistance/hasten" 15
scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6
execute store result storage assistance hasten float 0.01 run scoreboard players get @s stdTemp1
execute if score @s stdTemp1 matches 1.. at @s run particle dust{color:14548804,scale:1} ~ ~1 ~ 1 1 1 0.1 20 normal
execute if score @s stdTemp1 matches 1.. at @s run playsound entity.allay.item_given hostile @s ~ ~ ~

execute store result score @s stdTemp1 run data get entity @s equipment.head.components."minecraft:enchantments"."core:assistance/life_drain" 1
execute store result score @s stdTemp2 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:assistance/life_drain" 1
execute store result score @s stdTemp3 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:assistance/life_drain" 1
execute store result score @s stdTemp4 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:assistance/life_drain" 1
execute store result score @s stdTemp5 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:assistance/life_drain" 1
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."core:assistance/life_drain" 1
scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6
execute if score @s stdTemp1 matches 1.. at @s run particle heart ~ ~1 ~ 1 1 1 0.1 20 normal
execute if score @s stdTemp1 matches 1.. at @s run playsound entity.item.pickup hostile @s ~ ~ ~
execute store result storage assistance health float 1 run scoreboard players get @s stdTemp1

function core:custom_ench/assistance/kill_apply with storage assistance
function operation:stats/player_heal/single/init with storage assistance