scoreboard players remove @s scout.life 1
execute if score @s scout.life matches ..0 run return run kill @s
execute store success score @s scout.tmp on vehicle if entity @s[nbt={Health:0.0f}]
execute if score @s scout.tmp matches 1 run return run function core:class/ability/scout/4/death with entity @s data.scout
execute unless function core:class/ability/scout/4/has_vehicle run return run kill @s
particle dust{color:[1.0,0.7,0.1],scale:0.7} ~ ~0.6 ~ 0.25 0.05 0.25 0 1 normal
