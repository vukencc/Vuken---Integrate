execute if score @s wand.slc.cd matches 1.. run return fail
execute store result score @s wand.slc.cd run function core:custom_ench/aptitude/cal {time:240}

execute positioned ^ ^ ^1 run summon snowball ~ ~ ~ {Item:{id:"crying_obsidian",count:1},Tags:["t_limited_with","stdTemp1"],Passengers:[{id:armor_stand,NoGravity:1b,Invulnerable:1b,Invisible:1b,attributes:[{base:0.01,id:scale}],equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"core:class/mage/5":1,"operation:stats/t_limited_1":1}}}},data:{value:0,stats:{timing_limited:70}}}],NoGravity:true,Silent:1b}
execute positioned ^ ^ ^1 as @n[type=snowball] run function core:class/ability/mage/5/set

playsound entity.ender_dragon.shoot hostile @s ~ ~ ~ 1 1.5 1