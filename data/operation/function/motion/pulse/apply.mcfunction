execute summon end_crystal run damage @s 1
scoreboard players remove @s stdTemp1 1
execute if score @s stdTemp1 matches 1.. run function operation:motion/pulse/apply