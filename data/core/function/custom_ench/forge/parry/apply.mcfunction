# Applies Absorption for 5 seconds (5 ticks). Amplifier = total level - 1 (level 1 -> Absorption I, ... level 5 -> Absorption V).
execute if score @s ench.parry.level matches 1 run effect give @s minecraft:absorption 5 0 true
execute if score @s ench.parry.level matches 2 run effect give @s minecraft:absorption 5 1 true
execute if score @s ench.parry.level matches 3 run effect give @s minecraft:absorption 5 2 true
execute if score @s ench.parry.level matches 4 run effect give @s minecraft:absorption 5 3 true
execute if score @s ench.parry.level matches 5 run effect give @s minecraft:absorption 5 4 true
scoreboard players set @s ench.parry.timer 0
playsound item.armor.equip_gold hostile @s ~ ~ ~
