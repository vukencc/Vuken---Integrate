data merge entity @s {NoGravity:1b,Invulnerable:1b,Invisible:1b,attributes:[{base:0.001,id:scale}],equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"operation:enemy_event/on_death_tick":1}}}}}
execute positioned ^ ^-100 ^ run ride @s mount @n[tag=EnemyInInit]
execute on vehicle run data modify storage temp temp set from entity @s Tags
data modify entity @s Tags set from storage temp temp
execute store result score @s stdTemp1 run data get entity @s Pos[1] 1000
scoreboard players remove @s stdTemp1 100000
execute store result score @s stdTemp2 on vehicle run data get entity @s Pos[1] 1000
scoreboard players operation @s stdTemp2 -= @s stdTemp1
execute store result entity @s data.dy double 0.001 run scoreboard players get @s stdTemp2