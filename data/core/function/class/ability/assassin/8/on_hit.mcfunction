execute store success score @s assassin.tmp on attacker if entity @s[type=player,scores={class=5,assassin.pas3=1..2}]
execute unless score @s assassin.tmp matches 1 run return fail
execute on attacker run tag @s add assassin.8.attacker
execute at @s run function core:class/ability/assassin/8/backstab_check
tag @a[tag=assassin.8.attacker] remove assassin.8.attacker
