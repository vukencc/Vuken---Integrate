
function core:data/swap_offhand

execute if items entity @s weapon.mainhand *[custom_data~{s_trigger:1b}] if predicate operation:stats/sneaking run function operation:trigger/sswap
execute if items entity @s weapon.mainhand *[custom_data~{s_trigger:1b}] unless predicate operation:stats/sneaking run function operation:trigger/swap