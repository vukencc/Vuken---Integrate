execute if items entity @s weapon.mainhand *[custom_data~{Slot:[head]}] if items entity @n[type=item_display,tag=forge_show] contents #minecraft:head_armor run return 1
execute if items entity @s weapon.mainhand *[custom_data~{Slot:[head]}] if items entity @n[type=item_display,tag=forge_show] contents #minecraft:skulls run return 1
execute if items entity @s weapon.mainhand *[custom_data~{Slot:[chest]}] if items entity @n[type=item_display,tag=forge_show] contents #minecraft:chest_armor run return 1
execute if items entity @s weapon.mainhand *[custom_data~{Slot:[legs]}] if items entity @n[type=item_display,tag=forge_show] contents #minecraft:leg_armor run return 1
execute if items entity @s weapon.mainhand *[custom_data~{Slot:[feet]}] if items entity @n[type=item_display,tag=forge_show] contents #minecraft:foot_armor run return 1
execute if items entity @s weapon.mainhand *[custom_data~{Slot:[sword]}] if items entity @n[type=item_display,tag=forge_show] contents *[enchantments~[{enchantments:"core:inter/sword_effect"}]] run return 1
execute if items entity @s weapon.mainhand *[custom_data~{Slot:[axe]}] if items entity @n[type=item_display,tag=forge_show] contents *[enchantments~[{enchantments:"core:inter/axe_effect"}]] run return 1
execute if items entity @s weapon.mainhand *[custom_data~{Slot:[bow]}] if items entity @n[type=item_display,tag=forge_show] contents *[enchantments~[{enchantments:"core:inter/arrow_effect"}]] run return 1
execute if items entity @s weapon.mainhand *[custom_data~{Slot:[scythe]}] if items entity @n[type=item_display,tag=forge_show] contents *[enchantments~[{enchantments:"core:inter/scythe_effect"}]] run return 1
execute if items entity @s weapon.mainhand *[custom_data~{Slot:[pot]}] if items entity @n[type=item_display,tag=forge_show] contents *[enchantments~[{enchantments:"core:inter/pot_effect"}]] run return 1
execute if items entity @s weapon.mainhand *[custom_data~{Slot:[magic_book]}] if items entity @n[type=item_display,tag=forge_show] contents *[enchantments~[{enchantments:"core:inter/magic_book_effect"}]] run return 1
execute if items entity @s weapon.mainhand *[custom_data~{Slot:[wand]}] if items entity @n[type=item_display,tag=forge_show] contents *[enchantments~[{enchantments:"core:inter/wand_effect"}]] run return 1
execute if items entity @s weapon.mainhand *[custom_data~{Slot:[offhand]}] if items entity @n[type=item_display,tag=forge_show] contents *[custom_data~{Offhand:1b}] run return 1
execute if items entity @s weapon.mainhand *[custom_data~{Slot:[armor]}] if items entity @n[type=item_display,tag=forge_show] contents #armor run return 1
return fail