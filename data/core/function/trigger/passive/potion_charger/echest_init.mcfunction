particle enchant ~ ~ ~ -1 -1 -1 3.5 10 normal
execute at @a if score @p marker = @s marker as @p if predicate operation:stats/sneaking run return fail
item modify entity @s saddle [{function:"set_enchantments",enchantments:{"core:system/echest/tick":1}}]
item modify entity @s saddle [{function:"set_enchantments",enchantments:{"core:system/echest/init":0}}]
summon interaction ~ ~-1 ~ {width:2,height:2,Tags:["echest_box"]}
