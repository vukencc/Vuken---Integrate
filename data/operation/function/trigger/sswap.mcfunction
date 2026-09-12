execute if score @s class matches 1 if items entity @s weapon.mainhand #melee_weapon if score @s melee.sswap matches 1.. at @s run function core:class/ability/warrior/7/cost_rage

execute if score @s class matches 3 if items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:inter/pot_effect"}]] if score @s pot.sswap matches 1.. at @s run function core:class/ability/alchemist/4/cast
