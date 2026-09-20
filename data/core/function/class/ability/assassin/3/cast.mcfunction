execute if score @s melee.src matches 0 run return fail
execute if score @s melee.src.cd matches 1.. run return fail
execute unless score @s class matches 5 run return fail

execute store result score @s melee.src.cd run function core:custom_ench/aptitude/cal {time:280}

playsound block.fire.extinguish hostile @s ~ ~2 ~ 1 0.5 1
playsound block.fire.extinguish hostile @s ~ ~2 ~ 1 2 1
particle large_smoke ~ ~1 ~ 1.3 0.6 1.3 0.05 35 normal
particle witch ~ ~1 ~ 1.1 0.45 1.1 0.07 25 normal
particle dust_color_transition{from_color:5636095,to_color:15074303,scale:1.05} ~ ~0.3 ~ 2.9 0.12 2.9 0.015 40 normal

execute if score @s melee.src matches 1 run summon armor_stand ~ ~ ~ {NoGravity:1b,Invulnerable:1b,Invisible:1b,attributes:[{base:0.01,id:scale}],Tags:["assassin.3.1","assassin.3.new"],equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"operation:stats/t_limited_2":1,"core:class/assassin/3":1}}}},data:{stats:{timing_limited:160}}}
execute if score @s melee.src matches 2 run summon armor_stand ~ ~ ~ {NoGravity:1b,Invulnerable:1b,Invisible:1b,attributes:[{base:0.01,id:scale}],Tags:["assassin.3.2","assassin.3.new"],equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"operation:stats/t_limited_2":1,"core:class/assassin/3":1}}}},data:{stats:{timing_limited:160}}}

scoreboard players set @e[type=armor_stand,tag=assassin.3.new,distance=..1] timing_limited 160
tag @e[type=armor_stand,tag=assassin.3.new,distance=..1] remove assassin.3.new
execute if score @s melee.src matches 2 run scoreboard players set @s assassin.3.duration -120
function core:class/ability/assassin/7/get
