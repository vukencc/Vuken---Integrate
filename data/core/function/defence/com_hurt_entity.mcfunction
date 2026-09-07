data merge storage melee_ench {}
function core:custom_ench/melee/ench_pre

tag @s add tempApply

execute at @s positioned ^ ^ ^2 as @e[type=!#minecraft:bypass,distance=..4,nbt={HurtTime:10s}] run function core:custom_ench/melee/melee_argu with storage melee_ench
execute as @p at @s if score @s melee_quake matches 1.. run function core:custom_ench/melee/melee_trig with storage melee_ench
execute if score @s melee_combo matches 1.. run scoreboard players set @s ench_combo_timing 30
function operation:event/player/melee_hurt_entity/trigger

tag @s remove tempApply

advancement revoke @s only core:melee_hurt_entity
