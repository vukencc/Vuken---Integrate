execute unless data entity @s interaction unless data entity @s attack run return fail
data remove entity @s attack
data remove entity @s interaction
execute if entity @s[tag=all] run tag @a add tempItemFetcher 
execute as @a[tag=tempItemFetcher] at @s run summon item ~ ~ ~ {Tags:["item_fetched"],PickupDelay:0,Item:{id:stone,count:1}}
tag @a remove tempItemFetcher
execute as @n[type=item,tag=item_to_fetch] run item replace entity @e[type=item,tag=item_fetched] container.0 from entity @s container.0
tag @e[type=item] remove item_fetched
execute if entity @s[tag=infinity] run return fail
execute at @s run kill @n[type=item,tag=item_to_fetch]
execute at @s run kill @n[type=armor_stand,tag=item_fetch_particle]
kill @s