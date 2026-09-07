execute at @a if score @p marker = @s marker at @p positioned ^ ^ ^2 if entity @s[distance=8..] run return run scoreboard players set $tmp stdTemp1 1
execute at @a if score @p marker = @s marker as @p unless items entity @s weapon.mainhand *[custom_data~{Xenobundle:1b}] run return run scoreboard players set $tmp stdTemp1 1
execute as @a store result score @s stdTemp1 run data get entity @s SelectedItem.components."minecraft:custom_data".BundleID
execute at @a if score @p marker = @s marker unless score @p stdTemp1 = @s marker_2 run return run scoreboard players set $tmp stdTemp1 1

return fail 