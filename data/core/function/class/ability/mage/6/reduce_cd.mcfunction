function core:class/ability/util/reduce_cd_pattern {scb:wand.rc,value:20}
function core:class/ability/util/reduce_cd_pattern {scb:wand.src,value:20}
function core:class/ability/util/reduce_cd_pattern {scb:wand.lc,value:20}
function core:class/ability/util/reduce_cd_pattern {scb:wand.slc,value:20}
function core:class/ability/util/reduce_cd_pattern {scb:wand.drop,value:20}
function core:class/ability/util/reduce_cd_pattern {scb:wand.sdrop,value:20}
execute if score @s wand.swap matches 2 run function core:class/ability/util/reduce_cd_pattern {scb:wand.swap,value:20}
function core:class/ability/util/reduce_cd_pattern {scb:wand.sswap,value:20}
scoreboard players set @s bacTemp1 0