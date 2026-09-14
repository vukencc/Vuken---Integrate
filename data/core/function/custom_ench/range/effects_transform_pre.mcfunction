tag @s add stdTemp1
# Damage dispatch uses the actual projectile/victim pair from arrow_effect post_attack.
execute at @s run function operation:event/player/arrow_hurt_entity/player_trigger
tag @s remove stdTemp1
advancement revoke @s only core:arrow_hurt_entity
schedule function core:custom_ench/range/pre_delay 1t
