execute if score @s wand.drop.cd matches 1.. run return fail
execute if score @s wand.drop matches 1 run function operation:displacement/forward/init {distance:8}
execute if score @s wand.drop matches 2 run function operation:displacement/forward/init {distance:12}
execute at @s run function core:class/ability/mage/4/end