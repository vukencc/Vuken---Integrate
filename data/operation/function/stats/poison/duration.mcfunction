execute unless predicate {condition:entity_properties,entity:"this",predicate:{effects:{wither:{}}}} run return run function operation:stats/poison/end
scoreboard players remove @s stats.poisoned.duration 1
execute if score @s stats.poisoned.duration matches ..0 run return run function operation:stats/poison/end
scoreboard players operation @s stdTemp1 = @s stats.poisoned.duration
scoreboard players operation @s stdTemp1 %= $20 math.times
execute unless score @s stdTemp1 matches 0 run return fail
particle block{block_state:{Name:black_concrete}} ~ ~1 ~ 1.2 1.5 1.2 0.1 40 normal
playsound minecraft:entity.bogged.hurt hostile @s ~ ~-0.5 ~ 0.8 1.2 1
execute store result storage poison scale double 0.0025 run scoreboard players get @s stats.poisoned.level
function operation:stats/poison/calc with storage poison
function operation:stats/poison/damage with storage poison