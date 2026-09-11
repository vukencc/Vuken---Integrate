# Execute after apply effect & damage
# as Owner Player with tag TempPotOwner
# at Where Pot Lands
# All enemies affected are tagged "tmp"
# args: damage

execute at @s as @e[type=!#bypass,tag=tmp] run function core:class/ability/alchemist/1/init