execute unless items entity @s armor.* *[enchantments~[{enchantments:"core:forge/pf/resolution"}]] unless items entity @s weapon.offhand *[enchantments~[{enchantments:"core:forge/pf/resolution"}]] unless items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:forge/pf/resolution"}]] run return 0
execute store result score @s bacTemp1 run data get entity @s Health 10000
execute store result score @s bacTemp2 run attribute @s max_health get 10
scoreboard players operation @s bacTemp1 /= @s bacTemp2
execute if score @s bacTemp1 matches ..599 run return fail

execute store result score @s stdTemp1 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:forge/pf/resolution" 5
execute store result score @s stdTemp2 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:forge/pf/resolution" 5
execute store result score @s stdTemp3 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:forge/pf/resolution" 5
execute store result score @s stdTemp4 run data get entity @s equipment.head.components."minecraft:enchantments"."core:forge/pf/resolution" 5
execute store result score @s stdTemp5 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:forge/pf/resolution" 5
execute store result score @s stdTemp6 run data get entity @s SelectedItem.components."minecraft:enchantments"."core:forge/pf/resolution" 5

scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
scoreboard players operation @s stdTemp1 += @s stdTemp6

execute if score @s bacTemp1 matches 700..799 run scoreboard players operation @s stdTemp1 *= $2 math.times

execute if score @s bacTemp1 matches 800..899 run scoreboard players operation @s stdTemp1 *= $3 math.times

execute if score @s bacTemp1 matches 900..999 run scoreboard players operation @s stdTemp1 *= $2 math.times
execute if score @s bacTemp1 matches 900..999 run scoreboard players operation @s stdTemp1 *= $2 math.times

execute if score @s bacTemp1 matches 1000 run scoreboard players operation @s stdTemp1 *= $5 math.times

data merge storage input {target:"@s",effect:attack_damage,id:resolution,value:0.05,duration:100,type:add_multiplied_total}
execute store result storage input value double 0.01 run scoreboard players get @s stdTemp1
function vfam:add with storage input