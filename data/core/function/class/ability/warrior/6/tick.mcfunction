attribute @s max_health modifier remove warrior_6_a
attribute @s max_health modifier remove warrior_6_b
tag @s remove warrior_6_1
tag @s remove warrior_6_2

execute if score @s warrior.pas1 matches 1 run tag @s add warrior_6_1
execute if score @s warrior.pas1 matches 1 run attribute @s max_health modifier add warrior_6_a 1 add_value
execute if score @s warrior.pas1 matches 1 run attribute @s max_health modifier add warrior_6_b 0.1 add_multiplied_total

execute if score @s warrior.pas1 matches 2 run tag @s add warrior_6_2
execute if score @s warrior.pas1 matches 2 run attribute @s max_health modifier add warrior_6_a 2 add_value
execute if score @s warrior.pas1 matches 2 run attribute @s max_health modifier add warrior_6_b 0.2 add_multiplied_total