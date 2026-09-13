scoreboard players remove @s scout.dash 1
execute unless entity @s[nbt={OnGround:1b}] run scoreboard players set @s scout.air 1
particle cloud ~ ~0.7 ~ 0.2 0.15 0.2 0.01 2 normal
execute if score @s scout.air matches 1 if entity @s[nbt={OnGround:1b}] run function core:class/ability/scout/3/land
