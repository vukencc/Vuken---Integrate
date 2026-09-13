$execute if data entity @s data.scout{level:2} as @a[nbt={UUID:$(owner)},scores={class=4,range.swap=2},limit=1] run function core:class/ability/util/reduce_cd_pattern {scb:"range.swap",value:20}
kill @s
