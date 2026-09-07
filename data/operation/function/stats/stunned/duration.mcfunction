execute if items entity @s saddle *[enchantments~[{enchantments:"operation:stats/stunned",levels:2}]] run scoreboard players set @s enemy_skill -1
scoreboard players remove @s stats.stunned.duration 1
execute if score @s stats.stunned.duration matches 0 run function operation:stats/stunned/end