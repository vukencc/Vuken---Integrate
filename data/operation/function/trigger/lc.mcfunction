execute if items entity @s weapon.mainhand *[enchantments~[{enchantments:"map_only:item/hook"}]] at @s run return run function core:trigger/active/hook/pull

execute if score @s class matches 2 if items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:inter/wand_effect"}]] if score @s wand.lc matches 1.. run function core:class/ability/mage/1/cast