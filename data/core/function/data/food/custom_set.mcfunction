data modify storage food_values a set from entity @s SelectedItem.components."minecraft:food".nutrition
data modify storage food_values b set from entity @s SelectedItem.components."minecraft:food".saturation
function core:data/food/custom_init with storage food_values