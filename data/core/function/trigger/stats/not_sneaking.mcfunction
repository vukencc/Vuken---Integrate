execute if items entity @s weapon.mainhand *[custom_data~{IsPotionCharger:1b}] run function core:trigger/passive/potion_charger/end with storage temp_id
execute if items entity @s player.cursor *[custom_data~{AnvilUsing:1b}] run function core:trigger/basic/anvil/anvil_reset
execute if items entity @s weapon.offhand *[custom_data~{AnvilUsing:1b}] run function core:trigger/basic/anvil/bundle_offhand_reset
execute if items entity @s player.crafting.* anvil[custom_data~{AnvilFix:1b}] run function core:trigger/basic/anvil/prime
execute if items entity @s[x_rotation=-90..60,gamemode=!adventure] weapon.mainhand *[custom_data~{Xenobundle:1b}] run function core:trigger/passive/xenobundle/init with storage temp_id
#------------------cursor---------------#
execute store result score @s cursor.count.A if items entity @s player.cursor *
execute unless score @s cursor.count.B = @s cursor.count.A run function core:trigger/cursor_changed
execute store result score @s cursor.count.B if items entity @s player.cursor *