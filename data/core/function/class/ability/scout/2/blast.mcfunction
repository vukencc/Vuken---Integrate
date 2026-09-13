$execute store success score @s scout.tmp run damage @s $(value) core:custom_ranged by @a[nbt={UUID:$(owner)},limit=1]
execute unless score @s scout.tmp matches 1 run return fail
data modify entity @s Motion[1] set value 0.65d
effect give @s slow_falling 5 0 true
$function core:class/ability/scout/4/on_damage {owner:$(owner)}
