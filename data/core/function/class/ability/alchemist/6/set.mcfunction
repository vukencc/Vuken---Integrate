data merge entity @s {Marker:1b,Invisible:1b,Invulnerable:1b,NoGravity:1b,Silent:1b,Tags:["alch.pool"],equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"core:class/alchemist/entity":1}}}}}
data modify entity @s data set from storage core:alchemist pool
scoreboard players set @s alch.life 120
function core:class/ability/alchemist/6/pulse with entity @s data
function core:class/ability/alchemist/6/border_particle with entity @s data
