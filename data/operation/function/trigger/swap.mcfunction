execute if score @s class matches 1 if items entity @s weapon.mainhand #melee_weapon if score @s melee.swap matches 1.. at @s run function core:class/ability/warrior/3/init

execute if score @s class matches 2 if items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:inter/wand_effect"}]] if score @s wand.swap matches 1.. at @s run function core:class/ability/mage/6/cast

execute if score @s class matches 3 if items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:inter/pot_effect"}]] if score @s pot.swap matches 1.. at @s run function core:class/ability/alchemist/3/cast
execute if score @s class matches 4 if items entity @s weapon.mainhand #range at @s run function core:class/ability/scout/4/cast
