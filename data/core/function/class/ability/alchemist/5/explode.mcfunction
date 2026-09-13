function core:class/ability/alchemist/pot/hit with entity @s data
function core:class/ability/alchemist/5/explode_particle with entity @s data
particle explosion ~ ~-0.6 ~ 0 0 0 0 1 normal
playsound entity.generic.explode hostile @a[distance=..32] ~ ~ ~ 0.7 1.4
kill @s
