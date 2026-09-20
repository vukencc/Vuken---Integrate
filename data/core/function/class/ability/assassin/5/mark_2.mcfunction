data modify entity @s data.assassin_5_owner set from storage core:assassin_5 hit_owner
scoreboard players set @s assassin.5.duration -200
effect give @s glowing 10 0 true
tag @s remove assassin.5.1.apply
tag @s add assassin.5.2.apply
execute on passengers if items entity @s saddle *[enchantments~[{enchantments:"operation:enemy_event/on_death_tick"}]] run function core:class/ability/assassin/5/mark_carrier_2
data modify storage core:assassin_5 hit set value 1b
particle crit ~ ~1 ~ 0.35 0.5 0.35 0.12 12 normal
playsound block.chain.place player @a[distance=..20] ~ ~ ~ 0.7 1.4
