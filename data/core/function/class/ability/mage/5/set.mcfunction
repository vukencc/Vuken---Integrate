execute at @s run tp @s ~ ~1.3 ~
function operation:motion/set_forward/init {speed:1}
data modify entity @s Motion set from storage motion set_forward

execute positioned ^ ^ ^-1 on passengers store result entity @s data.value double 1.0 as @p run function core:damage/magic/get {value:3}