execute if score @s melee.rc.cd matches 1.. run return fail
execute if score @s melee.rc matches 1 store result score @s melee.rc.cd run function core:custom_ench/aptitude/cal {time:240}
execute if score @s melee.rc matches 2 store result score @s melee.rc.cd run function core:custom_ench/aptitude/cal {time:200}
execute if score @s warrior.contract matches ..0 if score @s melee.rc matches 1 store result score @s melee.rc.cd run function core:custom_ench/aptitude/cal {time:210}
execute if score @s warrior.contract matches ..0 if score @s melee.rc matches 2 store result score @s melee.rc.cd run function core:custom_ench/aptitude/cal {time:170}
execute if score @s melee.swap matches 2 if score @s warrior.contract matches ..0 if score @s melee.rc matches 1 store result score @s melee.rc.cd run function core:custom_ench/aptitude/cal {time:180}
execute if score @s melee.swap matches 2 if score @s warrior.contract matches ..0 if score @s melee.rc matches 2 store result score @s melee.rc.cd run function core:custom_ench/aptitude/cal {time:140}

execute as @s at @s rotated ~ -10 run function operation:motion/free/init {power:1}
tag @s add WarriorDash

execute at @s run playsound minecraft:item.spear.lunge_1 hostile @s ~ ~ ~ 1 1.5 1