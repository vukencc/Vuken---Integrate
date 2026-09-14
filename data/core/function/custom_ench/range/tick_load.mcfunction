execute if items entity @s weapon.mainhand *[custom_data~{Tool:1}] run return fail
item modify entity @s weapon.mainhand {function:"set_custom_data",tag:{s_trigger:1b}}
enchant @s core:inter/arrow_effect
execute store result storage temp temp int 1 run data get entity @s SelectedItem.components."minecraft:custom_data".range
function core:custom_ench/range/init with storage temp
