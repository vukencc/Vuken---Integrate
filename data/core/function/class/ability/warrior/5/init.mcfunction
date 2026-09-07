execute if score @s melee.slc.cd matches 1.. run return fail
execute if score @s melee.slc matches 1 store result score @s melee.slc.cd run function core:custom_ench/aptitude/cal {time:240}
execute if score @s melee.slc matches 2 store result score @s melee.slc.cd run function core:custom_ench/aptitude/cal {time:200}
execute if score @s warrior.contract matches ..0 if score @s melee.slc matches 1 store result score @s melee.slc.cd run function core:custom_ench/aptitude/cal {time:210}
execute if score @s warrior.contract matches ..0 if score @s melee.slc matches 2 store result score @s melee.slc.cd run function core:custom_ench/aptitude/cal {time:170}
execute if score @s melee.swap matches 2 if score @s warrior.contract matches ..0 if score @s melee.slc matches 1 store result score @s melee.slc.cd run function core:custom_ench/aptitude/cal {time:180}
execute if score @s melee.swap matches 2 if score @s warrior.contract matches ..0 if score @s melee.slc matches 2 store result score @s melee.slc.cd run function core:custom_ench/aptitude/cal {time:140}

execute if score @s melee.slc matches 1 rotated ~-90 0 run function core:class/ability/warrior/5/summon_1

execute if score @s melee.slc matches 2 rotated ~-90 0 run function core:class/ability/warrior/5/summon_2

execute as @e[type=armor_stand,tag=shockwave] run function core:class/ability/warrior/5/set_attribute

playsound block.beacon.activate hostile @a ~ ~ ~