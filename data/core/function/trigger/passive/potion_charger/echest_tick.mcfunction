particle enchant ~ ~ ~ -1 -1 -1 3.5 10 normal
execute positioned ~-3 ~-3 ~-3 as @n[type=interaction,tag=echest_box,dx=5,dy=5,dz=5] run tp @s ~3 ~2 ~3
execute unless function core:trigger/passive/potion_charger/if_to_off run return fail
kill @n[type=interaction,tag=echest_box]
execute on vehicle run function operation:stats/kill_this
function operation:stats/kill_this