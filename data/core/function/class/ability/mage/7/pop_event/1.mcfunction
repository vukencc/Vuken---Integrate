execute store result storage input value double 1.0 run function core:damage/magic/get {value:8}
tag @s add DamageOwner

execute if score @s wand.lc matches 1 at @s as @e[type=!#bypass,sort=random,limit=1,distance=..8] run function core:class/ability/mage/7/1/effect
execute if score @s wand.lc matches 2 if score @s wand.sdrop matches 1 at @s as @e[type=!#bypass,sort=random,limit=1,distance=..8] run function core:class/ability/mage/7/1/effect
execute if score @s wand.lc matches 2 if score @s wand.sdrop matches 2 at @s as @e[type=!#bypass,sort=random,limit=2,distance=..8] run function core:class/ability/mage/7/1/effect

tag @s remove DamageOwner