execute unless score @s assassin.4.duration matches ..-1 run return fail
function core:class/ability/assassin/7/damage_uuid with entity @s data.assassin_4
execute at @s run particle crit ~ ~1 ~ 0.28 0.6 0.28 0.12 14 normal
execute at @s run playsound entity.player.attack.sweep player @a[distance=..20] ~ ~ ~ 0.35 1.7
