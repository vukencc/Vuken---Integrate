$execute unless entity @a[nbt={UUID:$(owner)},limit=1] run return fail
$execute as @e[type=!#minecraft:bypass,nbt=!{Health:0.0f}] if predicate {condition:entity_properties,entity:this,predicate:{distance:{horizontal:{max:$(radius)},y:{max:$(radius)}}}} run function core:class/ability/alchemist/8/damage {owner:$(owner),damage:$(damage),spring:$(spring),coefficient:$(coefficient)}
$execute if predicate {condition:value_check,value:$(spring),range:{min:1}} as @a[distance=..$(radius),gamemode=!spectator] run function core:class/ability/alchemist/8/cleanse
