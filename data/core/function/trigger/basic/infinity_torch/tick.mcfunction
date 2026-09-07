execute if items entity @s weapon.mainhand torch[enchantments~[{enchantments:infinity}]] run scoreboard players set @s infinity.delay.torch 3
scoreboard players remove @s[scores={infinity.delay.torch=1..}] infinity.delay.torch 1
execute if score @s infinity.use.torch matches 0 run return fail
scoreboard players set @s infinity.use.torch 0
execute if score @s infinity.delay.torch matches 1.. run function core:trigger/basic/infinity_torch/use