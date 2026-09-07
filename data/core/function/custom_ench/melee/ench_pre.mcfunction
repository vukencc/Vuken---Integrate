execute store result score @s melee_bleed run data get entity @s SelectedItem.components."minecraft:enchantments"."core:melee/bleed"
execute store result storage melee_ench bleed float 20 run scoreboard players get @s melee_bleed
execute store result score @s melee_combo run data get entity @s SelectedItem.components."minecraft:enchantments"."core:melee/combo"
execute store result storage melee_ench combo float 20 run scoreboard players get @s melee_combo
execute store result score @s melee_crit run data get entity @s SelectedItem.components."minecraft:enchantments"."core:melee/crit"
execute store result storage melee_ench crit float 20 run scoreboard players get @s melee_crit
execute store result score @s melee_current run data get entity @s SelectedItem.components."minecraft:enchantments"."core:melee/current"
execute store result storage melee_ench current float 20 run scoreboard players get @s melee_current
execute store result score @s melee_curse run data get entity @s SelectedItem.components."minecraft:enchantments"."core:melee/curse"
execute store result storage melee_ench curse float 20 run scoreboard players get @s melee_curse
execute store result score @s melee_first_strike run data get entity @s SelectedItem.components."minecraft:enchantments"."core:melee/first_strike"
execute store result storage melee_ench first_strike float 20 run scoreboard players get @s melee_first_strike
execute store result score @s melee_focus run data get entity @s SelectedItem.components."minecraft:enchantments"."core:melee/focus"
execute store result storage melee_ench focus float 20 run scoreboard players get @s melee_focus
execute store result score @s melee_quake run data get entity @s SelectedItem.components."minecraft:enchantments"."core:melee/quake"
execute store result storage melee_ench quake float 20 run scoreboard players get @s melee_quake
execute store result score @s melee_thunder_aspect run data get entity @s SelectedItem.components."minecraft:enchantments"."core:melee/thunder_aspect"
execute store result storage melee_ench thunder_aspect int 1 run scoreboard players get @s melee_thunder_aspect