scoreboard players set @a sniper_or_pb 0
scoreboard players set @a damageResisted 0
scoreboard players set @a natDamageResisted 0
scoreboard players set @a std1000 1000
scoreboard players set @a std100 100
scoreboard players set @a std10 10
scoreboard players set @a std750 19
scoreboard players set @a env_damage_timing 0
scoreboard players set @a inter_custom_cd 0
scoreboard players set @a data_delay 0
scoreboard players set @a std1 1
scoreboard players set @a repeat_600_timing 0
scoreboard players set @a melee_protection 0
scoreboard players set @a magic_protection 0
scoreboard players set @a env_protection 0
scoreboard players set @a evasion 0
scoreboard players set @a melee_evasion 0
scoreboard players set @a magic_evasion 0
scoreboard players set @a std2 2
scoreboard players set @a death_escape_timing 0
scoreboard players set @a class 0
scoreboard players set @a class_menu.trigger -1

scoreboard players set @a std20 20
scoreboard players set @a std_neg -1
scoreboard players set @a time_not_taking_damage 0
scoreboard players set @a time_not_killing_entities 0
scoreboard players set @a player.BypassHurtTime 10
scoreboard players set @a PotionCharger.cd 0
scoreboard players set @a ChestModel.cd 0
scoreboard players set @a ench.invert.cd 0
scoreboard players set @a ench.block.timer 0
scoreboard players set @a ench.block.interval 0
scoreboard players set @a ench.parry.timer 0
scoreboard players set @a ench.parry.level 0
execute as @a run function operation:event/player/refresh/inventory
#init
item replace entity @a saddle with saddle[enchantments={"core:inter/tick_load":1},equippable={slot:"saddle",equip_sound:{sound_id:"",range:0}}]
#static virtual scb set
scoreboard players set $s_vir repeat_10_timing 0
scoreboard players set $s_vir repeat_25_timing 0
scoreboard players set $s_vir repeat_600_timing 0
scoreboard players set @a operation.motion.delay 0
scoreboard players set @a music_timing 0
scoreboard players set @a gamemode.scb 0
scoreboard players set @a in_boss 0
scoreboard players set @a player.HurtTime 0
scoreboard players set @a player.HurtTime.vir 0
scoreboard players set @a in_area 0
execute as @a unless entity @s[tag=music_off] unless entity @s[tag=music_on] run tag @s add music_on

scoreboard players set @a melee.rc 0
scoreboard players set @a magic_book.rc 0
scoreboard players set @a wand.rc 0
scoreboard players set @a scythe.rc 0

scoreboard players set @a magic_book.lc 0
scoreboard players set @a range.lc 0
scoreboard players set @a pot.lc 0
scoreboard players set @a wand.lc 0

scoreboard players set @a melee.slc 0
scoreboard players set @a magic_book.slc 0
scoreboard players set @a range.slc 0
scoreboard players set @a pot.slc 0
scoreboard players set @a wand.slc 0
scoreboard players set @a scythe.slc 0

scoreboard players set @a melee.swap 0
scoreboard players set @a magic_book.swap 0
scoreboard players set @a range.swap 0
scoreboard players set @a pot.swap 0
scoreboard players set @a wand.swap 0
scoreboard players set @a scythe.swap 0

scoreboard players set @a melee.sswap 0
scoreboard players set @a magic_book.sswap 0
scoreboard players set @a range.sswap 0
scoreboard players set @a pot.sswap 0
scoreboard players set @a wand.sswap 0
scoreboard players set @a scythe.sswap 0

scoreboard players set @a melee.drop 0
scoreboard players set @a magic_book.drop 0
scoreboard players set @a range.drop 0
scoreboard players set @a pot.drop 0
scoreboard players set @a wand.drop 0
scoreboard players set @a scythe.drop 0

scoreboard players set @a melee.sdrop 0
scoreboard players set @a magic_book.sdrop 0
scoreboard players set @a range.sdrop 0
scoreboard players set @a pot.sdrop 0
scoreboard players set @a wand.sdrop 0
scoreboard players set @a scythe.sdrop 0

scoreboard players set @a melee.src 0
scoreboard players set @a magic_book.src 0
scoreboard players set @a range.src 0
scoreboard players set @a pot.src 0
scoreboard players set @a wand.src 0
scoreboard players set @a scythe.src 0

scoreboard players set @a melee.rc.cd 0
scoreboard players set @a magic_book.rc.cd 0
scoreboard players set @a wand.rc.cd 0
scoreboard players set @a scythe.rc.cd 0

scoreboard players set @a magic_book.lc.cd 0
scoreboard players set @a range.lc.cd 0
scoreboard players set @a pot.lc.cd 0
scoreboard players set @a wand.lc.cd 0

scoreboard players set @a melee.slc.cd 0
scoreboard players set @a magic_book.slc.cd 0
scoreboard players set @a range.slc.cd 0
scoreboard players set @a pot.slc.cd 0
scoreboard players set @a wand.slc.cd 0
scoreboard players set @a scythe.slc.cd 0

scoreboard players set @a melee.swap.cd 0
scoreboard players set @a magic_book.swap.cd 0
scoreboard players set @a range.swap.cd 0
scoreboard players set @a pot.swap.cd 0
scoreboard players set @a wand.swap.cd 0
scoreboard players set @a scythe.swap.cd 0

scoreboard players set @a melee.sswap.cd 0
scoreboard players set @a magic_book.sswap.cd 0
scoreboard players set @a range.sswap.cd 0
scoreboard players set @a pot.sswap.cd 0
scoreboard players set @a wand.sswap.cd 0
scoreboard players set @a scythe.sswap.cd 0

scoreboard players set @a melee.drop.cd 0
scoreboard players set @a magic_book.drop.cd 0
scoreboard players set @a range.drop.cd 0
scoreboard players set @a pot.drop.cd 0
scoreboard players set @a wand.drop.cd 0
scoreboard players set @a scythe.drop.cd 0

scoreboard players set @a melee.sdrop.cd 0
scoreboard players set @a magic_book.sdrop.cd 0
scoreboard players set @a range.sdrop.cd 0
scoreboard players set @a pot.sdrop.cd 0
scoreboard players set @a wand.sdrop.cd 0
scoreboard players set @a scythe.sdrop.cd 0

scoreboard players set @a melee.src.cd 0
scoreboard players set @a magic_book.src.cd 0
scoreboard players set @a range.src.cd 0
scoreboard players set @a pot.src.cd 0
scoreboard players set @a wand.src.cd 0
scoreboard players set @a scythe.src.cd 0

scoreboard players set @a charging_bow 0

scoreboard players set $id config 0
scoreboard players set $class_init config 0
effect clear @a resistance

tag @a[tag=!pickup_on] add pickup_off

function vfam:set

execute as @a store result score @s marker run scoreboard players add $id config 1

scoreboard players set @a stats.poison_immune.T 0

scoreboard players set @a infinity.delay.torch 0
scoreboard players set @a infinity.delay.blue_glass 0

scoreboard players set @a warrior.pas1 0
scoreboard players set @a warrior.pas2 0
scoreboard players set @a mage.pas1 0
scoreboard players set @a alch.pas1 0
scoreboard players set @a alch.pas2 0
scoreboard players set @a alch.pas3 0
scoreboard players set @a alch.pas4 0
scoreboard players set @a scout.pas1 0
scoreboard players set @a scout.pas2 0
scoreboard players set @a scout.pas3 0
scoreboard players set @a assassin.pas1 0
scoreboard players set @a assassin.pas2 0
scoreboard players set @a assassin.pas3 0

scoreboard players set @a mage.7.queue.1 0
scoreboard players set @a mage.7.queue.2 0
scoreboard players set @a mage.7.queue.3 0