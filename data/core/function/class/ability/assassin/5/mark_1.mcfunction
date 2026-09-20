data modify entity @s data.assassin_5_owner set from storage core:assassin_5 hit_owner
scoreboard players set @s assassin.5.duration -200
effect give @s glowing 10 0 true
tag @s remove assassin.5.2.apply
tag @s add assassin.5.1.apply
execute on passengers if items entity @s saddle *[enchantments~[{enchantments:"operation:enemy_event/on_death_tick"}]] run function core:class/ability/assassin/5/mark_carrier_1
data modify storage core:assassin_5 hit set value 1b
scoreboard players set @s assassin.5.fx 0
execute at @s run function core:class/ability/assassin/5/fx/hit
