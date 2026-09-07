execute if items entity @s weapon.mainhand *[custom_data~{Tool:1}] run return fail
enchant @s core:inter/arrow_effect
execute store result storage temp temp int 1 run data get entity @s SelectedItem.components."minecraft:custom_data".range
function core:custom_ench/range/init with storage temp