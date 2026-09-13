execute store result score @s alch.gift.collected run function core:class/ability/alchemist/7/collect_at with entity @s data
execute if score @s alch.gift.collected matches 1.. run kill @s
