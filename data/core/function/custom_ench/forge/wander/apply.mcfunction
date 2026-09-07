execute unless items entity @s armor.* *[enchantments~[{enchantments:"core:forge/pf/wander"}]] unless items entity @s weapon.offhand *[enchantments~[{enchantments:"core:forge/pf/wander"}]] unless items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:forge/pf/wander"}]] run return fail

execute store result score @s stdTemp1 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:forge/pf/wander" 25
execute store result score @s stdTemp2 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:forge/pf/wander" 25
execute store result score @s stdTemp3 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:forge/pf/wander" 25
execute store result score @s stdTemp4 run data get entity @s equipment.head.components."minecraft:enchantments"."core:forge/pf/wander" 25
execute store result score @s stdTemp5 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:forge/pf/wander" 25
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."core:forge/pf/wander" 25

scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6

data merge storage input {target:"@s",effect:water_movement_efficiency,id:wander,value:0.05,duration:80,type:add_multiplied_total}
execute store result storage input value double 0.01 run scoreboard players get @s stdTemp1
function vfam:add with storage input