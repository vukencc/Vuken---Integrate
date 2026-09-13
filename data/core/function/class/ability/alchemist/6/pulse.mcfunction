$scoreboard players set @s alch.pulse $(interval)
$execute as @e[type=!#minecraft:bypass,distance=..$(radius),nbt=!{Health:0.0f}] run function core:class/ability/alchemist/6/damage {owner:$(owner),damage:$(pool_damage)}
function core:class/ability/alchemist/6/particle
