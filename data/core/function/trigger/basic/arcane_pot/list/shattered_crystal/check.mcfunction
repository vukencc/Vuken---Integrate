scoreboard players set $shattered_crystal_affected_count stdTemp1 0
execute store result score $shattered_crystal_affected_count stdTemp1 if entity @e[type=!#bypass,tag=tmp]
$execute if score $shattered_crystal_affected_count stdTemp1 matches 1 run effect give @p[scores={marker=$(id)}] regeneration 5 0 true
$execute if score $shattered_crystal_affected_count stdTemp1 matches 2 run effect give @p[scores={marker=$(id)}] regeneration 10 0 true
$execute if score $shattered_crystal_affected_count stdTemp1 matches 3.. run effect give @p[scores={marker=$(id)}] regeneration 15 0 true
particle cherry_leaves ~ ~0.3 ~ 0.9 0.3 0.9 0.05 45 normal