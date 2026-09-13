scoreboard players remove @s scout.life 1
execute if entity @s[nbt={inGround:1b}] run return run function core:class/ability/scout/2/impact
execute if score @s scout.life matches ..0 run return run kill @s
particle flame ~ ~ ~ 0 0 0 0 1 normal
