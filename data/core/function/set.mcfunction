tellraw @a {text:"\nA new version of DATAPACK has been installed!\n",color:"#a56cff",bold:true,underlined:true}
tellraw @a {text:"Current Version: 1.0.12 for 26.1\n",color:"#aedeff",bold:true,underlined:true}
tellraw @a {text:"In the latest version, the following new functions have been installed:\n*Block Passive Forge Enchantment",color:"#aedeff"}
### SCB
scoreboard objectives add damageResisted dummy
scoreboard objectives add natDamageResisted minecraft.custom:minecraft.damage_resisted
scoreboard objectives add std1000 dummy
scoreboard objectives add std100 dummy
scoreboard objectives add std10 dummy
scoreboard objectives add std750 dummy
scoreboard players set $s_vir std10 10
scoreboard objectives add env_damage_timing dummy
scoreboard objectives add health health
scoreboard objectives add inter_custom_cd dummy
scoreboard objectives add data_delay dummy
scoreboard objectives add chat.armor.enhance dummy
#prime
scoreboard objectives add protection_level dummy
scoreboard objectives add vanilla_armor dummy
scoreboard objectives add vanilla_toughness dummy
#special enchant
scoreboard objectives add melee_protection dummy
scoreboard objectives add magic_protection dummy
scoreboard objectives add env_protection dummy
scoreboard objectives add evasion dummy
scoreboard objectives add melee_evasion dummy
scoreboard objectives add magic_evasion dummy
#repeat
scoreboard objectives add repeat_25_timing dummy
scoreboard objectives add repeat_10_timing dummy
scoreboard objectives add std1 dummy
#enchant
scoreboard objectives add std20 dummy
scoreboard objectives add armor_extension dummy

scoreboard objectives add com_kill_timing dummy
scoreboard objectives add std2 dummy
scoreboard objectives add death_escape_timing dummy
#melee enchant
#bleed combo crit current curse first_strike focus ice_aspect quake slayer thunder_aspect water_aspect
scoreboard objectives add melee_bleed dummy
scoreboard objectives add melee_combo dummy
scoreboard objectives add melee_crit dummy
scoreboard objectives add melee_current dummy
scoreboard objectives add melee_curse dummy
scoreboard objectives add melee_first_strike dummy
scoreboard objectives add melee_focus dummy
scoreboard objectives add melee_ice_aspect dummy
scoreboard objectives add melee_quake dummy
scoreboard objectives add melee_slayer dummy
scoreboard objectives add melee_thunder_aspect dummy
scoreboard objectives add melee_water_aspect dummy
scoreboard objectives add enemy_max_hp dummy
scoreboard objectives add enemy_current_hp dummy
scoreboard objectives add ench_combo_timing dummy
#range enchant
scoreboard objectives add range_power dummy
scoreboard objectives add range_freeze dummy
scoreboard objectives add range_greed dummy
scoreboard objectives add range_ring dummy
scoreboard objectives add range_starlit dummy
scoreboard objectives add multicharge.temp1 dummy
scoreboard objectives add multicharge.temp2 dummy
scoreboard objectives add multicharge.temp3 dummy
scoreboard objectives add multicharge.temp4 dummy
scoreboard objectives add multicharge.temp5 dummy
#std
scoreboard objectives add entity_x dummy
scoreboard objectives add entity_y dummy
scoreboard objectives add entity_z dummy
scoreboard objectives add entity_x_det dummy
scoreboard objectives add entity_y_det dummy
scoreboard objectives add entity_z_det dummy
scoreboard objectives add bow_use minecraft.used:bow
scoreboard objectives add bow_use_2 minecraft.used:crossbow
scoreboard objectives add arrow_apply_freeze dummy
scoreboard objectives add arrow_apply_ring dummy
scoreboard objectives add arrow_apply_greed dummy
scoreboard objectives add arrow_apply_starlit dummy
scoreboard objectives add range_multicharge dummy
#frenzy energy hasten

#regeneration
scoreboard objectives add regeneration_p1 dummy

scoreboard objectives add repeat_110_timing dummy
scoreboard objectives add repeat_600_timing dummy
scoreboard objectives add repeat_20_timing dummy
scoreboard objectives add spawner_break minecraft.mined:spawner
scoreboard objectives add invert_delay dummy
scoreboard objectives add enemy_skill dummy
scoreboard objectives add std_neg dummy
scoreboard objectives add sniper_or_pb dummy
#team color
team add blue
team modify blue color blue
team add gold
team modify gold color gold
#green
team add green
team modify green color green
team add purple
team modify purple color dark_purple
team add red
team modify red color red
team add aqua
team modify aqua color aqua
team add yellow
team modify yellow color yellow
#follow scoreboard should be operated when any player first enter the game
scoreboard objectives add marker dummy
scoreboard objectives add marker_2 dummy
scoreboard objectives add gamemode.scb dummy
scoreboard objectives add player.HurtTime dummy
scoreboard objectives add player.HurtTime.vir dummy
scoreboard objectives add player.BypassHurtTime dummy
scoreboard objectives add player.ManaBar dummy
scoreboard objectives add enemy.Taken.Melee dummy
scoreboard objectives add enemy.Taken.Range dummy
scoreboard objectives add enemy.Taken.Magic dummy
scoreboard objectives add player.Strength dummy
scoreboard objectives add player.Weakness dummy
scoreboard objectives add stdTemp1 dummy
scoreboard objectives add stdTemp2 dummy
scoreboard objectives add stdTemp3 dummy
scoreboard objectives add stdTemp4 dummy
scoreboard objectives add stdTemp5 dummy
scoreboard objectives add stdTemp6 dummy
scoreboard objectives add stdTemp7 dummy
scoreboard objectives add stdTemp8 dummy

scoreboard objectives add bacTemp1 dummy
scoreboard objectives add bacTemp2 dummy
scoreboard objectives add bacTemp3 dummy
scoreboard objectives add bacTemp4 dummy
scoreboard objectives add bacTemp5 dummy
scoreboard objectives add bacTemp6 dummy

scoreboard objectives add range_sniper_blank dummy
scoreboard objectives add arrow_apply_sniper_blank dummy

scoreboard objectives add PotionCharger.cd dummy

scoreboard objectives add cursor.count.A dummy
scoreboard objectives add cursor.count.B dummy

scoreboard objectives add ChestModel.cd dummy
scoreboard objectives add menu.trigger trigger

scoreboard objectives add ench.invert.cd custom:play_time


scoreboard objectives add player.Resistance dummy
scoreboard objectives add player.Vulnerable dummy

scoreboard objectives add time_not_taking_damage dummy
scoreboard objectives add time_not_killing_entities dummy
scoreboard objectives add time_not_attacking dummy

scoreboard objectives add drop_trigger minecraft.custom:drop

function core:dungeon/__init__

scoreboard objectives add music_timing dummy
scoreboard objectives add in_area dummy
scoreboard objectives add in_boss dummy
scoreboard objectives add class dummy
scoreboard objectives add class_menu.trigger trigger
scoreboard objectives add max_class_points dummy
scoreboard objectives add left_class_points dummy

# rc src lc slc swap sswap drop sdrop
# melee magic_book range pot wand scythe
scoreboard objectives add pot.rc used:carrot_on_a_stick
scoreboard objectives add melee.rc dummy
scoreboard objectives add magic_book.rc dummy
scoreboard objectives add wand.rc dummy
scoreboard objectives add scythe.rc dummy

scoreboard objectives add magic_book.lc dummy
scoreboard objectives add range.lc dummy
scoreboard objectives add pot.lc dummy
scoreboard objectives add wand.lc dummy

scoreboard objectives add melee.slc dummy
scoreboard objectives add magic_book.slc dummy
scoreboard objectives add range.slc dummy
scoreboard objectives add pot.slc dummy
scoreboard objectives add wand.slc dummy
scoreboard objectives add scythe.slc dummy

scoreboard objectives add melee.swap dummy
scoreboard objectives add magic_book.swap dummy
scoreboard objectives add range.swap dummy
scoreboard objectives add pot.swap dummy
scoreboard objectives add wand.swap dummy
scoreboard objectives add scythe.swap dummy

scoreboard objectives add melee.sswap dummy
scoreboard objectives add magic_book.sswap dummy
scoreboard objectives add range.sswap dummy
scoreboard objectives add pot.sswap dummy
scoreboard objectives add wand.sswap dummy
scoreboard objectives add scythe.sswap dummy

scoreboard objectives add melee.drop dummy
scoreboard objectives add magic_book.drop dummy
scoreboard objectives add range.drop dummy
scoreboard objectives add pot.drop dummy
scoreboard objectives add wand.drop dummy
scoreboard objectives add scythe.drop dummy

scoreboard objectives add melee.sdrop dummy
scoreboard objectives add magic_book.sdrop dummy
scoreboard objectives add range.sdrop dummy
scoreboard objectives add pot.sdrop dummy
scoreboard objectives add wand.sdrop dummy
scoreboard objectives add scythe.sdrop dummy

scoreboard objectives add melee.src dummy
scoreboard objectives add magic_book.src dummy
scoreboard objectives add range.src dummy
scoreboard objectives add pot.src dummy
scoreboard objectives add wand.src dummy
scoreboard objectives add scythe.src dummy

scoreboard objectives add melee.rc.cd dummy
scoreboard objectives add magic_book.rc.cd dummy
scoreboard objectives add wand.rc.cd dummy
scoreboard objectives add scythe.rc.cd dummy

#LC: (limited) 
scoreboard objectives add magic_book.lc.cd dummy
scoreboard objectives add range.lc.cd dummy
scoreboard objectives add pot.lc.cd dummy
scoreboard objectives add wand.lc.cd dummy

#SLC: (limited) 
scoreboard objectives add melee.slc.cd dummy
scoreboard objectives add magic_book.slc.cd dummy
scoreboard objectives add range.slc.cd dummy
scoreboard objectives add pot.slc.cd dummy
scoreboard objectives add wand.slc.cd dummy
scoreboard objectives add scythe.slc.cd dummy

scoreboard objectives add melee.swap.cd dummy
scoreboard objectives add magic_book.swap.cd dummy
scoreboard objectives add range.swap.cd dummy
scoreboard objectives add pot.swap.cd dummy
scoreboard objectives add wand.swap.cd dummy
scoreboard objectives add scythe.swap.cd dummy

scoreboard objectives add melee.sswap.cd dummy
scoreboard objectives add magic_book.sswap.cd dummy
scoreboard objectives add range.sswap.cd dummy
scoreboard objectives add pot.sswap.cd dummy
scoreboard objectives add wand.sswap.cd dummy
scoreboard objectives add scythe.sswap.cd dummy

scoreboard objectives add melee.drop.cd dummy
scoreboard objectives add magic_book.drop.cd dummy
scoreboard objectives add range.drop.cd dummy
scoreboard objectives add pot.drop.cd dummy
scoreboard objectives add wand.drop.cd dummy
scoreboard objectives add scythe.drop.cd dummy

scoreboard objectives add melee.sdrop.cd dummy
scoreboard objectives add magic_book.sdrop.cd dummy
scoreboard objectives add range.sdrop.cd dummy
scoreboard objectives add pot.sdrop.cd dummy
scoreboard objectives add wand.sdrop.cd dummy
scoreboard objectives add scythe.sdrop.cd dummy

scoreboard objectives add melee.src.cd dummy
scoreboard objectives add magic_book.src.cd dummy
scoreboard objectives add range.src.cd dummy
scoreboard objectives add pot.src.cd dummy
scoreboard objectives add wand.src.cd dummy
scoreboard objectives add scythe.src.cd dummy
scoreboard objectives add pot.holding.delay custom:play_time
scoreboard objectives add weapon.holding.delay custom:play_time

scoreboard objectives add charging_bow dummy
scoreboard objectives add config dummy
scoreboard players set $difficulty config 2

scoreboard objectives add block_infinity_delay dummy
#---end

function operation:set

function core:p_set
gamerule command_block_output false
gamerule advance_time false
gamerule advance_weather false
gamerule mob_griefing false
gamerule allow_entering_nether_using_portals false
gamerule fire_spread_radius_around_player -1
gamerule limited_crafting true
gamerule spawn_mobs false
gamerule random_tick_speed 0
gamerule pvp false
gamerule keep_inventory true
gamerule show_death_messages false
gamerule spectators_generate_chunks true

scoreboard objectives add infinity.use.torch minecraft.used:torch
scoreboard objectives add infinity.delay.torch dummy
scoreboard objectives add infinity.use.blue_glass minecraft.used:blue_stained_glass
scoreboard objectives add infinity.delay.blue_glass dummy

scoreboard objectives add ench.block.timer dummy
scoreboard objectives add ench.block.interval dummy
scoreboard objectives add ench.parry.timer dummy
scoreboard objectives add ench.parry.level dummy
scoreboard objectives add ench.attention.count dummy
scoreboard objectives add ench.buffer.level dummy
scoreboard objectives add ench.grief.count dummy
scoreboard objectives add ench.pursue.count dummy
scoreboard objectives add ench.scholar.1 custom:play_time
scoreboard objectives add ench.scholar.2 custom:play_time
scoreboard objectives add ench.sidestep.time custom:play_time
scoreboard objectives add ench.spacing.speed1 dummy
scoreboard objectives add ench.spacing.speed2 dummy
scoreboard objectives add ench.stream.interval dummy
scoreboard objectives add ench.unreal.count dummy
scoreboard objectives add ench.unreal.interval dummy

scoreboard objectives add warrior.pas1 dummy
scoreboard objectives add warrior.pas2 dummy
scoreboard objectives add mage.pas1 dummy
scoreboard objectives add alch.pas1 dummy
scoreboard objectives add alch.pas2 dummy
scoreboard objectives add alch.pas3 dummy
scoreboard objectives add alch.pas4 dummy
scoreboard objectives add scout.pas1 dummy
scoreboard objectives add scout.pas2 dummy
scoreboard objectives add scout.pas3 dummy
scoreboard objectives add assassin.pas1 dummy
scoreboard objectives add assassin.pas2 dummy
scoreboard objectives add assassin.pas3 dummy

scoreboard objectives add warrior.contract custom:play_time
scoreboard objectives add warrior.rage_req dummy
scoreboard objectives add warrior.rage dummy
scoreboard objectives add time_not_melee_attacking custom:play_time
scoreboard objectives add warrior.damage_dealt custom:damage_dealt

scoreboard objectives add mage.1.charges dummy
scoreboard objectives add mage.3.in dummy
scoreboard objectives add mage.6.delay custom:play_time
scoreboard objectives add mage.7.queue.1 dummy
scoreboard objectives add mage.7.queue.2 dummy
scoreboard objectives add mage.7.queue.3 dummy
scoreboard objectives add mage.7.time custom:play_time
scoreboard objectives add mage.8.count dummy
scoreboard objectives add mage.8.count.2 dummy

scoreboard objectives add alch.2.time dummy
scoreboard objectives add alch.garden dummy
scoreboard objectives add alch.garden.next dummy