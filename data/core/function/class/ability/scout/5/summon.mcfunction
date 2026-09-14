data merge entity @s {Age:-24000,Silent:1b,PersistenceRequired:1b,Health:1024.0f,attributes:[{id:"minecraft:max_health",base:1024.0},{id:"minecraft:knockback_resistance",base:1.0},{id:"minecraft:movement_speed",base:0.0}],Tags:["scout.decoy"],CustomName:{translate:"class.scout.ability5.name.text",color:"light_purple"},CustomNameVisible:1b,equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"core:class/scout/entity":1}}},head:{id:carved_pumpkin,count:1}},drop_chances:{saddle:0.0,head:0.0}}
data modify entity @s data.scout set from storage core:scout decoy
data modify entity @s data.scout.value set from entity @s data.scout.damage
data modify entity @s data.scout.target set from entity @s UUID
scoreboard players set @s scout.hits 5
execute if data entity @s data.scout{level:2} run scoreboard players set @s scout.hits 8
scoreboard players set @s scout.pulse 0
function operation:motion/set_forward/init {speed:1.1}
data modify entity @s Motion set from storage motion set_forward
