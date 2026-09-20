function core:class/ability/util/reduce_cd_pattern {scb:melee.rc,value:20}
function core:class/ability/util/reduce_cd_pattern {scb:melee.src,value:20}
function core:class/ability/util/reduce_cd_pattern {scb:melee.slc,value:20}
function core:class/ability/util/reduce_cd_pattern {scb:melee.drop,value:20}
function core:class/ability/util/reduce_cd_pattern {scb:melee.sdrop,value:20}
function core:class/ability/util/reduce_cd_pattern {scb:melee.swap,value:20}
function core:class/ability/util/reduce_cd_pattern {scb:melee.sswap,value:20}
function vfam:add {target:"@s",effect:attack_damage,id:assassin_5_dmg,value:0.3,duration:120,type:add_multiplied_total}
function vfam:add {target:"@s",effect:attack_speed,id:assassin_5_spd,value:0.2,duration:120,type:add_multiplied_total}
function core:class/ability/assassin/5/fx/reward
playsound block.chain.break player @s ~ ~ ~ 0.7 1.2
