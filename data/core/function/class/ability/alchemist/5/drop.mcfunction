data modify storage core:alchemist dropped.owner set from entity @s UUID
execute store result score @s alch.tmp run function core:class/ability/alchemist/5/restore with storage core:alchemist dropped
execute unless score @s alch.tmp matches 1 run return fail
function core:class/ability/alchemist/5/cast
