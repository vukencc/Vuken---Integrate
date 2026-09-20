execute if score @s melee.slc matches 0 run return fail
execute if score @s melee.slc.cd matches 1.. run return fail
execute unless score @s class matches 5 run return fail

execute if score @s melee.slc matches 1 store result score @s melee.slc.cd run function core:custom_ench/aptitude/cal {time:200}
execute if score @s melee.slc matches 2 store result score @s melee.slc.cd run function core:custom_ench/aptitude/cal {time:160}

execute if score @s melee.slc matches 1 store result storage input value double 1.0 run function core:damage/melee/get {value:4}
execute if score @s melee.slc matches 2 store result storage input value double 1.0 run function core:damage/melee/get {value:6}

execute if score @s melee.slc matches 1 store result storage input_2 value double 0.03 run attribute @s attack_damage get 10
execute if score @s melee.slc matches 2 store result storage input_2 value double 0.06 run attribute @s attack_damage get 10

data modify storage input_3 value set from entity @s UUID

playsound minecraft:item.trident.throw hostile @s ~ ~ ~ 0.7 0.85
playsound minecraft:entity.player.attack.sweep hostile @s ~ ~ ~ 0.65 0.7
particle dust_color_transition{from_color:9102591,to_color:16777215,scale:1.1} ~ ~1.3 ~ 0.3 0.3 0.3 0.08 28 normal

tag @s add DamageOwner

execute positioned ~ ~1.3 ~ rotated ~-30 ~ run function core:class/ability/assassin/4/check_1
execute positioned ~ ~1.3 ~ rotated ~0 ~ run function core:class/ability/assassin/4/check_1
execute positioned ~ ~1.3 ~ rotated ~30 ~ run function core:class/ability/assassin/4/check_1

tag @s remove DamageOwner
tag @e[type=!#bypass,tag=assassin.4.hit] remove assassin.4.hit
function core:class/ability/assassin/7/get
