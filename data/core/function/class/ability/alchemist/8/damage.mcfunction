$execute at @s unless entity @a[nbt={UUID:$(owner)},limit=1,distance=..16] run return run damage @s $(damage) core:custom_magic by @a[nbt={UUID:$(owner)},limit=1]
$execute if predicate {condition:value_check,value:$(spring),range:{min:1}} run function core:class/ability/alchemist/8/count
$execute unless predicate {condition:value_check,value:$(spring),range:{min:1}} run return run damage @s $(damage) core:custom_magic by @a[nbt={UUID:$(owner)},limit=1]
scoreboard players operation @s alch.value = @s alch.debuffs
$execute if predicate {condition:value_check,value:$(spring),range:{min:2}} run scoreboard players operation @s alch.value += @s alch.debuffs
$execute if predicate {condition:value_check,value:$(spring),range:{min:2}} run scoreboard players operation @s alch.value += @s alch.strong
$execute if predicate {condition:value_check,value:$(spring),range:{min:2}} run scoreboard players operation @s alch.value += @s alch.strong
$data modify storage core:alchemist spring_math set value {base:$(damage),coefficient:$(coefficient)}
execute store result score @s alch.tmp run data get storage core:alchemist spring_math.coefficient 1000
scoreboard players operation @s alch.value *= @s alch.tmp
execute store result score @s alch.tmp run data get storage core:alchemist spring_math.base 1000
scoreboard players operation @s alch.value += @s alch.tmp
execute store result storage core:alchemist spring_math.damage double 0.001 run scoreboard players get @s alch.value
$data modify storage core:alchemist spring_math.owner set value $(owner)
function core:class/ability/alchemist/8/apply with storage core:alchemist spring_math
