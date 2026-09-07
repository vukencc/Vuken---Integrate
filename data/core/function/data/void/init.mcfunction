$data merge entity @s {NoGravity:1b,Marker:1b,Invisible:1b,Invulnerable:1b,Tags:["void_marker"],data:{id:$(id)},attributes:[{base:0.0001,id:scale}]}
$scoreboard players set @s marker $(id)
data merge entity @s {equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"core:inter/player":1}}}}}

execute store result score @s stdTemp1 if entity @e[type=armor_stand,tag=void_marker,tag=player_marker]
execute if score @s stdTemp1 matches 0 run tag @s add player_marker
execute if score @s stdTemp1 matches 2.. run function core:data/void/clear_extra
