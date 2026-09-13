tag @s add scout.mark
data modify entity @s data.scout set from storage core:scout shot
scoreboard players set @s scout.life 200
scoreboard players set @s scout.used 0
function core:class/ability/scout/4/ride with entity @s data.scout
