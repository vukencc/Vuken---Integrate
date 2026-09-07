effect give @s resistance infinite 11 true
attribute @s movement_efficiency base set 0.01
attribute @s water_movement_efficiency base set 0.01
attribute @s movement_efficiency modifier add vanilla_mme_modifier -1 add_multiplied_total
attribute @s water_movement_efficiency modifier add vanilla_wme_modifier -1 add_multiplied_total
attribute @s explosion_knockback_resistance base set 0

function operation:event/player/refresh/on_respawn