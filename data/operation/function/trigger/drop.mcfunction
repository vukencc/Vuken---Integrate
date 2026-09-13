execute if score @s class matches 4 run return run function core:class/ability/scout/3/drop
execute if score @s class matches 3 run return run function core:class/ability/alchemist/5/drop
item replace entity @s weapon.mainhand from entity @n[type=item] contents
kill @n[type=item]

execute if score @s class matches 1 if items entity @s weapon.mainhand #melee_weapon if score @s melee.drop matches 1.. run function core:class/ability/warrior/4/summon

execute if score @s class matches 2 if items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:inter/wand_effect"}]] if score @s wand.drop matches 1.. run function core:class/ability/mage/4/cast
