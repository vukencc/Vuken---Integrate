execute unless score @s class matches 3 run return fail
execute unless score @s pot.sswap matches 1..2 run return fail
execute if score @s pot.sswap.cd matches 1.. run return fail

execute store result score @s pot.sswap.cd run function core:custom_ench/aptitude/cal {time:600}

scoreboard players set @s alch.garden 400
execute if score @s pot.sswap matches 1 run scoreboard players set @s alch.garden.next 80
execute if score @s pot.sswap matches 2 run scoreboard players set @s alch.garden.next 60

function core:class/ability/alchemist/4/on_skill

playsound block.composter.ready hostile @s ~ ~ ~ 1 1.5 1
particle happy_villager ~ ~1 ~ 0.5 1 0.5 0.05 20 normal

effect give @s absorption 4 0 true