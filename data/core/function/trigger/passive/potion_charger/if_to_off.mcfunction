execute positioned ~ ~-1 ~ as @n[type=interaction,tag=echest_box,dx=1,dy=1,dz=1] if data entity @s attack run return run scoreboard players set $tmp stdTemp1 1
execute positioned ~ ~-1 ~ as @n[type=interaction,tag=echest_box,dx=1,dy=1,dz=1] if data entity @s interaction run return run scoreboard players set $tmp stdTemp1 1
execute at @a if score @p marker = @s marker as @p unless items entity @s weapon.mainhand *[custom_data~{IsPotionCharger:true}] run return run scoreboard players set $tmp stdTemp1 1
execute at @a if score @p marker = @s marker as @p if predicate {condition:"entity_properties",entity:"this",predicate:{movement:{speed:{min:0.0000001}}}} run return run scoreboard players set $tmp stdTemp1 1
execute as @a store result score @s stdTemp1 run data get entity @s SelectedItem.components."minecraft:custom_data".BundleID
execute at @a if score @p marker = @s marker unless score @p stdTemp1 = @s marker_2 run return run scoreboard players set $tmp stdTemp1 1

return fail