# Carry over an active legacy cooldown once, including players returning after reload.
execute unless score @s alch.pool.cd matches 1.. run return fail
execute unless score @s pot.src.cd >= @s alch.pool.cd run scoreboard players operation @s pot.src.cd = @s alch.pool.cd
scoreboard players reset @s alch.pool.cd
