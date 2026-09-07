scoreboard players set @s natDamageResisted 0

execute if score $difficulty config matches 1 store result storage mob_damage value double 0.75 on attacker as @s run data get entity @s data.mob.range 1.0
execute if score $difficulty config matches 2 store result storage mob_damage value double 1.0 on attacker as @s run data get entity @s data.mob.range 1.0
execute if score $difficulty config matches 3 store result storage mob_damage value double 1.25 on attacker as @s run data get entity @s data.mob.range 1.0

execute at @s on attacker if predicate {condition:"entity_properties",entity:"this",predicate:{effects:{weakness:{}}}} run function core:defence/range_weakness

execute at @s run function operation:event/player/take_damage/ranged/trigger_before_apply
execute at @s run function operation:event/player/take_damage/trigger_before_apply

execute at @s on attacker store result score @p damageResisted run data get storage mob_damage value 10

execute at @s run function core:defence/range_cal_trigger
execute at @s run function operation:event/player/take_damage/ranged/trigger
advancement revoke @s only core:range_taken