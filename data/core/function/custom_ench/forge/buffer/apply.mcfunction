tag @s add EnchBufferAffected
scoreboard players operation @s stdTemp1 = @p[scores={ench.buffer.level=1..}] ench.buffer.level
execute if score @s stdTemp1 matches 1 run effect give @s slowness 3 1 true
execute if score @s stdTemp1 matches 2 run effect give @s slowness 3 2 true
execute if score @s stdTemp1 matches 3 run effect give @s slowness 3 3 true
execute if score @s stdTemp1 matches 4 run effect give @s slowness 3 4 true