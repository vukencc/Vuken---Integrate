execute if score @s time_not_taking_damage matches ..240 run return fail
execute unless items entity @s armor.* *[enchantments~[{enchantments:"core:forge/pf/recuperation"}]] unless items entity @s weapon.offhand *[enchantments~[{enchantments:"core:forge/pf/recuperation"}]] unless items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:forge/pf/recuperation"}]] run return fail

execute store result score @s stdTemp1 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:forge/pf/recuperation"
execute store result score @s stdTemp2 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:forge/pf/recuperation"
execute store result score @s stdTemp3 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:forge/pf/recuperation"
execute store result score @s stdTemp4 run data get entity @s equipment.head.components."minecraft:enchantments"."core:forge/pf/recuperation"
execute store result score @s stdTemp5 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:forge/pf/recuperation"
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."core:forge/pf/recuperation"

scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6

execute if score @s stdTemp1 matches 1 run effect give @s regeneration 3 0 true
execute if score @s stdTemp1 matches 2 run effect give @s regeneration 2 1 true
execute if score @s stdTemp1 matches 3 run effect give @s regeneration 1 2 true
execute if score @s stdTemp1 matches 4.. run effect give @s regeneration 1 3 true