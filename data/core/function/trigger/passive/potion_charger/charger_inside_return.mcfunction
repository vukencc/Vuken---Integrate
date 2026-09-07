$item replace entity @s weapon.mainhand from entity @n[type=acacia_chest_boat,tag=PotionCharger.Init] container.$(Slot)
$item replace entity @n[type=acacia_chest_boat,tag=PotionCharger.Init] container.$(Slot) with air
tag @s add stdTemp5
execute store result storage temp_id id int 1 run scoreboard players get @s marker
function core:trigger/passive/potion_charger/container_change with storage temp_id