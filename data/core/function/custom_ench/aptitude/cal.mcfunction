execute store result score @s stdTemp1 run data get entity @s equipment.head.components."minecraft:enchantments".core:assistance/aptitude 5
execute store result score @s stdTemp2 run data get entity @s equipment.chest.components."minecraft:enchantments".core:assistance/aptitude 5
execute store result score @s stdTemp3 run data get entity @s equipment.legs.components."minecraft:enchantments".core:assistance/aptitude 5
execute store result score @s stdTemp4 run data get entity @s equipment.feet.components."minecraft:enchantments".core:assistance/aptitude 5
execute store result score @s stdTemp5 run data get entity @s equipment.offhand.components."minecraft:enchantments".core:assistance/aptitude 5
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments".core:assistance/aptitude 5
scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6
scoreboard players set @s stdTemp7 100
scoreboard players operation @s stdTemp7 -= @s stdTemp1
$scoreboard players set @s stdTemp8 $(time)
scoreboard players operation @s stdTemp8 *= @s stdTemp7
scoreboard players operation @s stdTemp8 /= $100 math.times
return run scoreboard players get @s stdTemp8