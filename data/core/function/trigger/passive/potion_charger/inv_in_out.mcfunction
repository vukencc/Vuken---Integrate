execute store result storage temp_id id int 1 run scoreboard players get @s marker
execute as @s at @s run function core:trigger/passive/potion_charger/container_change with storage temp_id
advancement revoke @s only core:trigger/potion_charger/item_in_out