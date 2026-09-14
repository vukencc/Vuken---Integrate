
function core:data/swap_offhand

# The ranged trigger enchantment also identifies existing bows without s_trigger/custom data.
execute if score @s class matches 4 if items entity @s weapon.mainhand #range if items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:inter/arrow_effect"}]] if predicate operation:stats/sneaking run return run function operation:trigger/sswap
execute if score @s class matches 4 if items entity @s weapon.mainhand #range if items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:inter/arrow_effect"}]] unless predicate operation:stats/sneaking run return run function operation:trigger/swap

execute if items entity @s weapon.mainhand *[custom_data~{s_trigger:1b}] if predicate operation:stats/sneaking run function operation:trigger/sswap
execute if items entity @s weapon.mainhand *[custom_data~{s_trigger:1b}] unless predicate operation:stats/sneaking run function operation:trigger/swap
