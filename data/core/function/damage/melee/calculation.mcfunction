execute store result score @s stdTemp1 run data get entity @s SelectedItem.components."minecraft:attribute_modifiers".[{slot:"mainhand",type:"minecraft:attack_damage",operation:"add_multiplied_base"}].amount 100
execute store result score @s stdTemp2 run data get entity @s equipment.offhand.components."minecraft:attribute_modifiers".[{slot:"offhand",type:"minecraft:attack_damage",operation:"add_multiplied_base"}].amount 100
execute store result score @s stdTemp3 run data get entity @s equipment.head.components."minecraft:attribute_modifiers".[{slot:"head",type:"minecraft:attack_damage",operation:"add_multiplied_base"}].amount 100
execute store result score @s stdTemp4 run data get entity @s equipment.chest.components."minecraft:attribute_modifiers".[{slot:"chest",type:"minecraft:attack_damage",operation:"add_multiplied_base"}].amount 100
execute store result score @s stdTemp5 run data get entity @s equipment.legs.components."minecraft:attribute_modifiers".[{slot:"legs",type:"minecraft:attack_damage",operation:"add_multiplied_base"}].amount 100
execute store result score @s stdTemp6 run data get entity @s equipment.feet.components."minecraft:attribute_modifiers".[{slot:"feet",type:"minecraft:attack_damage",operation:"add_multiplied_base"}].amount 100
scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6
scoreboard players add @s stdTemp1 100
execute store result score @s stdTemp6 run function vfam:get {target:"@s",effect:"attack_damage",type:add_multiplied_base,scale:100}
scoreboard players operation @s stdTemp1 += @s stdTemp6

execute store result score @s bacTemp1 run data get entity @s SelectedItem.components.minecraft:enchantments."core:forge/af/vigor" 2
execute store result score @s bacTemp2 run data get entity @s equipment.offhand.components.minecraft:enchantments."core:forge/af/vigor" 2
execute store result score @s bacTemp3 run data get entity @s equipment.head.components.minecraft:enchantments."core:forge/af/vigor" 2
execute store result score @s bacTemp4 run data get entity @s equipment.chest.components.minecraft:enchantments."core:forge/af/vigor" 2
execute store result score @s bacTemp5 run data get entity @s equipment.legs.components.minecraft:enchantments."core:forge/af/vigor" 2
execute store result score @s bacTemp6 run data get entity @s equipment.feet.components.minecraft:enchantments."core:forge/af/vigor" 2
scoreboard players operation @s bacTemp1 += @s bacTemp2
scoreboard players operation @s bacTemp1 += @s bacTemp3
scoreboard players operation @s bacTemp1 += @s bacTemp4
scoreboard players operation @s bacTemp1 += @s bacTemp5
scoreboard players operation @s bacTemp1 += @s bacTemp6
scoreboard players add @s bacTemp1 100
scoreboard players operation @s stdTemp1 *= @s bacTemp1
scoreboard players operation @s stdTemp1 /= $100 math.times

scoreboard players set @s stdTemp7 100
execute store result score @s stdTemp6 run function vfam:get {target:"@s",effect:"attack_damage",type:add_multiplied_total,scale:100}
scoreboard players operation @s stdTemp7 += @s stdTemp6
scoreboard players operation @s stdTemp7 += @s player.Strength
scoreboard players operation @s stdTemp7 += @s player.Weakness

### Temporary For Map
# Remove in other maps!
execute store result score @s stdTemp2 run attribute @s attack_damage modifier value get ench.grief.modifier.a 100
scoreboard players operation @s stdTemp7 += @s stdTemp2
### Temporary End

scoreboard players operation @s stdTemp1 *= @s stdTemp7

return run scoreboard players get @s stdTemp1