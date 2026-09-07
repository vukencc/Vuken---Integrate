execute if score @s class matches 1 if items entity @s weapon.mainhand #melee_weapon if score @s melee.rc matches 1.. run function core:class/ability/warrior/1/dash

execute if score @s class matches 2 if items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:inter/wand_effect"}]] if score @s wand.rc matches 1.. run function core:class/ability/mage/2/cast


advancement revoke @s only operation:trigger/rc