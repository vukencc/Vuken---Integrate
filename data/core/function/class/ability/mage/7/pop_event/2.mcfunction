execute store result storage input value double 1.0 run function core:damage/magic/get {value:3}
execute if score @s wand.sdrop matches 2 if score @s wand.rc matches 2 store result storage input value double 1.0 run function core:damage/magic/get {value:6}
execute store result storage input owner int 1 run scoreboard players get @s marker

execute at @s as @e[type=!#bypass,distance=..8] on passengers if entity @s[type=armor_stand] run function core:class/ability/mage/7/2/effect