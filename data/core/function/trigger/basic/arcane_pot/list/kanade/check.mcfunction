scoreboard players set $kanade_affected_count stdTemp1 0
execute store result score $kanade_affected_count stdTemp1 if entity @e[type=!#bypass,tag=tmp]
$execute if score $kanade_affected_count stdTemp1 matches 1 as @p[scores={marker=$(id)}] run function vfam:addp {args:[movement_efficiency,0.05,100,"+++",kanade_vial_count]}
$execute if score $kanade_affected_count stdTemp1 matches 2 as @p[scores={marker=$(id)}] run function vfam:addp {args:[movement_efficiency,0.1,100,"+++",kanade_vial_count]}
$execute if score $kanade_affected_count stdTemp1 matches 3 as @p[scores={marker=$(id)}] run function vfam:addp {args:[movement_efficiency,0.15,100,"+++",kanade_vial_count]}
$execute if score $kanade_affected_count stdTemp1 matches 4 as @p[scores={marker=$(id)}] run function vfam:addp {args:[movement_efficiency,0.2,100,"+++",kanade_vial_count]}
$execute if score $kanade_affected_count stdTemp1 matches 5.. as @p[scores={marker=$(id)}] run function vfam:addp {args:[movement_efficiency,0.25,100,"+++",kanade_vial_count]}

execute positioned ~ ~1 ~ facing entity @p eyes run function core:trigger/basic/arcane_pot/list/kanade/particle