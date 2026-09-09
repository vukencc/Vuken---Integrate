execute if score @s wand.rc.cd matches 1.. run return fail
execute store result score @s wand.rc.cd run function core:custom_ench/aptitude/cal {time:200}

execute positioned ^ ^ ^1 run summon snowball ~ ~ ~ {Item:{id:"ender_pearl",count:1,components:{item_model:magma_cream}},Tags:["t_limited_with","stdTemp1"],Passengers:[{id:armor_stand,NoGravity:1b,Invulnerable:1b,Invisible:1b,attributes:[{base:0.01,id:scale}],equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"core:class/mage/2":1,"operation:stats/t_limited_1":1}}}},data:{p1:{value:0},p2:{value:0},stats:{timing_limited:70}}}],NoGravity:true,Silent:1b}
execute positioned ^ ^ ^1 as @n[type=snowball] run function core:class/ability/mage/2/set

playsound entity.blaze.shoot hostile @s ~ ~ ~ 1 1.5 1

function core:class/ability/mage/7/push {id:2}