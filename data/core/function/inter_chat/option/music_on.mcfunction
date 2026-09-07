playsound entity.experience_orb.pickup hostile @s ~ ~ ~
tag @s remove music_off
tag @s remove music_on
stopsound @s voice
scoreboard players set @s music_timing 10
tag @s add music_on