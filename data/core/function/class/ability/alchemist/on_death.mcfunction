function core:class/ability/alchemist/clear_skills
scoreboard players set @s alch.gifts 0
scoreboard players set @s alch.gift.level 0
scoreboard players set @s alch.mana.frac 0
attribute @s luck modifier remove core:alch_gifts
scoreboard players set @s alch.deaths 0
