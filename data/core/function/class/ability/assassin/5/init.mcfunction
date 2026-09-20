scoreboard players set @s timing_limited 160
data modify entity @s data.assassin_5_uuid set from storage core:assassin_5 owner
ride @s mount @e[type=minecraft:item,tag=assassin.5.projectile,distance=..1,limit=1,sort=nearest]
tag @s remove assassin.5.new
