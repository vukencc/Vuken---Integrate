execute if score @s wand.src.cd matches 1.. run return fail
execute store result score @s wand.src.cd run function core:custom_ench/aptitude/cal {time:280}

execute if score @s wand.src matches 1 run summon armor_stand ~ ~ ~ {data:{value:0.0},NoGravity:1b,Invulnerable:1b,Invisible:1b,Tags:["t_limited_with","mage.snowstorm","mage.snowstorm.1"],equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"core:class/mage/3":1}}}},Passengers:[{\
id:armor_stand,NoGravity:1b,Invulnerable:1b,Invisible:1b,equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"operation:stats/t_limited_1":1}}}},data:{stats:{timing_limited:80}}\
}]}
execute if score @s wand.src matches 2 run summon armor_stand ~ ~ ~ {data:{value:0.0},NoGravity:1b,Invulnerable:1b,Invisible:1b,Tags:["t_limited_with","mage.snowstorm","mage.snowstorm.2"],equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"core:class/mage/3":1}}}},Passengers:[{\
id:armor_stand,NoGravity:1b,Invulnerable:1b,Invisible:1b,equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"operation:stats/t_limited_1":1}}}},data:{stats:{timing_limited:80}}\
}]}

rotate @n[type=armor_stand,tag=mage.snowstorm] ~ 0

scoreboard players operation @n[type=armor_stand,tag=mage.snowstorm] marker = @s marker

execute if score @s wand.src matches 1 store result entity @n[type=armor_stand,tag=mage.snowstorm] data.value double 1.0 run function core:damage/magic/get {value:7}
execute if score @s wand.src matches 2 store result entity @n[type=armor_stand,tag=mage.snowstorm] data.value double 1.0 run function core:damage/magic/get {value:14}

playsound item.elytra.flying hostile @s ~ ~ ~ 1 2 1