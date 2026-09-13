# Called as the actual arrow; resolve the owner instead of the nearest player.
data modify storage core:scout shot set value {level:0}
execute on origin if entity @s[type=player,scores={class=4,scout.pas1=1..2}] if predicate operation:stats/sneaking unless score @s scout.pas1.cd matches 1.. run function core:class/ability/scout/2/prepare
execute unless data storage core:scout shot{level:1} unless data storage core:scout shot{level:2} run return fail
data modify entity @s data.scout set from storage core:scout shot
tag @s add scout.explosive
scoreboard players set @s scout.life 200
