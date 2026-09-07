scoreboard players add @s ench.unreal.count 1
execute if score @s ench.unreal.count matches ..4 run return fail
scoreboard players set @s ench.unreal.count 0

execute unless items entity @s armor.* *[enchantments~[{enchantments:"core:forge/pf/unreal"}]] unless items entity @s weapon.offhand *[enchantments~[{enchantments:"core:forge/pf/unreal"}]] unless items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:forge/pf/unreal"}]] run return run scoreboard players set @s ench.unreal.interval 0

execute store result score @s stdTemp1 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:forge/pf/unreal"
execute store result score @s stdTemp2 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:forge/pf/unreal"
execute store result score @s stdTemp3 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:forge/pf/unreal"
execute store result score @s stdTemp4 run data get entity @s equipment.head.components."minecraft:enchantments"."core:forge/pf/unreal"
execute store result score @s stdTemp5 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:forge/pf/unreal"
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."core:forge/pf/unreal"

scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6

scoreboard players operation @s ench.unreal.interval = @s stdTemp1
tag @s add EnchUnrealBuff