$item replace entity @a[nbt={UUID:$(owner)},limit=1] weapon.mainhand from entity @s contents
kill @s
return 1
