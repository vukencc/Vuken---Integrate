scoreboard objectives add temp_std4 dummy
scoreboard players set @s temp_std4 4
execute store result score @s stdTemp1 run data get entity @s equipment.head.components."minecraft:enchantments"."core:defence/evasion" 1
execute store result score @s stdTemp2 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:defence/evasion" 1
execute store result score @s stdTemp3 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:defence/evasion" 1
execute store result score @s stdTemp4 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:defence/evasion" 1
execute store result score @s stdTemp5 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:defence/evasion" 1
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."core:defence/evasion" 1
execute if items entity @s weapon.mainhand *[equippable] run scoreboard players set @s stdTemp6 0
execute if items entity @s weapon.mainhand *[equippable] run scoreboard players set @s bacTemp6 0

scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6
execute if score @s stdTemp1 matches 21.. run scoreboard players set @s stdTemp1 20
scoreboard players operation @s stdTemp1 *= @s temp_std4
tellraw @s [{translate:name.environment_evasion.lore,"fallback":"Environment Evasion Chance : ",color:white,bold:true},{score:{name:"@s",objective:"stdTemp1"},color:"#ade6ff",bold:true},{"text":"%",color:"#ade6ff",bold:true}]
scoreboard objectives remove temp_std4