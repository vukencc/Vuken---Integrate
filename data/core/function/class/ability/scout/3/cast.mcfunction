execute unless score @s class matches 4 run return fail
execute unless score @s range.drop matches 1..2 run return fail
execute unless items entity @s weapon.mainhand #range run return fail
execute if score @s range.drop.cd matches 1.. run return fail
execute if score @s range.drop matches 1 store result score @s range.drop.cd run function core:custom_ench/aptitude/cal {time:100}
execute if score @s range.drop matches 2 store result score @s range.drop.cd run function core:custom_ench/aptitude/cal {time:60}
scoreboard players operation @s scout.level = @s range.drop
scoreboard players set @s scout.dash 60
scoreboard players set @s scout.air 0
execute rotated ~ -15 run function operation:motion/free/init {power:2}
playsound entity.breeze.jump player @s ~ ~ ~ 1 1.2
