tp @s ~ ~0.5 ~
execute store result score @s entity_x run data get entity @s Pos[0] 10
execute store result score @s entity_y run data get entity @s Pos[1] 10
execute store result score @s entity_z run data get entity @s Pos[2] 10
tag @s add ringcenter
execute positioned ~ ~-0.5 ~ as @e[type=!#bypass,distance=..5,tag=!ringcenter] if predicate {condition:entity_properties,entity:"this",predicate:{distance:{horizontal:{max:4},y:{max:4}}}} run tag @s add ring
execute as @e[tag=ring] store result score @s entity_x run data get entity @s Pos[0] 10
execute as @e[tag=ring] store result score @s entity_y run data get entity @s Pos[1] 10
execute as @e[tag=ring] store result score @s entity_z run data get entity @s Pos[2] 10
execute as @e[tag=ring] run scoreboard players operation @s entity_x -= @e[tag=ringcenter,sort=nearest,limit=1] entity_x
execute as @e[tag=ring] run scoreboard players operation @s entity_y -= @e[tag=ringcenter,sort=nearest,limit=1] entity_y
execute as @e[tag=ring] run scoreboard players operation @s entity_z -= @e[tag=ringcenter,sort=nearest,limit=1] entity_z
execute as @e[tag=ring] store result entity @s Motion.[0] double -0.03 run scoreboard players get @s entity_x
execute as @e[tag=ring] store result entity @s Motion.[1] double -0.03 run scoreboard players get @s entity_y
execute as @e[tag=ring] store result entity @s Motion.[2] double -0.03 run scoreboard players get @s entity_z
tag @e remove ring
tag @s remove ringcenter
tp @s ~ ~-0.5 ~

execute rotated ~45 ~ run particle minecraft:dragon_breath ~0.00 ~ ~0.00 0.00 0 0.00 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~0.50 ~ ~0.87 -0.41 0 -0.92 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~-1.00 ~ ~1.73 1.17 0 -1.63 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~-3.00 ~ ~0.00 3.00 0 0.30 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~-2.00 ~ ~-3.46 1.65 0 3.66 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~2.50 ~ ~-4.33 -2.93 0 4.08 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~0.00 ~ ~0.00 0.00 0 0.00 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~-0.87 ~ ~0.50 0.92 0 -0.41 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~-1.73 ~ ~-1.00 1.63 0 1.17 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~-0.00 ~ ~-3.00 -0.30 0 3.00 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~3.46 ~ ~-2.00 -3.66 0 1.65 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~4.33 ~ ~2.50 -4.08 0 -2.93 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~0.00 ~ ~0.00 0.00 0 0.00 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~-0.50 ~ ~-0.87 0.41 0 0.92 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~1.00 ~ ~-1.73 -1.17 0 1.63 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~3.00 ~ ~-0.00 -3.00 0 -0.30 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~2.00 ~ ~3.46 -1.65 0 -3.66 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~-2.50 ~ ~4.33 2.93 0 -4.08 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~0.00 ~ ~0.00 0.00 0 0.00 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~0.87 ~ ~-0.50 -0.92 0 0.41 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~1.73 ~ ~1.00 -1.63 0 -1.17 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~0.00 ~ ~3.00 0.30 0 -3.00 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~-3.46 ~ ~2.00 3.66 0 -1.65 0.03 0 force
execute rotated ~45 ~ run particle minecraft:dragon_breath ~-4.33 ~ ~-2.50 4.08 0 2.93 0.03 0 force
particle minecraft:dragon_breath ~0.00 ~ ~0.00 0.00 0 0.00 0.03 0 force
particle minecraft:dragon_breath ~0.50 ~ ~0.87 -0.41 0 -0.92 0.03 0 force
particle minecraft:dragon_breath ~-1.00 ~ ~1.73 1.17 0 -1.63 0.03 0 force
particle minecraft:dragon_breath ~-3.00 ~ ~0.00 3.00 0 0.30 0.03 0 force
particle minecraft:dragon_breath ~-2.00 ~ ~-3.46 1.65 0 3.66 0.03 0 force
particle minecraft:dragon_breath ~2.50 ~ ~-4.33 -2.93 0 4.08 0.03 0 force
particle minecraft:dragon_breath ~0.00 ~ ~0.00 0.00 0 0.00 0.03 0 force
particle minecraft:dragon_breath ~-0.87 ~ ~0.50 0.92 0 -0.41 0.03 0 force
particle minecraft:dragon_breath ~-1.73 ~ ~-1.00 1.63 0 1.17 0.03 0 force
particle minecraft:dragon_breath ~-0.00 ~ ~-3.00 -0.30 0 3.00 0.03 0 force
particle minecraft:dragon_breath ~3.46 ~ ~-2.00 -3.66 0 1.65 0.03 0 force
particle minecraft:dragon_breath ~4.33 ~ ~2.50 -4.08 0 -2.93 0.03 0 force
particle minecraft:dragon_breath ~0.00 ~ ~0.00 0.00 0 0.00 0.03 0 force
particle minecraft:dragon_breath ~-0.50 ~ ~-0.87 0.41 0 0.92 0.03 0 force
particle minecraft:dragon_breath ~1.00 ~ ~-1.73 -1.17 0 1.63 0.03 0 force
particle minecraft:dragon_breath ~3.00 ~ ~-0.00 -3.00 0 -0.30 0.03 0 force
particle minecraft:dragon_breath ~2.00 ~ ~3.46 -1.65 0 -3.66 0.03 0 force
particle minecraft:dragon_breath ~-2.50 ~ ~4.33 2.93 0 -4.08 0.03 0 force
particle minecraft:dragon_breath ~0.00 ~ ~0.00 0.00 0 0.00 0.03 0 force
particle minecraft:dragon_breath ~0.87 ~ ~-0.50 -0.92 0 0.41 0.03 0 force
particle minecraft:dragon_breath ~1.73 ~ ~1.00 -1.63 0 -1.17 0.03 0 force
particle minecraft:dragon_breath ~0.00 ~ ~3.00 0.30 0 -3.00 0.03 0 force
particle minecraft:dragon_breath ~-3.46 ~ ~2.00 3.66 0 -1.65 0.03 0 force
particle minecraft:dragon_breath ~-4.33 ~ ~-2.50 4.08 0 2.93 0.03 0 force