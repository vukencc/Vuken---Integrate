data modify storage input value set from entity @s data.mage_7_2.value
execute store result score @s stdTemp1 run data get entity @s data.mage_7_2.owner

particle flash{color:4132298} ~ ~1 ~ 1 1 1 0.1 0 normal
particle dust_color_transition{from_color:6160383,to_color:10027192,scale:1} ~ ~1 ~ 0.4 0.4 0.4 0.1 15 normal
playsound entity.firework_rocket.large_blast hostile @a ~ ~ ~ 1 2 1
playsound entity.firework_rocket.large_blast hostile @a ~ ~ ~ 1 2 1

execute at @a if score @p marker = @s stdTemp1 run tag @p add DamageOwner

execute as @e[type=!#bypass,distance=..4] run scoreboard players add @s mage.8.count 1
execute as @e[type=!#bypass,distance=..4] run function core:damage/magic/do with storage input

tag @a remove DamageOwner