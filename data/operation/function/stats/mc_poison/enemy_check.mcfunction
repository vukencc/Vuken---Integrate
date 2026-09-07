execute store result score @s stdTemp1 run data get entity @s HurtTime
execute if score @s stdTemp1 matches 10 run function operation:stats/mc_poison/init