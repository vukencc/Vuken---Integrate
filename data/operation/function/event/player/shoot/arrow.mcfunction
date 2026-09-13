# as/at the arrow shot from the player
# close to player, @p is acceptable
# from function -> core:custom_ench/range/arrow_center
### function core:custom_ench/range/arrow_center
# args : damage, etc
$execute if score @p ench.attention.count matches 3.. run function core:custom_ench/forge/attention/modifier {damage:$(damage)}
function core:class/ability/scout/2/on_shoot
