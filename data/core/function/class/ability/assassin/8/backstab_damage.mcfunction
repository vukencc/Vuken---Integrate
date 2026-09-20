execute as @p[tag=assassin.8.attacker] store result storage core:assassin_8 value double 0.0035 run attribute @s attack_damage get 100
execute as @p[tag=assassin.8.attacker,scores={assassin.pas3=2..}] store result storage core:assassin_8 value double 0.006 run attribute @s attack_damage get 100
execute as @p[tag=assassin.8.attacker] run data modify storage core:assassin_8 owner set from entity @s UUID
function core:class/ability/assassin/8/damage_uuid with storage core:assassin_8

execute at @s run particle dust_color_transition{from_color:4329983,to_color:15132671,scale:0.9} ~ ~1 ~ 0.4 0.65 0.4 0.05 18 normal
execute as @p[tag=assassin.8.attacker] at @s run playsound entity.player.attack.crit hostile @s ~ ~ ~ 0.65 0.75 0
