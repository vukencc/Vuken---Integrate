execute unless score @s class matches 5 run return fail
execute unless score @s melee.drop matches 1..2 run return fail
execute if score @s melee.drop.cd matches 1.. run return fail
execute unless items entity @s weapon.mainhand #melee_weapon run return fail
execute store result score @s melee.drop.cd run function core:custom_ench/aptitude/cal {time:160}
data modify storage core:assassin_5 owner set from entity @s UUID
execute store result storage core:assassin_5 level int 1 run scoreboard players get @s melee.drop
data modify storage core:assassin_5 weapon set from entity @s SelectedItem
execute anchored eyes positioned ^ ^ ^0.5 run summon item ~ ~ ~ {PickupDelay:32767,Tags:["kill_this_with","assassin.5.projectile","assassin.5.new_item"],Item:{id:"netherite_sword",count:1}}
execute anchored eyes positioned ^ ^ ^0.5 as @n[type=item,tag=assassin.5.new_item,distance=..1] anchored feet run function core:class/ability/assassin/5/set
playsound item.trident.throw player @a[distance=..24] ~ ~ ~ 0.8 1.3
particle end_rod ^ ^1.4 ^0.7 0.15 0.15 0.15 0.08 14 normal
function core:class/ability/assassin/7/get
