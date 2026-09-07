execute unless entity @s[tag=Boss] unless entity @s[tag=Elite] run return fail
execute store result score @s stdTemp1 on attacker run function core:custom_ench/forge/regicide/cal
execute if score @s stdTemp1 matches 0 run return fail

execute store result storage input value int 1 run scoreboard players get @s stdTemp1
execute store result storage input value double 1 on attacker run function core:damage/melee/get with storage input
execute on attacker run tag @s add DamageOwner
function core:damage/melee/do with storage input
execute on attacker run tag @s remove DamageOwner