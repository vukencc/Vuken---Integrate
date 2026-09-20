# Freeze attribution across nested damage callbacks.
tag @e[type=!#bypass,distance=..12,tag=assassin.moon.hit] remove assassin.moon.hit
$execute as @e[type=!#bypass,distance=..2] at @s run function core:class/ability/assassin/7/hit {owner:$(owner),value:$(value)}
scoreboard players set @s assassin.7.step 16
$execute anchored eyes positioned ^ ^ ^0.5 anchored feet run function core:class/ability/assassin/7/ray {owner:$(owner),value:$(value)}
execute positioned ~ ~1.3 ~ positioned ^ ^ ^-1 run function core:class/ability/assassin/7/particle_1
playsound entity.player.attack.sweep player @a[distance=..24] ~ ~ ~ 0.8 1.5
playsound block.amethyst_block.resonate player @a[distance=..24] ~ ~ ~ 0.35 1.2
tag @e[type=!#bypass,distance=..12,tag=assassin.moon.hit] remove assassin.moon.hit
