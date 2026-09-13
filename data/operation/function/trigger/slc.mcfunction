execute if score @s class matches 1 if items entity @s weapon.mainhand #melee_weapon if score @s melee.slc matches 1.. run function core:class/ability/warrior/5/init

execute if score @s class matches 2 if items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:inter/wand_effect"}]] if score @s wand.slc matches 1.. at @s run function core:class/ability/mage/5/summon
execute if score @s class matches 4 if items entity @s weapon.mainhand #range at @s run function core:class/ability/scout/5/cast
