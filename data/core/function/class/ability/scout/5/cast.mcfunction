execute unless score @s class matches 4 run return fail
execute unless score @s range.slc matches 1..2 run return fail
execute unless items entity @s weapon.mainhand #range run return fail
data modify storage core:scout decoy.owner set from entity @s UUID
execute store result score @s scout.tmp run function core:class/ability/scout/5/find with storage core:scout decoy
execute if score @s scout.tmp matches 1 run return fail
execute if score @s range.slc.cd matches 1.. run return fail
execute unless data entity @s SelectedItem.components."minecraft:custom_data".range run return fail
function core:class/ability/scout/snapshot
data modify storage core:scout decoy set from storage core:scout shot
execute store result storage core:scout decoy.level int 1 run scoreboard players get @s range.slc
execute store result storage core:scout decoy.cooldown int 1 run function core:custom_ench/aptitude/cal {time:200}
execute anchored eyes positioned ^ ^ ^0.6 summon villager run function core:class/ability/scout/5/summon
playsound entity.snowball.throw player @s ~ ~ ~ 0.8 0.7
