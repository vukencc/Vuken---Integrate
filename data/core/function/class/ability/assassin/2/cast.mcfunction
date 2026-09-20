execute if score @s melee.sswap matches 0 run return fail
execute if score @s melee.sswap.cd matches 1.. run return fail
execute unless score @s class matches 5 run return fail

execute if score @s melee.sswap matches 1 store result score @s melee.sswap.cd run function core:custom_ench/aptitude/cal {time:240}
execute if score @s melee.sswap matches 2 store result score @s melee.sswap.cd run function core:custom_ench/aptitude/cal {time:200}

function core:class/ability/assassin/2/fx

###

execute if score @s melee.sswap matches 1 store result score $temp_assassin_8_2_dmg stdTemp2 run function core:damage/melee/get {value:40}
execute if score @s melee.sswap matches 2 store result score $temp_assassin_8_2_dmg stdTemp2 run function core:damage/melee/get {value:70}

execute if score @s melee.sswap matches 1 store result score @s stdTemp1 run attribute @s attack_damage get 5
execute if score @s melee.sswap matches 2 store result score @s stdTemp1 run attribute @s attack_damage get 10



scoreboard players operation @s stdTemp1 += $temp_assassin_8_2_dmg stdTemp2

execute store result storage input value double 0.1 run scoreboard players get @s stdTemp1

###

tag @s add DamageOwner

execute at @s as @e[type=!#bypass,distance=..6] run function core:class/ability/assassin/2/effect

tag @a remove DamageOwner
function core:class/ability/assassin/7/get
