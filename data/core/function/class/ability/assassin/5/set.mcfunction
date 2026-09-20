data modify entity @s Item set from storage core:assassin_5 weapon
tag @s remove assassin.5.new_item
tag @s add assassin.5.projectile
data merge entity @s {PickupDelay:32767,Glowing:1b}
team join pink @s

function operation:motion/set_forward/init {speed:0.8}
data modify entity @s Motion set from storage motion set_forward

execute if data storage core:assassin_5 {level:1} run summon armor_stand ~ ~ ~ {Tags:["assassin.5.1","assassin.5.new"],NoGravity:1b,Marker:1b,Invulnerable:1b,Invisible:1b,equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"core:class/assassin/5":1,"operation:stats/t_limited_2":1}}}},data:{stats:{timing_limited:160}}}
execute if data storage core:assassin_5 {level:2} run summon armor_stand ~ ~ ~ {Tags:["assassin.5.2","assassin.5.new"],NoGravity:1b,Marker:1b,Invulnerable:1b,Invisible:1b,equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"core:class/assassin/5":1,"operation:stats/t_limited_2":1}}}},data:{stats:{timing_limited:160}}}

execute as @n[type=armor_stand,tag=assassin.5.new,distance=..1,limit=1,sort=nearest] run function core:class/ability/assassin/5/init
