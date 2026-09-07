$scoreboard players set @s stdTemp1 $(value)
scoreboard players operation @s stdTemp1 *= $20 math.times
scoreboard players operation @s stdTemp1 *= $2 math.times
scoreboard players operation @s player.ManaBar += @s stdTemp1
execute if score @s player.ManaBar matches 4000.. run scoreboard players set @s player.ManaBar 4000