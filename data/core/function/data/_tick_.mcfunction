#data modify storage temp_uuid UUID set from entity @s UUID
execute store result storage temp_id id int 1 run scoreboard players get @s marker
execute at @s run function core:data/void/_tick_ with storage temp_id
#-------mana--------#
scoreboard players add @s[scores={player.ManaBar=..3999}] player.ManaBar 10
execute if score @s player.ManaBar matches 4001.. run scoreboard players set @s player.ManaBar 4000
#-------music--------#
scoreboard players remove @s[scores={music_timing=1..}] music_timing 1
execute if entity @s[tag=music_on] if score @s in_boss matches 1.. if score @s music_timing matches 0 run function core:music/boss_reset
execute if entity @s[tag=music_on] if score @s in_boss matches 0 if score @s music_timing matches 0 run function core:music/area_reset
#-------spectator_above--------#
execute if entity @s[gamemode=spectator] run return fail
#-------pickup--------#
execute if entity @s[tag=pickup_on] run function operation:container/pickup/tick
#-------scb--------#
    execute store result score @s player.HurtTime run data get entity @s HurtTime
    execute if score @s player.HurtTime matches 10 if predicate {condition:entity_properties,entity:"this",predicate:{effects:{poison:{}}}} run function operation:stats/mc_poison/init
    execute if score @s player.HurtTime matches 10 run function core:defence/shared_take_damage
    execute if score @s stats.poison_immune.T matches 1.. run scoreboard players remove @s stats.poison_immune.T 1
    execute if score @s pot.holding.delay matches -4 at @s run function core:trigger/basic/arcane_pot/cast
    execute if score @s env_damage_timing matches 1 at @s run function core:defence/env_cal_trigger
    execute if score @s env_damage_timing matches 1.. run scoreboard players remove @s env_damage_timing 1
    execute if score @s inter_custom_cd matches 1.. run scoreboard players remove @s inter_custom_cd 1
    execute if score @s data_delay matches 1 at @s run function core:data/defence_count
    execute if score @s data_delay matches 1.. run scoreboard players remove @s data_delay 1
    scoreboard players add @s repeat_25_timing 1
    execute if score @s repeat_25_timing matches 26.. run scoreboard players set @s repeat_25_timing 1
    scoreboard players add @s repeat_600_timing 1
    execute if score @s repeat_600_timing matches 601.. run scoreboard players set @s repeat_600_timing 1
    execute if score @s com_kill_timing matches 1.. run scoreboard players remove @s com_kill_timing 1
    execute if score @s death_escape_timing matches 1.. run scoreboard players remove @s death_escape_timing 1
    execute if score @s death_escape_timing matches 1 run title @s actionbar {translate:lore.enchantment.function.death_escape,color:gold,bold:true,underlined:true}
    execute if score @s ench_combo_timing matches 1.. run scoreboard players remove @s ench_combo_timing 1
    execute if score @s ench_combo_timing matches 1 run title @s actionbar {translate:lore.enchantment.function.combo,color:red,bold:true,underlined:true}
    scoreboard players add @s repeat_10_timing 1
    execute if score @s repeat_10_timing matches 11 run scoreboard players set @s repeat_10_timing 1
    execute if score @s repeat_110_timing > @s regeneration_p1 at @s run scoreboard players set @s repeat_110_timing 0
    scoreboard players add @s repeat_110_timing 1
    execute as @s[tag=reg_trans_access] at @s if score @s repeat_110_timing matches 10 run function core:custom_ench/assistance/regeneration
    execute if score @s spawner_break matches 1.. at @s run function core:custom_ench/assistance/spawner_break
    execute if score @s invert_delay matches 1.. run scoreboard players remove @s invert_delay 1
    scoreboard players remove @s[scores={player.HurtTime.vir=1..}] player.HurtTime.vir 1
    scoreboard players add @s time_not_killing_entities 1
    scoreboard players add @s time_not_taking_damage 1
    function core:data/manabar
    scoreboard players remove @s[scores={charging_bow=1..}] charging_bow 1
    scoreboard players remove @s[scores={operation.motion.delay=1..}] operation.motion.delay 1
    function core:data/ability_off_cd
#--------trigger--------#
    execute if score @s drop_trigger matches 1.. if score @s weapon.holding.delay matches ..0 if predicate operation:stats/sneaking unless items entity @s weapon.mainhand * at @s run function operation:trigger/sdrop
    execute if score @s drop_trigger matches 1.. if score @s weapon.holding.delay matches ..0 unless predicate operation:stats/sneaking unless items entity @s weapon.mainhand * at @s run function operation:trigger/drop
    scoreboard players set @s drop_trigger 0
    execute if items entity @s weapon.mainhand *[enchantments~[{enchantments:"#weapon_id"}]] run function core:data/trigger_tick
    scoreboard players set @s pot.rc 0
    execute if score $s_vir repeat_20_timing matches 10 run function core:data/player/second
    function core:data/player/tick
    execute if score @s bow_use matches 1.. run function operation:event/player/shoot/player
    execute if score @s bow_use_2 matches 1.. run function operation:event/player/shoot/player
    scoreboard players set @s bow_use 0
    scoreboard players set @s bow_use_2 0
#--------trigger_spe--------#
    execute if score @s PotionCharger.cd matches 1.. run scoreboard players remove @s PotionCharger.cd 1
    execute if score @s PotionCharger.cd matches 0 if items entity @s hotbar.* *[item_model="tool/interact/potion_charger_empty"] at @s run function core:trigger/active/potion_charger/refresh
    execute if score @s ChestModel.cd matches 1.. run scoreboard players remove @s ChestModel.cd 1
    execute if score @s ChestModel.cd matches 0 if items entity @s hotbar.* *[item_model="minecraft:black_bundle",custom_data~{ChestModel:1b}] at @s run function core:trigger/active/chest_model/refresh
#--------inter_chat--------#
    scoreboard players enable @s menu.trigger
    scoreboard players enable @s class_menu.trigger
    execute if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_sneaking:true}}} at @s run function core:trigger/stats/is_sneaking
    execute if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_sneaking:false}}} at @s run function core:trigger/stats/not_sneaking
    execute if score @s menu.trigger matches 1.. at @s run function core:inter_chat/_tick_
    execute if score @s class_menu.trigger matches 0.. at @s run function core:class/sys/tick
#--------gmd--------#
    execute if score @s gamemode.scb matches 1.. run scoreboard players remove @s gamemode.scb 1
    execute as @s[gamemode=survival] if score @s gamemode.scb matches 3.. run gamemode adventure @s
    execute as @s[gamemode=adventure] if score @s gamemode.scb matches ..2 run gamemode survival @s
#------------------data_storage------------------#
execute if items entity @s weapon.mainhand crossbow if score @s repeat_10_timing matches 5 run function core:custom_ench/range/multicharge/charges_refresh
#infinity
function core:trigger/basic/infinity_torch/tick
function core:trigger/basic/infinity_blue_glass/tick