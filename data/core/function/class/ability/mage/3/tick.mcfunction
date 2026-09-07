tp @s ^ ^ ^0.15
execute on passengers rotated as @s run rotate @s ~5 ~
execute on passengers at @s positioned ~ ~-1 ~ run function core:class/ability/mage/3/particle

execute store result storage input value double 1.0 run data get entity @s data.value

execute at @a if score @p marker = @s marker run tag @p add DamageOwner

execute if entity @s[tag=mage.snowstorm.1] positioned ~-3.5 ~-2 ~-3.5 as @e[type=!#bypass,dx=6,dy=7,dz=6] run function core:class/ability/mage/3/apply_1
execute if entity @s[tag=mage.snowstorm.2] positioned ~-3.5 ~-2 ~-3.5 as @e[type=!#bypass,dx=6,dy=7,dz=6] run function core:class/ability/mage/3/apply_2

tag @a remove DamageOwner