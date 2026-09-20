# A failed attacker fork may not invoke the store callback; never reuse a prior hit.
scoreboard players set @s assassin.tmp 0
execute store success score @s assassin.tmp on attacker if entity @s[type=player,scores={class=5,assassin.pas1=2}] if predicate core:player/falling
execute unless score @s assassin.tmp matches 1 run return fail
execute on attacker store result storage core:assassin_6 value double 0.025 run attribute @s attack_damage get 10
execute if entity @s[tag=Elite] on attacker store result storage core:assassin_6 value double 0.06 run attribute @s attack_damage get 10
execute if entity @s[tag=Boss] on attacker store result storage core:assassin_6 value double 0.08 run attribute @s attack_damage get 10
execute on attacker run data modify storage core:assassin_6 owner set from entity @s UUID
function core:class/ability/assassin/6/damage_uuid with storage core:assassin_6
execute at @s run particle enchanted_hit ~ ~1 ~ 0.35 0.5 0.35 0.15 18 normal
execute at @s run playsound entity.player.attack.crit player @a[distance=..20] ~ ~ ~ 0.6 0.8
