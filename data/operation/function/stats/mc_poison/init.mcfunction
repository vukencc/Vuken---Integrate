execute store result score @s stdTemp1 run data get entity @s active_effects.[{id:"minecraft:poison"}].amplifier
scoreboard players add @s stdTemp1 1
execute store result storage temp_poison_dmg temp int 1 run scoreboard players get @s stdTemp1
playsound minecraft:block.slime_block.hit hostile @a ~ ~ ~ 0.5 1 1
execute if entity @s[type=player] run return run function core:defence/env_cal_apply with storage temp_poison_dmg
function operation:stats/mc_poison/damage with storage temp_poison_dmg