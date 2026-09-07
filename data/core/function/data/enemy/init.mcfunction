item modify entity @s saddle [{function:set_enchantments,enchantments:{"core:system/enemy/init":0}},{function:set_components,components:{equippable:{slot:"saddle",equip_sound:{sound_id:"",range:0}}}}]
data merge entity @s {drop_chances:{body:0,chest:0,feet:0,head:0,legs:0,mainhand:0,offhand:0,saddle:0}}

execute if score $difficulty config matches 1 store result entity @s data.mob.mhp double 0.09 run data get entity @s data.mob.mhp 10
execute if score $difficulty config matches 2 store result entity @s data.mob.mhp double 0.1 run data get entity @s data.mob.mhp 10
execute if score $difficulty config matches 3 store result entity @s data.mob.mhp double 0.11 run data get entity @s data.mob.mhp 10

function core:data/enemy/attribute with entity @s data.mob.s
function core:data/enemy_init_2 with entity @s data.mob

tag @s add EnemyInInit
execute at @s rotated ~ 0 anchored eyes positioned ^ ^100 ^0.00001 summon armor_stand run function operation:event/enemy/on_death/init
tag @s remove EnemyInInit

execute unless items entity @s armor.feet * run data merge entity @s {equipment:{feet:{id:stone,count:1}}}
function operation:event/enemy/on_spawn/trigger

item modify entity @s saddle [{function:set_enchantments,enchantments:{"core:system/enemy/tick":1}}]

###Example: 20-hp 4-melee-damage zombie
###summon zombie ~ ~ ~ {data:{mob:{mhp:20,melee:4,range:0,magic:0,s:{kbr:0.25,spd:0,scale:1}}},equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"core:system/enemy/init":1}}}}}