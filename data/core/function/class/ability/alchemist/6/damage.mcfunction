effect give @s slowness 2 0 true
effect give @s weakness 2 0 true
$execute if entity @a[nbt={UUID:$(owner)},limit=1] run damage @s $(damage) core:custom_magic by @a[nbt={UUID:$(owner)},limit=1]
