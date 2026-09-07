execute store result entity @s data.value double 1.0 as @p run function core:damage/melee/get {value:8}
scoreboard players operation @s marker = @p marker
tag @s remove shockwave
execute rotated as @p rotated ~ 0 run rotate @s ~ ~