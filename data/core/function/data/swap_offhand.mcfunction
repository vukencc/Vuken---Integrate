execute if items entity @s weapon.mainhand *[custom_data~{Offhand:1b}] run return run function operation:container/swap_holding
execute unless items entity @s weapon.mainhand * run return run function operation:container/swap_holding

summon item ~ ~ ~ {Item:{id:"minecraft:stone_button",count:1},PickupDelay:0,Tags:["temp_swap_inter"]}
item replace entity @n[type=item,tag=temp_swap_inter] container.0 from entity @s weapon.offhand
item replace entity @s weapon.offhand with air