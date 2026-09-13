execute unless score @s class matches 4 run return fail
execute unless score @s range.sswap matches 1..2 run return fail
execute unless items entity @s weapon.mainhand #range run return fail
execute if score @s range.sswap.cd matches 1.. run return fail
data modify storage core:scout wind set value {owner:[I;0,0,0,0],level:1,value:0.0}
data modify storage core:scout wind.owner set from entity @s UUID
execute store result storage core:scout wind.level int 1 run scoreboard players get @s range.sswap
execute store result score @s scout.tmp run function core:damage/range/calculation
scoreboard players set @s scout.bonus 12
execute if score @s range.sswap matches 2 run scoreboard players set @s scout.bonus 18
scoreboard players operation @s scout.tmp *= @s scout.bonus
execute store result storage core:scout wind.value double 0.0001 run scoreboard players get @s scout.tmp
execute store result score @s range.sswap.cd run function core:custom_ench/aptitude/cal {time:240}
execute anchored eyes positioned ^ ^ ^0.4 summon snowball run function core:class/ability/scout/7/projectile
playsound entity.breeze.shoot player @s ~ ~ ~ 1 1.2
