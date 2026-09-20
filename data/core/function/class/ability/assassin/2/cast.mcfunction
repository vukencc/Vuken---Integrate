execute if score @s melee.sswap matches 0 run return fail
execute if score @s melee.sswap.cd matches 1.. run return fail
execute unless score @s class matches 5 run return fail

execute if score @s melee.sswap matches 1 store result score @s melee.sswap.cd run function core:custom_ench/aptitude/cal {time:240}
execute if score @s melee.sswap matches 2 store result score @s melee.sswap.cd run function core:custom_ench/aptitude/cal {time:200}

playsound minecraft:block.amethyst_block.chime hostile @s ~ ~ ~ 0.75 1.15
playsound minecraft:item.trident.riptide_1 hostile @s ~ ~ ~ 0.5 0.85
playsound minecraft:block.anvil.hit hostile @s ~ ~ ~ 0.35 0.7

particle sweep_attack ~ ~1.3 ~ 1 1 1 0.2 40 normal
particle scrape ~ ~1.3 ~ 1 1 1 0.2 40 normal
particle dust_color_transition{from_color:14196479,to_color:16759807,scale:1.25} ~ ~1.1 ~ 2.4 0.55 2.4 0.04 56 normal

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
