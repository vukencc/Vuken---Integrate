$scoreboard players set @s alch.pulse $(interval)
$execute as @e[type=!#minecraft:bypass,distance=..$(radius),nbt=!{Health:0.0f}] run function core:class/ability/alchemist/6/damage {owner:$(owner),damage:$(pool_damage)}
$particle dust{color:[0.22,0.05,0.32],scale:1.1} ~ ~0.1 ~ $(radius) 0.05 $(radius) 0 18 normal
