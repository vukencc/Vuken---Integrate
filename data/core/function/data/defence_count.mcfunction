execute store result score @s stdTemp1 run data get entity @s equipment.head.components."minecraft:enchantments"."core:assistance/agility"
    execute store result score @s stdTemp2 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:assistance/agility"
    execute store result score @s stdTemp3 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:assistance/agility"
    execute store result score @s stdTemp4 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:assistance/agility"
    execute store result score @s stdTemp5 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:assistance/agility"
    scoreboard players operation @s stdTemp1 += @s stdTemp2
    scoreboard players operation @s stdTemp1 += @s stdTemp3
    scoreboard players operation @s stdTemp1 += @s stdTemp4
    scoreboard players operation @s stdTemp1 += @s stdTemp5
    execute store result storage agility agility_trans float 0.15 run scoreboard players get @s stdTemp1
    attribute @s jump_strength modifier remove agility
    execute at @s run function core:data/agility_apply with storage agility
    execute store result storage agility agility_trans float 1 run scoreboard players get @s stdTemp1
    attribute @s safe_fall_distance modifier remove agility_safe
    execute at @s run function core:data/safe_fall_apply with storage agility
### Agility End

tag @s remove reg_trans_access
    execute store result score @s regeneration_p1 run data get entity @s equipment.head.components."minecraft:enchantments"."core:assistance/regeneration" 10
    execute store result score @s stdTemp2 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:assistance/regeneration" 10
    execute store result score @s stdTemp3 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:assistance/regeneration" 10
    execute store result score @s stdTemp4 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:assistance/regeneration" 10
    execute store result score @s stdTemp5 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:assistance/regeneration" 10
    scoreboard players operation @s regeneration_p1 += @s stdTemp2
    scoreboard players operation @s regeneration_p1 += @s stdTemp3
    scoreboard players operation @s regeneration_p1 += @s stdTemp4
    scoreboard players operation @s regeneration_p1 += @s stdTemp5
    execute if score @s regeneration_p1 matches 1.. run tag @s add reg_trans_access
    scoreboard objectives add temp_std110 dummy
    scoreboard players set @s temp_std110 110
    scoreboard players operation @s temp_std110 -= @s regeneration_p1
    execute if score @s temp_std110 matches ..19 run scoreboard players set @s temp_std110 20
    scoreboard players operation @s regeneration_p1 = @s temp_std110
    scoreboard objectives remove temp_std110
### Reg End