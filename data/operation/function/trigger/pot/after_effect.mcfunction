# Execute after apply effect & damage
# as Owner Player with tag TempPotOwner
# at Where Pot Lands
# All enemies affected are tagged "tmp"
# args: damage

execute at @s as @e[type=!#bypass,tag=tmp] run function core:class/ability/alchemist/1/init

$execute if score @s pot.lc matches 1.. if entity @n[type=armor_stand,tag=alch.2.pot,distance=..2] at @s as @e[type=!#bypass,tag=tmp] run function core:class/ability/alchemist/2/mark {damage:$(damage)}