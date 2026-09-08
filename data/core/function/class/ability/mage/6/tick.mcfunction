scoreboard players set @s bacTemp1 0

execute if score @s wand.swap matches 1 if score @s mage.6.delay matches -19 at @s as @e[distance=..5,type=!#bypass] run function core:class/ability/mage/6/effect
execute if score @s wand.swap matches 1 if score @s mage.6.delay matches -19 if score @s bacTemp1 matches 1 run function core:class/ability/mage/6/reduce_cd

execute if score @s wand.swap matches 1 if score @s mage.6.delay matches -9 at @s as @e[distance=..5,type=!#bypass] run function core:class/ability/mage/6/effect
execute if score @s wand.swap matches 1 if score @s mage.6.delay matches -9 if score @s bacTemp1 matches 1 run function core:class/ability/mage/6/reduce_cd


execute if score @s wand.swap matches 2 if score @s mage.6.delay matches -19 at @s as @e[distance=..5,type=!#bypass] run function core:class/ability/mage/6/effect
execute if score @s wand.swap matches 2 if score @s mage.6.delay matches -19 if score @s bacTemp1 matches 1 run function core:class/ability/mage/6/reduce_cd

execute if score @s wand.swap matches 2 if score @s mage.6.delay matches -13 at @s as @e[distance=..5,type=!#bypass] run function core:class/ability/mage/6/effect
execute if score @s wand.swap matches 2 if score @s mage.6.delay matches -13 if score @s bacTemp1 matches 1 run function core:class/ability/mage/6/reduce_cd

execute if score @s wand.swap matches 2 if score @s mage.6.delay matches -7 at @s as @e[distance=..5,type=!#bypass] run function core:class/ability/mage/6/effect
execute if score @s wand.swap matches 2 if score @s mage.6.delay matches -7 if score @s bacTemp1 matches 1 run function core:class/ability/mage/6/reduce_cd
