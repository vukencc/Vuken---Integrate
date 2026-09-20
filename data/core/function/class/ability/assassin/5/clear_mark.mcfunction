scoreboard players reset @s assassin.5.fx
tag @s remove assassin.5.1.apply
tag @s remove assassin.5.2.apply
data remove entity @s data.assassin_5_owner
scoreboard players reset @s assassin.5.duration
execute on passengers if items entity @s saddle *[enchantments~[{enchantments:"operation:enemy_event/on_death_tick"}]] run function core:class/ability/assassin/5/clear_mark
