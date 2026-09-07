execute if score @s menu.trigger matches 1 run function core:inter_chat/enchant_info/main
execute if score @s menu.trigger matches 2 run function core:inter_chat/main
execute if score @s menu.trigger matches 2 run scoreboard players set @s chat.armor.enhance 100
execute if score @s menu.trigger matches 3 run function core:inter_chat/stats_show_main
execute if score @s menu.trigger matches 4 run function core:inter_chat/evasion_main
execute if score @s menu.trigger matches 5 run function core:inter_chat/enchant_info/main
execute if score @s menu.trigger matches 6 run function core:inter_chat/enchant_info/defence
execute if score @s menu.trigger matches 7 run function core:inter_chat/enchant_info/melee
execute if score @s menu.trigger matches 8 run function core:inter_chat/enchant_info/range
execute if score @s menu.trigger matches 9 run function core:inter_chat/enchant_info/assistance
execute if score @s menu.trigger matches 10 run function core:inter_chat/enchant_info/special

execute if score @s menu.trigger matches 11 run function core:inter_chat/option/main
execute if score @s menu.trigger matches 12 run function core:inter_chat/option/music_on
execute if score @s menu.trigger matches 13 run function core:inter_chat/option/music_off
execute if score @s menu.trigger matches 14 run function core:inter_chat/option/difficulty_1
execute if score @s menu.trigger matches 15 run function core:inter_chat/option/difficulty_2
execute if score @s menu.trigger matches 16 run function core:inter_chat/option/difficulty_3
execute if score @s menu.trigger matches 12..16 run function core:inter_chat/option/main

execute if score @s menu.trigger matches 17 run function core:inter_chat/stats/inter
execute if score @s menu.trigger matches 18 run function core:inter_chat/stats/player
execute if score @s menu.trigger matches 19 run function core:inter_chat/stats/enemy

execute if score @s menu.trigger matches 20 run function core:inter_chat/option/pickup_on
execute if score @s menu.trigger matches 21 run function core:inter_chat/option/pickup_off
execute if score @s menu.trigger matches 20..21 run function core:inter_chat/option/main

execute if score @s menu.trigger matches 22 run function core:inter_chat/armor_scale/remove
execute if score @s menu.trigger matches 23 run function core:inter_chat/armor_scale/add

scoreboard players set @s menu.trigger 0