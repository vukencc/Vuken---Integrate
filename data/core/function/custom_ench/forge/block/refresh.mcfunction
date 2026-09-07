# Recalculate after operation:event/player/refresh/inventory.
execute unless items entity @s armor.* *[enchantments~[{enchantments:"core:forge/pf/block"}]] unless items entity @s weapon.offhand *[enchantments~[{enchantments:"core:forge/pf/block"}]] run return fail

scoreboard players set @s stdTemp1 0
scoreboard players set @s stdTemp2 0
scoreboard players set @s stdTemp3 0
scoreboard players set @s stdTemp4 0
scoreboard players set @s stdTemp5 0

execute store result score @s stdTemp1 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:forge/pf/block"
execute store result score @s stdTemp2 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:forge/pf/block"
execute store result score @s stdTemp3 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:forge/pf/block"
execute store result score @s stdTemp4 run data get entity @s equipment.head.components."minecraft:enchantments"."core:forge/pf/block"
execute store result score @s stdTemp5 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:forge/pf/block"

scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5

execute if score @s stdTemp1 matches 6.. run scoreboard players set @s stdTemp1 5

# Cached interval in seconds: 65 - 5 * level (I=60s, V=40s).
scoreboard players set @s ench.block.interval 65
scoreboard players operation @s stdTemp1 *= $5 math.times
scoreboard players operation @s ench.block.interval -= @s stdTemp1
scoreboard players set @s ench.block.timer 0
