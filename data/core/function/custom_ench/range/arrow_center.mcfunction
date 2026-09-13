tag @a remove range.shooter
execute on origin if entity @s[type=player] run tag @s add range.shooter
execute unless entity @a[tag=range.shooter] run return fail

data merge entity @s {item:{id:potion,count:1,components:{potion_contents:{custom_effects:[{id:"saturation",amplifier:0,duration:999999,show_particles:0b,ambient:0b,show_icon:0b},{id:"night_vision",amplifier:0,duration:999999,show_particles:0b,ambient:0b,show_icon:0b},{id:"hunger",amplifier:0,duration:999999,show_particles:0b,ambient:0b,show_icon:0b},{id:"water_breathing",amplifier:0,duration:999999,show_particles:0b,ambient:0b,show_icon:0b}]}}},pickup:0b,data:{starlit_damage:0.0,UUID:[I;0,0,0,0],damage:0},damage:0}

#arrow execute inter:
execute store result score @s range_starlit run data get entity @p[tag=range.shooter] SelectedItem.components."minecraft:enchantments"."core:range/starlit" 3
execute if score @s range_starlit matches 1.. run tag @s add starlit_as
execute store result score @s stdTemp1 as @p[tag=range.shooter] run function core:damage/range/calculation
scoreboard players operation @s range_starlit *= @s stdTemp1
execute store result entity @s data.starlit_damage double 0.0001 run scoreboard players get @s range_starlit
data modify entity @s data.UUID set from entity @p[tag=range.shooter] UUID
#arrow execute inter END

#saturation.greed hunger.freeze night_vision.ring hero.sniper&blank null.starlit
execute store result score @p[tag=range.shooter] range_greed run data get entity @p[tag=range.shooter] SelectedItem.components."minecraft:enchantments"."core:range/greed"
execute store result score @p[tag=range.shooter] range_freeze run data get entity @p[tag=range.shooter] SelectedItem.components."minecraft:enchantments"."core:range/freeze"
execute store result score @p[tag=range.shooter] range_ring run data get entity @p[tag=range.shooter] SelectedItem.components."minecraft:enchantments"."core:range/ring"
execute store result score @p[tag=range.shooter] range_sniper_blank run data get entity @p[tag=range.shooter] SelectedItem.components."minecraft:enchantments"."core:range/sniper"
execute if score @p[tag=range.shooter] range_sniper_blank matches 0 store result score @p[tag=range.shooter] range_sniper_blank run data get entity @p[tag=range.shooter] SelectedItem.components."minecraft:enchantments"."core:range/point_blank"
execute if score @p[tag=range.shooter] range_greed matches 1.. run tag @s add greed_arrow
execute if score @p[tag=range.shooter] range_freeze matches 1.. run tag @s add freeze_arrow
execute if score @p[tag=range.shooter] range_ring matches 1.. run tag @s add ring_arrow
execute store result entity @s item.components."minecraft:potion_contents".custom_effects[0].amplifier byte 2 run scoreboard players get @p[tag=range.shooter] range_greed
execute store result entity @s item.components."minecraft:potion_contents".custom_effects[1].amplifier byte 1 run scoreboard players get @p[tag=range.shooter] range_ring
execute store result entity @s item.components."minecraft:potion_contents".custom_effects[2].amplifier byte 1 run scoreboard players get @p[tag=range.shooter] range_freeze
execute store result entity @s item.components."minecraft:potion_contents".custom_effects[3].amplifier byte 1 run scoreboard players get @p[tag=range.shooter] range_sniper_blank
execute if items entity @p[tag=range.shooter] weapon.mainhand *[enchantments~[{enchantments:"core:range/sniper"}]] run scoreboard players set @p[tag=range.shooter] sniper_or_pb 1
execute if items entity @p[tag=range.shooter] weapon.mainhand *[enchantments~[{enchantments:"core:range/point_blank"}]] run scoreboard players set @p[tag=range.shooter] sniper_or_pb 2
#---------------------transform_effect_end----------------#

#--------------modified_arrow_damage----------------------#
execute store result entity @s data.damage double 0.0001 as @p[tag=range.shooter] run function core:damage/range/base

function operation:event/player/shoot/arrow with entity @s data
tag @a remove range.shooter
