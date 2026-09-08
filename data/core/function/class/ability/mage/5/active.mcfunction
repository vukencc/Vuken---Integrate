# Physical motion retains block collision; a small inner dead zone avoids jitter.
execute at @s if entity @s[tag=mage.5.1] if score $s_vir repeat_10_timing matches 3 as @e[type=!#minecraft:bypass,distance=0.5..5] at @s facing entity @n[tag=mage.5.active] feet run function core:class/ability/mage/5/pull
execute at @s if entity @s[tag=mage.5.2] if score $s_vir repeat_10_timing matches 3 as @e[type=!#minecraft:bypass,distance=0.5..8] at @s facing entity @n[tag=mage.5.active] feet run function core:class/ability/mage/5/pull

execute at @s if entity @s[tag=mage.5.1] if score $s_vir repeat_10_timing matches 8 as @e[type=!#minecraft:bypass,distance=0.5..5] at @s facing entity @n[tag=mage.5.active] feet run function core:class/ability/mage/5/pull
execute at @s if entity @s[tag=mage.5.2] if score $s_vir repeat_10_timing matches 8 as @e[type=!#minecraft:bypass,distance=0.5..8] at @s facing entity @n[tag=mage.5.active] feet run function core:class/ability/mage/5/pull

execute if score @s inter_custom_cd matches 0 at @s run function core:class/ability/mage/5/pulse

function core:class/ability/mage/5/black_hole_particle

# Pulse at ages 0,20,...,80 / 140: exactly five / eight pulses.
scoreboard players add @s inter_custom_cd 1
execute if score @s inter_custom_cd matches 20.. run scoreboard players set @s inter_custom_cd 0
