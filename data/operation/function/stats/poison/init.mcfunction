execute if entity @s[tag=Boss] run return run effect clear @s wither
execute store result score @s stats.poisoned.duration run data get entity @s active_effects.[{id:"minecraft:wither"}].duration
execute store result score @s stats.poisoned.level run data get entity @s active_effects.[{id:"minecraft:wither"}].amplifier
scoreboard players add @s stats.poisoned.level 1
execute if entity @s[type=!player] run effect clear @s wither
item modify entity @s saddle [{function:set_enchantments,enchantments:{"operation:stats/poisoned":1}}]