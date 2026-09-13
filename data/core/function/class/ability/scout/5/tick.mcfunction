execute unless entity @s[tag=scout.decoy] run return fail
execute store result score @s scout.tmp run function core:class/ability/scout/5/owner_valid with entity @s data.scout
execute unless score @s scout.tmp matches 1 run return run function core:class/ability/scout/5/remove
execute if entity @s[nbt={Health:0.0f}] run return run function core:class/ability/scout/5/end
# Command/environment damage has no post_attack callback; count it on the next tick.
execute store result score @s scout.health run data get entity @s Health 1000
execute if score @s scout.health matches ..1023999 run function core:class/ability/scout/5/hit
execute unless entity @s[tag=scout.decoy] run return fail
scoreboard players add @s scout.pulse 1
execute if score @s scout.pulse matches 10.. run function core:class/ability/scout/5/taunt
particle dust{color:[0.8,0.1,0.9],scale:0.8} ~ ~1.6 ~ 0.3 0.2 0.3 0 2 normal
