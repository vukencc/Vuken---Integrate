function core:data/_rotate_tick_
rotate @s ~4 0
execute as @p unless predicate core:player/y_static run return fail 
execute if block ~ ~-1 ~ #passable run return fail
execute if block ~0.3 ~-1 ~ #passable run return fail
execute if block ~-0.3 ~-1 ~ #passable run return fail
execute if block ~ ~-1 ~0.3 #passable run return fail
execute if block ~ ~-1 ~-0.3 #passable run return fail
tp @s ~ ~ ~