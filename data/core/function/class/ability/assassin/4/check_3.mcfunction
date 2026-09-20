execute if entity @s[tag=assassin.4.hit] run return fail
tag @s add assassin.4.hit
function core:damage/melee/do with storage input
data modify entity @s data.assassin_4.value set from storage input_2 value
data modify entity @s data.assassin_4.owner set from storage input_3 value
scoreboard players set @s assassin.4.duration -80
particle crit ~ ~1 ~ 0.35 0.65 0.35 0.15 18 normal
particle dust_color_transition{from_color:9102591,to_color:16777215,scale:0.9} ~ ~1 ~ 0.25 0.45 0.25 0.02 10 normal
