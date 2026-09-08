# @s is an enemy; execution is at it and faces this particular black hole.
function operation:motion/set_forward/init {speed:0.5}
data modify entity @s Motion set from storage motion set_forward
