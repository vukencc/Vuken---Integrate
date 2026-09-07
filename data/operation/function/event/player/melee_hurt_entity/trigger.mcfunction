execute if entity @s[tag=EnchFUOVTriggered] if score @s time_not_killing_entities matches 2.. run function core:custom_ench/forge/fuov/clear
function core:custom_ench/forge/pursue/apply
function core:custom_ench/forge/resolution/apply
execute if score @s melee.sswap matches 1.. if score @s class matches 1 run function core:class/ability/warrior/7/get_rage
execute if score @s warrior.contract matches ..0 run damage @s 2 out_of_world
scoreboard players set @s time_not_melee_attacking 0