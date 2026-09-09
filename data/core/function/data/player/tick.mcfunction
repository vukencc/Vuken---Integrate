### This function ticks with:
### Player Facing
### Player Position
### Executed as Player
function core:custom_ench/forge/sidestep/tick
function core:custom_ench/forge/spacing/tick
function core:custom_ench/forge/unreal/tick
function core:custom_ench/forge/parry/tick

execute if entity @s[tag=WarriorDash] if predicate core:player/y_static if entity @s[nbt={OnGround:1b}] run function core:class/ability/warrior/1/land
execute if score @s warrior.pas1 matches 0 if entity @s[tag=warrior_6_1] run function core:class/ability/warrior/6/tick
execute if score @s warrior.pas1 matches 0 if entity @s[tag=warrior_6_2] run function core:class/ability/warrior/6/tick
execute if score @s warrior.pas1 matches 1 unless entity @s[tag=warrior_6_1] run function core:class/ability/warrior/6/tick
execute if score @s warrior.pas1 matches 2 unless entity @s[tag=warrior_6_2] run function core:class/ability/warrior/6/tick
execute if entity @s[tag=warrior_rage_apply] if score @s time_not_melee_attacking matches 100.. run function core:class/ability/warrior/7/tick
execute if entity @s[tag=warrior_rage_apply] if score @s melee.sswap matches 0 run function core:class/ability/warrior/7/tick
execute if entity @s[tag=warrior_rage_apply] unless score @s class matches 1 run function core:class/ability/warrior/7/tick
execute if score @s warrior.pas2 matches 1.. if items entity @s weapon.mainhand #melee_weapon unless items entity @s weapon.mainhand *[custom_data~{warrior_8:true}] run function core:class/ability/warrior/8/add
execute if score @s warrior.pas2 matches 0 if items entity @s weapon.mainhand #melee_weapon if items entity @s weapon.mainhand *[custom_data~{warrior_8:true}] run function core:class/ability/warrior/8/remove

execute if score @s wand.lc matches 1 if score @s wand.lc.cd matches ..0 unless entity @s[tag=mage.1.applied.1] run function core:class/ability/mage/1/add_1
execute if score @s wand.lc matches 2 if score @s wand.lc.cd matches ..0 unless entity @s[tag=mage.1.applied.2] run function core:class/ability/mage/1/add_2
execute if score @s wand.lc matches 0 if score @s wand.lc.cd matches ..0 unless entity @s[tag=mage.1.applied.0] run function core:class/ability/mage/1/clear

execute if score @s mage.7.time matches 160.. if score @s mage.7.queue.1 matches 1.. run function core:class/ability/mage/7/clear