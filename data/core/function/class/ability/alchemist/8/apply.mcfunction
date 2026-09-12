$execute store success score @s alch.2.hit run damage @s $(damage) core:custom_magic by @a[nbt={UUID:$(owner)},limit=1]
function core:class/ability/alchemist/2/on_magic_hit
