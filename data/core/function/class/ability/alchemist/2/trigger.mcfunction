execute if entity @s[tag=alch.2.processing] run return fail
execute if entity @s[tag=alch.2.suppress] run return fail
tag @s add alch.2.processing

execute at @a if score @p marker = @s marker run tag @p add DamageOwner

execute store result score @s stdTemp1 run data get entity @s data.alch2.damage 1000
execute if entity @s[tag=alch.2.marked.1] run scoreboard players operation @s stdTemp1 *= $2 math.times
execute if entity @s[tag=alch.2.marked.1] run scoreboard players operation @s stdTemp1 *= $2 math.times
execute if entity @s[tag=alch.2.marked.1] run scoreboard players operation @s stdTemp1 /= $5 math.times
execute if entity @s[tag=alch.2.marked.2] run scoreboard players operation @s stdTemp1 *= $2 math.times
execute if entity @s[tag=alch.2.marked.2] run scoreboard players operation @s stdTemp1 *= $3 math.times
execute if entity @s[tag=alch.2.marked.2] run scoreboard players operation @s stdTemp1 /= $5 math.times
execute store result storage input value double 0.001 run scoreboard players get @s stdTemp1

execute at @s as @e[type=!#bypass,tag=!alch.2.processing,tag=!alch.2.suppress,distance=..4] run tag @s add alch.2.suppress
execute at @s as @e[type=!#bypass,tag=alch.2.suppress,distance=..4] run function core:damage/magic/do with storage input
execute at @s as @e[type=!#bypass,tag=alch.2.suppress,distance=..4] run tag @s remove alch.2.suppress

tag @a remove DamageOwner

execute at @s run function core:class/ability/alchemist/2/particle
playsound entity.splash_potion.break hostile @a ~ ~ ~

execute if entity @s[tag=alch.2.marked.1] run function core:class/ability/alchemist/2/clear

tag @s remove alch.2.processing
