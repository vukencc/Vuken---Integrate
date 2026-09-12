data merge entity @s {Marker:1b,Invisible:1b,Invulnerable:1b,NoGravity:1b,Silent:1b,Tags:["alch.gift"],CustomName:{text:"幸运礼物",color:"aqua"},CustomNameVisible:1b,equipment:{head:{id:chest,count:1},saddle:{id:saddle,count:1,components:{enchantments:{"core:class/alchemist/entity":1}}}}}
data modify entity @s data set from storage core:alchemist gift
scoreboard players set @s alch.life 1200
