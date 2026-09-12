data merge entity @s {Marker:1b,Invisible:1b,Invulnerable:1b,NoGravity:1b,Silent:1b,Tags:["alch.bomb"],equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"core:class/alchemist/entity":1}}}}}
data modify entity @s data set from storage core:alchemist bomb
scoreboard players set @s alch.life 80
ride @s mount @n[type=snowball,tag=alch.bomb.new]
