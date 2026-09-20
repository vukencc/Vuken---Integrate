execute if score @s melee.rc matches 0 run return fail
execute if score @s melee.rc.cd matches 1.. run return fail
execute unless score @s class matches 5 run return fail

execute store result score @s melee.rc.cd run function core:custom_ench/aptitude/cal {time:200}

execute if score @s melee.rc matches 1 run function operation:displacement/forward_before_entity/init {distance:8}
execute if score @s melee.rc matches 2 run function operation:displacement/forward_before_entity/init {distance:12}

execute at @s run playsound minecraft:entity.enderman.teleport hostile @s ~ ~ ~ 0.9 1.0
execute at @s run playsound minecraft:item.chorus_fruit.teleport hostile @s ~ ~ ~ 0.75 1.1
execute at @s run playsound minecraft:block.amethyst_block.chime hostile @s ~ ~ ~ 0.3 1.5
execute at @s run playsound minecraft:entity.player.attack.crit hostile @s ~ ~ ~ 0.3 1.3

execute if score @s melee.rc matches 1 run function vfam:add {target:"@s",effect:attack_damage,id:assassin_1,value:0.6,duration:60,type:add_multiplied_total}
execute if score @s melee.rc matches 2 run function vfam:add {target:"@s",effect:attack_damage,id:assassin_1,value:1,duration:60,type:add_multiplied_total}

execute at @s run particle dust_color_transition{from_color:5570815,to_color:14483551,scale:1.2} ~ ~1 ~ 0.35 0.8 0.35 0.08 32 normal
execute at @s run particle reverse_portal ~ ~1 ~ 0.4 0.8 0.4 0.12 24 normal

# custom:play_time advances once per tick; a negative start keeps the kill window open for 60 ticks.
scoreboard players set @s assassin.rc.duration -60
function core:class/ability/assassin/7/get
