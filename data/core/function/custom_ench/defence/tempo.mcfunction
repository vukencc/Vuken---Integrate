execute store result score @s stdTemp1 run data get entity @s equipment.head.components."minecraft:enchantments"."core:defence/tempo" 1
execute store result score @s stdTemp2 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:defence/tempo" 1
execute store result score @s stdTemp3 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:defence/tempo" 1
execute store result score @s stdTemp4 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:defence/tempo" 1
execute store result score @s stdTemp5 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:defence/tempo" 1
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."core:defence/tempo" 1
execute if items entity @s weapon.mainhand *[equippable] run scoreboard players set @s stdTemp6 0

scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6
scoreboard players operation @s stdTemp1 *= @s std20
scoreboard players operation @s armor_extension += @s stdTemp1
execute if score @s stdTemp1 matches 1.. at @s run playsound item.armor.unequip_wolf hostile @s ~ ~ ~ 1 1.2 1