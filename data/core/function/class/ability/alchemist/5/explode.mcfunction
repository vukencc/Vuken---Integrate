function core:class/ability/alchemist/pot/hit with entity @s data
particle explosion ~ ~ ~ 0.3 0.3 0.3 0 2 normal
playsound entity.generic.explode hostile @a[distance=..32] ~ ~ ~ 0.7 1.4
kill @s
