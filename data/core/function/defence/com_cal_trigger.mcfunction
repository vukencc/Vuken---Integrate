execute unless entity @s[tag=bypassHurtTime] if score @s player.HurtTime.vir matches 1.. run return fail
playsound map:entity.player.hurt hostile @a ~ ~ ~ 0.5
data merge storage damage_store {damage_store:0.0}
#damage_absorption_modify

#scb_cal
scoreboard objectives add base_armor dummy
scoreboard objectives add base_armor_bel dummy
scoreboard objectives add std_armor dummy

#end
execute store result score @s base_armor run attribute @s luck get 100
execute store result score @s base_armor_bel run attribute @s luck get 1
#extension aspect
execute as @s at @s run function core:custom_ench/trigger_center
scoreboard players operation @s base_armor *= @s armor_extension
scoreboard players operation @s base_armor /= @s std100
scoreboard players operation @s base_armor_bel *= @s armor_extension
scoreboard players operation @s base_armor_bel /= @s std100
scoreboard players operation @s base_armor_bel += @s std750
scoreboard players operation @s base_armor /= @s base_armor_bel
scoreboard players set @s std_armor 100
scoreboard players operation @s std_armor -= @s base_armor
scoreboard players operation @s damageResisted *= @s std_armor
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
scoreboard players operation @s damageResisted *= @s temp_std100
scoreboard players operation @s damageResisted /= @s std100

#enchant aspect remove
execute store result score @s stdTemp1 run data get entity @s equipment.head.components."minecraft:enchantments"."core:defence/evasion" 1
execute store result score @s stdTemp2 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:defence/evasion" 1
execute store result score @s stdTemp3 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:defence/evasion" 1
execute store result score @s stdTemp4 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:defence/evasion" 1
execute store result score @s stdTemp5 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:defence/evasion" 1
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."core:defence/evasion" 1
execute store result score @s bacTemp1 run data get entity @s equipment.head.components."minecraft:enchantments"."core:defence/melee_evasion" 2
execute store result score @s bacTemp2 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:defence/melee_evasion" 2
execute store result score @s bacTemp3 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:defence/melee_evasion" 2
execute store result score @s bacTemp4 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:defence/melee_evasion" 2
execute store result score @s bacTemp5 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:defence/melee_evasion" 2
execute store result score @s bacTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."core:defence/melee_evasion" 2
execute if items entity @s weapon.mainhand *[equippable] run scoreboard players set @s stdTemp6 0
execute if items entity @s weapon.mainhand *[equippable] run scoreboard players set @s bacTemp6 0

scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6
scoreboard players operation @s stdTemp1 += @s bacTemp1
scoreboard players operation @s stdTemp1 += @s bacTemp2
scoreboard players operation @s stdTemp1 += @s bacTemp3
scoreboard players operation @s stdTemp1 += @s bacTemp4
scoreboard players operation @s stdTemp1 += @s bacTemp5
scoreboard players operation @s stdTemp1 += @s bacTemp6
execute if score @s stdTemp1 matches 21.. run scoreboard players set @s stdTemp1 20
execute if score @s repeat_25_timing <= @s stdTemp1 run scoreboard players set @s damageResisted 0
execute if score @s repeat_25_timing <= @s stdTemp1 at @s run playsound item.trident.throw hostile @s ~ ~ ~
#if_death
scoreboard objectives add damageDeathDetect dummy
scoreboard players operation @s damageDeathDetect = @s health
scoreboard players operation @s damageDeathDetect *= @s std100
scoreboard players operation @s damageDeathDetect *= @s std10
execute as @s at @s if score @s damageResisted >= @s damageDeathDetect if entity @s[tag=death_totem] run function core:defence/death_escape
#damage_export
execute as @s at @s store result storage damage_store damage_store float 0.001 run scoreboard players get @s damageResisted
execute as @s at @s run function core:defence/damage_trigger with storage damage_store
#clear

scoreboard players set @s damageResisted 0
