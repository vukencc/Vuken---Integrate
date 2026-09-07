execute at @s run tp @s ~ ~1.3 ~

execute on passengers positioned ^ ^ ^-1 run function core:class/ability/mage/2/attribute

function operation:motion/set_forward/init {speed:1.5}
data modify entity @s Motion set from storage motion set_forward

