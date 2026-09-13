tag @s add scout.cloud
data modify entity @s data.scout set from storage core:scout cloud
scoreboard players set @s scout.life 100
execute if data entity @s data.scout{level:2} run scoreboard players set @s scout.life 140
function core:class/ability/scout/7/cloud_tick
