execute if entity @s[tag=Boss] run return fail
execute on attacker as @s unless items entity @s armor.* *[enchantments~[{enchantments:"core:forge/pf/execute"}]] unless items entity @s weapon.offhand *[enchantments~[{enchantments:"core:forge/pf/execute"}]] unless items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:forge/pf/execute"}]] run return fail
execute on attacker as @s run function core:custom_ench/forge/execute/cal
execute store result score @s stdTemp1 on attacker as @s run scoreboard players get @s stdTemp1
execute store result score @s stdTemp2 run attribute @s max_health get 10
scoreboard players operation @s stdTemp1 *= @s stdTemp2
execute store result score @s stdTemp3 run data get entity @s Health 10000
execute on attacker as @s run tag @s add EnchExecuteOwner
execute if score @s stdTemp3 <= @s stdTemp1 run damage @s 999999 core:custom_melee by @p[tag=EnchExecuteOwner]
tag @a remove EnchExecuteOwner