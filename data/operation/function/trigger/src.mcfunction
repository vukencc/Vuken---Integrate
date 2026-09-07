execute if score @s class matches 1 if items entity @s weapon.mainhand #melee_weapon if score @s melee.src matches 1.. run function core:class/ability/warrior/2/init

execute if score @s class matches 2 if items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:inter/wand_effect"}]] if score @s wand.src matches 1.. run function core:class/ability/mage/3/summon



advancement revoke @s only operation:trigger/src
