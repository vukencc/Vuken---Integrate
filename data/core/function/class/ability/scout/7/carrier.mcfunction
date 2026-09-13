data merge entity @s {Marker:1b,Invisible:1b,Invulnerable:1b,NoGravity:1b,Silent:1b,Tags:["scout.wind"],equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"core:class/scout/entity":1}}}}}
data modify entity @s data.scout set from storage core:scout wind
scoreboard players set @s scout.life 80
ride @s mount @n[type=snowball,tag=scout.wind.new]
