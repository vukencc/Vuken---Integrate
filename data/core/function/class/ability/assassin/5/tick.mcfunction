data modify storage core:assassin_5 hit set value 0b
execute unless entity @s[tag=assassin.5.marked] if entity @s[tag=assassin.5.1] run data modify storage core:assassin_5 hit_owner set from entity @s data.assassin_5_uuid
execute unless entity @s[tag=assassin.5.marked] if entity @s[tag=assassin.5.2] run data modify storage core:assassin_5 hit_owner set from entity @s data.assassin_5_uuid
execute unless entity @s[tag=assassin.5.marked] if entity @s[tag=assassin.5.1] positioned ~-0.5 ~-0.5 ~-0.5 as @n[type=!#bypass,type=!minecraft:item,type=!minecraft:armor_stand,type=!minecraft:player,dx=0.1,dy=0.1,dz=0.1,limit=1,sort=nearest] positioned ~0.5 ~0.5 ~0.5 run function core:class/ability/assassin/5/mark_1
execute unless entity @s[tag=assassin.5.marked] if entity @s[tag=assassin.5.2] positioned ~-0.5 ~-0.5 ~-0.5 as @n[type=!#bypass,type=!minecraft:item,type=!minecraft:armor_stand,type=!minecraft:player,dx=0.1,dy=0.1,dz=0.1,limit=1,sort=nearest] positioned ~0.5 ~0.5 ~0.5 run function core:class/ability/assassin/5/mark_2

execute if data storage core:assassin_5 {hit:1b} run tag @s add assassin.5.marked
execute if entity @s[tag=assassin.5.marked] run function operation:stats/kill_this

execute unless entity @s[tag=assassin.5.marked] run function core:class/ability/assassin/5/fx/trail
