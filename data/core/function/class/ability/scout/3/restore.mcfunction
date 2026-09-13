$execute as @e[type=item,distance=..4,nbt={Thrower:$(owner)},sort=nearest] if items entity @s contents #range run return run function core:class/ability/scout/3/restore_item {owner:$(owner)}
return 0
