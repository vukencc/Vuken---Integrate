scoreboard players operation @s player.BypassHurtTime -= @s ench.stream.interval

execute unless items entity @s armor.* *[enchantments~[{enchantments:"core:forge/pf/stream"}]] unless items entity @s weapon.offhand *[enchantments~[{enchantments:"core:forge/pf/stream"}]] unless items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:forge/pf/stream"}]] run return run scoreboard players set @s ench.stream.interval 0

### Each tick equals to 0.05 sec, therefore 2 -> 0.1 sec
execute store result score @s stdTemp1 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:forge/pf/stream" 5
execute store result score @s stdTemp2 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:forge/pf/stream" 5
execute store result score @s stdTemp3 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:forge/pf/stream" 5
execute store result score @s stdTemp4 run data get entity @s equipment.head.components."minecraft:enchantments"."core:forge/pf/stream" 5
execute store result score @s stdTemp5 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:forge/pf/stream" 5

scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5

scoreboard players operation @s ench.stream.interval = @s stdTemp1
scoreboard players operation @s player.BypassHurtTime += @s ench.stream.interval