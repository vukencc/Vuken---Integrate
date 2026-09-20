execute unless score @s class matches 5 run return run scoreboard players set @s assassin.8.damage_dealt 0
execute unless score @s assassin.pas3 matches 1.. run return run scoreboard players set @s assassin.8.damage_dealt 0

scoreboard players operation @s stdTemp1 = @s max_class_points
scoreboard players operation @s stdTemp1 *= $10 math.times
scoreboard players add @s stdTemp1 30
scoreboard players operation @s stdTemp1 *= $10 math.times
execute if score @s stdTemp1 > @s assassin.8.damage_dealt run return fail

execute if score @s assassin.pas3 matches 1 at @s positioned ~-2.5 ~-1 ~-2.5 as @e[type=!#bypass,dx=4,dy=3,dz=4] run function operation:stats/blinded/init {duration:15}
execute if score @s assassin.pas3 matches 2 at @s positioned ~-2.5 ~-1 ~-2.5 as @e[type=!#bypass,dx=4,dy=3,dz=4] run function operation:stats/blinded/init {duration:25}

playsound block.fire.extinguish hostile @s ~ ~2 ~ 1 0.5 1
playsound block.fire.extinguish hostile @s ~ ~2 ~ 1 2 1
particle soul_fire_flame ~ ~1 ~ 1.3 0.6 1.3 0.05 45 normal
particle reverse_portal ~ ~1 ~ 1.65 0.75 1.65 0.08 34 normal
particle dust_color_transition{from_color:4329983,to_color:15132671,scale:1.0} ~ ~1 ~ 1.45 0.55 1.45 0.03 28 normal

scoreboard players set @s assassin.8.damage_dealt 0
