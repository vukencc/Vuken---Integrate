scoreboard players operation @s marker = @p marker
scoreboard players operation @s marker_2 = @p wand.rc
execute if score @p wand.rc matches 1 store result entity @s data.p2.value double 1.0 as @p run function core:damage/magic/get {value:7}
execute if score @p wand.rc matches 2 store result entity @s data.p2.value double 1.0 as @p run function core:damage/magic/get {value:16}
execute store result entity @s data.p1.value double 1.0 as @p run function core:damage/magic/get {value:5}
tag @s remove stdTemp1