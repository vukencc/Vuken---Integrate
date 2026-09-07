execute if entity @s[type=#minecraft:impact_projectiles] if function core:class/ability/warrior/4/of_player run return fail
scoreboard players remove @n[type=armor_stand,tag=gilded_region_1] marker_2 1
execute if entity @s[type=#minecraft:impact_projectiles] at @s run playsound minecraft:item.shield.block hostile @a ~ ~ ~
execute if entity @s[type=#minecraft:impact_projectiles] unless function core:class/ability/warrior/4/of_player run return run function operation:stats/kill_this

execute if entity @s[nbt={HurtTime:0s}] at @s run playsound minecraft:item.shield.block hostile @a ~ ~ ~
execute if entity @s[nbt={HurtTime:0s}] run damage @s 0.1 mob_attack by @n[type=armor_stand,tag=gilded_region_1]




