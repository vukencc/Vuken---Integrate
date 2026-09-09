execute if score @s mage.7.queue.3 matches 1 run function core:class/ability/util/reduce_cd_pattern {scb:wand.lc,value:999}
execute if score @s mage.7.queue.3 matches 2 run function core:class/ability/util/reduce_cd_pattern {scb:wand.rc,value:999}
execute if score @s mage.7.queue.3 matches 3 run function core:class/ability/util/reduce_cd_pattern {scb:wand.src,value:999}
execute if score @s mage.7.queue.3 matches 4 run function core:class/ability/util/reduce_cd_pattern {scb:wand.drop,value:999}
execute if score @s mage.7.queue.3 matches 5 run function core:class/ability/util/reduce_cd_pattern {scb:wand.slc,value:999}
execute if score @s mage.7.queue.3 matches 6 run function core:class/ability/util/reduce_cd_pattern {scb:wand.swap,value:999}

execute if score @s wand.swap matches 1 run return fail
execute if score @s wand.sdrop matches 1 run return fail

execute if score @s mage.7.queue.2 matches 1 run function core:class/ability/util/reduce_cd_pattern {scb:wand.lc,value:999}
execute if score @s mage.7.queue.2 matches 2 run function core:class/ability/util/reduce_cd_pattern {scb:wand.rc,value:999}
execute if score @s mage.7.queue.2 matches 3 run function core:class/ability/util/reduce_cd_pattern {scb:wand.src,value:999}
execute if score @s mage.7.queue.2 matches 4 run function core:class/ability/util/reduce_cd_pattern {scb:wand.drop,value:999}
execute if score @s mage.7.queue.2 matches 5 run function core:class/ability/util/reduce_cd_pattern {scb:wand.slc,value:999}
execute if score @s mage.7.queue.2 matches 6 run function core:class/ability/util/reduce_cd_pattern {scb:wand.swap,value:999}