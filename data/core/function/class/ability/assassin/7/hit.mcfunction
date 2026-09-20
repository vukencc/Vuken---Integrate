execute if entity @s[tag=assassin.moon.hit] run return fail
tag @s add assassin.moon.hit
$function core:class/ability/assassin/8/damage_uuid {value:$(value),owner:$(owner)}
particle crit ~ ~1 ~ 0.3 0.4 0.3 0.12 8 normal
