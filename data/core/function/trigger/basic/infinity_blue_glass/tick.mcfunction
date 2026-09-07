execute if items entity @s weapon.mainhand blue_stained_glass[enchantments~[{enchantments:infinity}]] run scoreboard players set @s infinity.delay.blue_glass 3
scoreboard players remove @s[scores={infinity.delay.blue_glass=1..}] infinity.delay.blue_glass 1
execute if score @s infinity.use.blue_glass matches 0 run return fail
scoreboard players set @s infinity.use.blue_glass 0
execute if score @s infinity.delay.blue_glass matches 1.. run function core:trigger/basic/infinity_blue_glass/use
