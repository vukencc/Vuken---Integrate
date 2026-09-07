execute if score @s melee.src.cd matches 1.. run return fail

execute store result score @s melee.src.cd run function core:custom_ench/aptitude/cal {time:320}
execute if score @s melee.swap matches 1 if score @s warrior.contract matches ..0 store result score @s melee.src.cd run function core:custom_ench/aptitude/cal {time:290}
execute if score @s melee.swap matches 2 if score @s warrior.contract matches ..0 store result score @s melee.src.cd run function core:custom_ench/aptitude/cal {time:260}

execute if score @s melee.src matches 1 run effect give @s absorption 6 1 true
execute if score @s melee.src matches 2 run effect give @s absorption 6 2 true

execute as @e[type=!#bypass,distance=..8] at @s run function core:class/ability/warrior/2/mark

playsound entity.ender_dragon.growl hostile @s ~ ~ ~

######################