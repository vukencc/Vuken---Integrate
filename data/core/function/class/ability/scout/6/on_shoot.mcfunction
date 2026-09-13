data modify storage core:scout chain_shot set value {level:0}
execute on origin if entity @s[type=player,scores={class=4,scout.pas2=1..2}] run function core:class/ability/scout/6/prepare
execute unless data storage core:scout chain_shot{level:1} unless data storage core:scout chain_shot{level:2} run return fail
data modify entity @s data.scout_chain set from storage core:scout chain_shot
