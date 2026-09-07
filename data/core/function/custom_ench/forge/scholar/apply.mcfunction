execute if score @s ench.scholar.1 matches 1.. run return run scoreboard players set @s ench.scholar.1 -60
execute if score @s ench.scholar.2 matches 1.. run return run scoreboard players set @s ench.scholar.2 -60

scoreboard players set @s ench.scholar.1 1
scoreboard players set @s ench.scholar.2 1

execute unless items entity @s armor.* *[enchantments~[{enchantments:"core:forge/pf/scholar"}]] unless items entity @s weapon.offhand *[enchantments~[{enchantments:"core:forge/pf/scholar"}]] unless items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:forge/pf/scholar"}]] run return 0

execute store result score @s stdTemp1 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:forge/pf/scholar" 6
execute store result score @s stdTemp2 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:forge/pf/scholar" 6
execute store result score @s stdTemp3 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:forge/pf/scholar" 6
execute store result score @s stdTemp4 run data get entity @s equipment.head.components."minecraft:enchantments"."core:forge/pf/scholar" 6
execute store result score @s stdTemp5 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:forge/pf/scholar" 6
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."core:forge/pf/scholar" 6

scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6

execute store result storage input value double 1 run scoreboard players get @s stdTemp1

### This is apply. It has existed in the check!
execute store result storage input value double 1 run function core:damage/magic/get with storage input

tag @s add DamageOwner
execute at @s as @e[type=!#bypass,distance=..7] run function core:damage/magic/do with storage input
tag @s remove DamageOwner