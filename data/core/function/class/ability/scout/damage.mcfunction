$execute store success score @s scout.tmp run damage @s $(value) core:custom_ranged by @a[nbt={UUID:$(owner)},limit=1]
$execute if score @s scout.tmp matches 1 run function core:class/ability/scout/4/on_damage {owner:$(owner)}
