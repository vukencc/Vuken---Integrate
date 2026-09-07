#scb_cal
scoreboard objectives add base_armor dummy
scoreboard objectives add base_armor_bel dummy
scoreboard objectives add std_armor dummy
scoreboard objectives add temp_100 dummy
#end
scoreboard players set @s temp_100 100

execute store result score @s base_armor run attribute @s luck get 100
execute store result score @s base_armor_bel run attribute @s luck get 1

scoreboard players operation @s base_armor *= @s chat.armor.enhance
scoreboard players operation @s base_armor_bel *= @s chat.armor.enhance
scoreboard players operation @s base_armor /= $100 math.times
scoreboard players operation @s base_armor_bel /= $100 math.times

scoreboard players operation @s base_armor_bel += @s std750
scoreboard players operation @s base_armor /= @s base_armor_bel
scoreboard players set @s std_armor 100
scoreboard players operation @s std_armor -= @s base_armor
#enchant aspect detect (individual)
execute store result score @s bacTemp1 run data get entity @s equipment.head.components."minecraft:enchantments"."core:defence/melee_protection" 6
execute store result score @s bacTemp2 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:defence/melee_protection" 6
execute store result score @s bacTemp3 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:defence/melee_protection" 6
execute store result score @s bacTemp4 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:defence/melee_protection" 6
execute store result score @s bacTemp5 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:defence/melee_protection" 6
execute store result score @s bacTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."core:defence/melee_protection" 6

execute store result score @s stdTemp1 run data get entity @s equipment.head.components."minecraft:enchantments"."minecraft:protection" 4
execute store result score @s stdTemp2 run data get entity @s equipment.chest.components."minecraft:enchantments"."minecraft:protection" 4
execute store result score @s stdTemp3 run data get entity @s equipment.legs.components."minecraft:enchantments"."minecraft:protection" 4
execute store result score @s stdTemp4 run data get entity @s equipment.feet.components."minecraft:enchantments"."minecraft:protection" 4
execute store result score @s stdTemp5 run data get entity @s equipment.offhand.components."minecraft:enchantments"."minecraft:protection" 4
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:protection" 4

execute if items entity @s weapon.mainhand *[equippable] run scoreboard players set @s stdTemp6 0
execute if items entity @s weapon.mainhand *[equippable] run scoreboard players set @s bacTemp6 0

scoreboard players operation @s bacTemp1 += @s bacTemp2
scoreboard players operation @s bacTemp1 += @s bacTemp3
scoreboard players operation @s bacTemp1 += @s bacTemp4
scoreboard players operation @s bacTemp1 += @s bacTemp5
scoreboard players operation @s bacTemp1 += @s bacTemp6
scoreboard players operation @s bacTemp1 += @s stdTemp1
scoreboard players operation @s bacTemp1 += @s stdTemp2
scoreboard players operation @s bacTemp1 += @s stdTemp3
scoreboard players operation @s bacTemp1 += @s stdTemp4
scoreboard players operation @s bacTemp1 += @s stdTemp5
scoreboard players operation @s bacTemp1 += @s stdTemp6
execute if score @s bacTemp1 matches 90.. run scoreboard players set @s bacTemp1 90
scoreboard objectives add temp_std100 dummy
scoreboard players set @s temp_std100 100
scoreboard players operation @s temp_std100 -= @s bacTemp1
scoreboard players operation @s std_armor *= @s temp_std100
scoreboard players operation @s std_armor /= @s std100
#enchant aspect remove

#damage_export
scoreboard players operation @s temp_100 -= @s std_armor
tellraw @s [{translate:name.melee_defence.lore,"fallback":"Melee Damage Defence : ",color:white,bold:true,hover_event:{action:"show_text",value:{translate:name.defence.melee.lore,color:white,bold:true}}},{score:{name:"@s",objective:"temp_100"},color:"#ade6ff",bold:true},{"text":"%",color:"#ade6ff",bold:true}]
#clear