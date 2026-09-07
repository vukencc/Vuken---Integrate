scoreboard players set @s marker 0
scoreboard players set @s marker_2 0
execute as @s store result score @s marker run data get entity @s attack.timestamp
execute as @s store result score @s marker_2 run data get entity @s interaction.timestamp
data modify entity @s attack.timestamp set value 0
data modify entity @s interaction.timestamp set value 0