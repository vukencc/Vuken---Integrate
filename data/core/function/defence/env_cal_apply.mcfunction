scoreboard players set @s natDamageResisted 0
$scoreboard players set @s damageResisted $(temp)
scoreboard players operation @s damageResisted *= $10 math.times
execute at @s run function core:defence/env_cal_trigger