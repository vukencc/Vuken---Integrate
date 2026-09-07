execute if score @s melee.drop.cd matches 1.. run return fail

execute store result score @s melee.drop.cd run function core:custom_ench/aptitude/cal {time:300}
execute if score @s melee.swap matches 1 if score @s warrior.contract matches ..0 store result score @s melee.drop.cd run function core:custom_ench/aptitude/cal {time:270}
execute if score @s melee.swap matches 2 if score @s warrior.contract matches ..0 store result score @s melee.drop.cd run function core:custom_ench/aptitude/cal {time:240}

execute if score @s melee.drop matches 1 run summon minecraft:item_display ~ ~0.75 ~ {item: {count: 1, id: "minecraft:totem_of_undying"},Passengers:[{id:armor_stand,NoGravity:1b,Invulnerable:1b,Invisible:1b,data:{stats:{timing_limited:240}},Tags:["gilded_region_1"],attributes:[{base:0.01,id:scale}],equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"core:class/war/4":1,"operation:stats/t_limited_1":1}}}}}],Tags:["t_limited_with"],interpolation_duration: 3,teleport_duration:3,Glowing:true,glow_color_override:14403840}
execute if score @s melee.drop matches 2 run summon minecraft:item_display ~ ~0.75 ~ {item: {count: 1, id: "minecraft:totem_of_undying"},Passengers:[{id:armor_stand,NoGravity:1b,Invulnerable:1b,Invisible:1b,data:{stats:{timing_limited:240}},Tags:["gilded_region_2"],attributes:[{base:0.01,id:scale}],equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"core:class/war/4":1,"operation:stats/t_limited_1":1}}}}}],Tags:["t_limited_with"],interpolation_duration: 3,teleport_duration:3,Glowing:true,glow_color_override:14403840}

execute if score @s melee.drop matches 1 positioned ~ ~0.75 ~ run scoreboard players set @n[type=armor_stand,tag=gilded_region_1] timing_limited 240
execute if score @s melee.drop matches 2 positioned ~ ~0.75 ~ run scoreboard players set @n[type=armor_stand,tag=gilded_region_2] timing_limited 240

execute if score @s melee.drop matches 2 positioned ~ ~0.75 ~ store result entity @n[type=armor_stand,tag=gilded_region_2] data.value double 1.0 run function core:damage/melee/get {value:5}
execute if score @s melee.drop matches 2 positioned ~ ~0.75 ~ run scoreboard players operation @n[type=armor_stand,tag=gilded_region_2] marker = @s marker

execute if score @s melee.drop matches 1 positioned ~ ~0.75 ~ run scoreboard players set @n[type=armor_stand,tag=gilded_region_1] marker_2 5
execute if score @s melee.drop matches 2 positioned ~ ~0.75 ~ run scoreboard players set @n[type=armor_stand,tag=gilded_region_2] marker_2 7