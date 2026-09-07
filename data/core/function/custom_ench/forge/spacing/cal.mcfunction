function core:custom_ench/forge/spacing/clear

scoreboard players operation @s bacTemp1 = @s ench.spacing.speed1
scoreboard players remove @s bacTemp1 100
execute if score @s bacTemp1 matches ..0 run scoreboard players set @s bacTemp1 0

execute unless items entity @s armor.* *[enchantments~[{enchantments:"core:forge/pf/soft_pacing"}]] unless items entity @s weapon.offhand *[enchantments~[{enchantments:"core:forge/pf/soft_pacing"}]] unless items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:forge/pf/soft_pacing"}]] run return 0

execute store result score @s stdTemp1 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:forge/pf/soft_pacing" 25
execute store result score @s stdTemp2 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:forge/pf/soft_pacing" 25
execute store result score @s stdTemp3 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:forge/pf/soft_pacing" 25
execute store result score @s stdTemp4 run data get entity @s equipment.head.components."minecraft:enchantments"."core:forge/pf/soft_pacing" 25
execute store result score @s stdTemp5 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:forge/pf/soft_pacing" 25
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."core:forge/pf/soft_pacing" 25

scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6
scoreboard players operation @s stdTemp1 *= @s bacTemp1

execute store result storage input value double 0.0001 run scoreboard players get @s stdTemp1
function core:custom_ench/forge/spacing/apply with storage input