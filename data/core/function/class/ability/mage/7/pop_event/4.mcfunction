function core:class/ability/util/reduce_cd_pattern {scb:wand.drop,value:40}
execute if score @s wand.drop matches 2 if score @s wand.sdrop matches 2 run function core:class/ability/util/reduce_cd_pattern {scb:wand.drop,value:40}
playsound block.beacon.activate hostile @a ~ ~ ~