function operation:event/player/refresh/effects

scoreboard players set @s invert_delay 2


scoreboard players set @s player.Weakness 0
scoreboard players set @s player.Strength 0
scoreboard players set @s player.Resistance 0
scoreboard players set @s player.Vulnerable 0
attribute @s attack_damage modifier remove strength.melee
attribute @s attack_damage modifier remove weakness.melee
attribute @s attack_damage modifier remove minecraft:effect.strength
attribute @s luck modifier remove minecraft:effect.luck
attribute @s luck modifier remove minecraft:effect.unluck
attribute @s attack_damage modifier remove minecraft:effect.weakness
execute if predicate {condition:"entity_properties",entity:"this",predicate:{effects:{strength:{}}}} run function core:custom_ench/assistance/strength_delay
execute if predicate {condition:"entity_properties",entity:"this",predicate:{effects:{weakness:{}}}} run function core:custom_ench/assistance/weakness_delay
execute if predicate {condition:"entity_properties",entity:"this",predicate:{effects:{luck:{}}}} run function core:custom_ench/assistance/res_delay
execute if predicate {condition:"entity_properties",entity:"this",predicate:{effects:{unluck:{}}}} run function core:custom_ench/assistance/vln_delay

execute store result score @s stdTemp1 run data get entity @s equipment.head.components."minecraft:enchantments"."core:forge/pf/invert"
execute store result score @s stdTemp2 run data get entity @s equipment.chest.components."minecraft:enchantments"."core:forge/pf/invert"
execute store result score @s stdTemp3 run data get entity @s equipment.legs.components."minecraft:enchantments"."core:forge/pf/invert"
execute store result score @s stdTemp4 run data get entity @s equipment.feet.components."minecraft:enchantments"."core:forge/pf/invert"
execute store result score @s stdTemp5 run data get entity @s equipment.offhand.components."minecraft:enchantments"."core:forge/pf/invert"
scoreboard players operation @s stdTemp1 += @s stdTemp2
scoreboard players operation @s stdTemp1 += @s stdTemp3
scoreboard players operation @s stdTemp1 += @s stdTemp4
scoreboard players operation @s stdTemp1 += @s stdTemp5
execute if score @s ench.invert.cd matches ..0 run scoreboard players set @s stdTemp1 0
execute if score @s stdTemp1 matches 1.. at @s run function core:custom_ench/assistance/effects_delay
execute if predicate {condition:"entity_properties",entity:"this",predicate:{effects:{wither:{}}}} run function operation:stats/poison/init
advancement revoke @s only core:effects_changed