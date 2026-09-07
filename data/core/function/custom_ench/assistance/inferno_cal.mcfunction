execute store result score @s stdTemp1 run data get entity @s equipment.head.components."minecraft:enchantments".core:assistance/inferno
execute store result score @s stdTemp2 run data get entity @s equipment.chest.components."minecraft:enchantments".core:assistance/inferno
execute store result score @s stdTemp3 run data get entity @s equipment.legs.components."minecraft:enchantments".core:assistance/inferno
execute store result score @s stdTemp4 run data get entity @s equipment.feet.components."minecraft:enchantments".core:assistance/inferno
execute store result score @s stdTemp5 run data get entity @s equipment.offhand.components."minecraft:enchantments".core:assistance/inferno
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments".core:assistance/inferno
scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6
scoreboard players operation $inferno_cal marker += @s stdTemp1