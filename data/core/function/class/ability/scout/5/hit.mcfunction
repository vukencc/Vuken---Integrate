execute unless entity @s[tag=scout.decoy] run return fail
scoreboard players remove @s scout.hits 1
execute if score @s scout.hits matches ..0 run return run function core:class/ability/scout/5/end
execute if entity @s[nbt={Health:0.0f}] run return run function core:class/ability/scout/5/end
data modify entity @s Health set value 1024.0f
particle damage_indicator ~ ~1.2 ~ 0.2 0.2 0.2 0 3 normal
