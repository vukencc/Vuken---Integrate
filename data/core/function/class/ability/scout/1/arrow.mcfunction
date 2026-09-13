data modify entity @s Owner set from storage core:scout shot.owner
function operation:motion/set_forward/init {speed:3.0}
data modify entity @s Motion set from storage motion set_forward
function core:custom_ench/range/arrow_center
particle crit ~ ~ ~ 0.08 0.08 0.08 0.05 8 normal
