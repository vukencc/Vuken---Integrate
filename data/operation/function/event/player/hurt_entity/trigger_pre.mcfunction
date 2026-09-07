function operation:event/player/hurt_entity/trigger
scoreboard players set @s time_not_attacking 0
advancement revoke @s only core:hurt_entity