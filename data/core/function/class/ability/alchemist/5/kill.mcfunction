advancement revoke @s only core:class/alchemist/kill
execute unless score @s class matches 3 run return fail
execute unless score @s pot.drop matches 1..2 run return fail
scoreboard players add @s alch.kills 1
execute if score @s alch.kills matches 3.. run function core:class/ability/alchemist/5/charge
