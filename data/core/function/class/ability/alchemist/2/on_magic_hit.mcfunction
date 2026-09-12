# /damage does not dispatch enchantment post_attack effects.
execute if score @s alch.2.hit matches 1 if entity @s[tag=alch.2.marked] run function core:class/ability/alchemist/2/trigger
