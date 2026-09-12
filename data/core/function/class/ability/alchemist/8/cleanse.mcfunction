effect clear @s weakness
effect clear @s unluck
attribute @s attack_damage modifier remove weakness.melee
scoreboard players set @s player.Weakness 0
scoreboard players set @s player.Vulnerable 0
scoreboard players set @s stats.vulnerable.duration 0
execute if items entity @s saddle *[enchantments~[{enchantments:"operation:stats/vulnerable"}]] run function operation:stats/vulnerable/end
