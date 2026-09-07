tag @p add stdTemp1
execute as @e[type=arrow,tag=hook_target] at @s on origin if entity @s[tag=stdTemp1] run kill @n[type=arrow,tag=hook_target]
tag @a remove stdTemp1
tag @s add t_limited_with
tag @s add hook_target
tag @s add immune_to_clear
data modify entity @s Glowing set value true
team join aqua @s
execute store result entity @s Motion.[0] double 0.0025 run data get entity @s Motion.[0] 1000
execute store result entity @s Motion.[1] double 0.0025 run data get entity @s Motion.[1] 1000
execute store result entity @s Motion.[2] double 0.0025 run data get entity @s Motion.[2] 1000
data modify entity @s NoGravity set value true
data modify entity @s pickup set value 0b
data modify entity @s damage set value 0
execute positioned ~ ~200 ~ summon armor_stand run function core:trigger/active/hook/init/ride