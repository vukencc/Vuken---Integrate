execute if entity @s[tag=alch.2.processing] run return fail
execute if entity @s[tag=alch.2.suppress] run return fail
tag @s add alch.2.processing

tag @a[tag=DamageOwner] add alch.2.previous_owner
tag @a remove DamageOwner
execute at @a if score @p marker = @s alch.2.owner run tag @p add DamageOwner

execute store result score @s stdTemp1 run data get entity @s data.alch2.damage 1000
execute if entity @s[tag=alch.2.marked.1] run scoreboard players operation @s stdTemp1 *= $2 math.times
execute if entity @s[tag=alch.2.marked.1] run scoreboard players operation @s stdTemp1 *= $2 math.times
execute if entity @s[tag=alch.2.marked.1] run scoreboard players operation @s stdTemp1 /= $5 math.times
execute if entity @s[tag=alch.2.marked.2] run scoreboard players operation @s stdTemp1 *= $2 math.times
execute if entity @s[tag=alch.2.marked.2] run scoreboard players operation @s stdTemp1 *= $3 math.times
execute if entity @s[tag=alch.2.marked.2] run scoreboard players operation @s stdTemp1 /= $5 math.times
execute store result storage core:alchemist mark_burst.value double 0.001 run scoreboard players get @s stdTemp1

execute at @s as @e[type=!#bypass,distance=..4] run function core:damage/magic/do with storage core:alchemist mark_burst

tag @a remove DamageOwner
tag @a[tag=alch.2.previous_owner] add DamageOwner
tag @a remove alch.2.previous_owner

execute at @s run function core:class/ability/alchemist/2/particle
playsound entity.splash_potion.break hostile @a ~ ~ ~

execute if entity @s[tag=alch.2.marked.1] run function core:class/ability/alchemist/2/clear

tag @s remove alch.2.processing
