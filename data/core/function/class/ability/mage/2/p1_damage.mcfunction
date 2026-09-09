execute on passengers if entity @s[type=armor_stand] run tag @s add mage.2.marked
execute on passengers if entity @s[type=armor_stand] run scoreboard players operation @s marker = $temp stdTemp1
execute store result score @s stdTemp1 run data get storage input value3
execute on passengers if entity @s[type=armor_stand] run tag @s remove mage.2.marked.1
execute on passengers if entity @s[type=armor_stand] run tag @s remove mage.2.marked.2
execute if score @s stdTemp1 matches 1 on passengers if entity @s[type=armor_stand] run tag @s add mage.2.marked.1
execute if score @s stdTemp1 matches 2 on passengers if entity @s[type=armor_stand] run tag @s add mage.2.marked.2

execute on passengers if entity @s[type=armor_stand] run data modify entity @s data.mage_2_damage.value set from storage input value2

scoreboard players add @s mage.8.count 1
data modify entity @s Fire set value 160
function core:damage/magic/do with storage input
playsound entity.blaze.burn hostile @a ~ ~ ~