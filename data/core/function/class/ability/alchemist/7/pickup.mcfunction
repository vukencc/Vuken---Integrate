execute unless score @s alch.runtime matches 1 run function core:class/ability/alchemist/player_init
$scoreboard players set @s alch.tmp $(level)
execute if score @s alch.tmp > @s alch.gift.level run scoreboard players operation @s alch.gift.level = @s alch.tmp
scoreboard players add @s alch.gifts 1
execute if score @s alch.gift.level matches 1 if score @s alch.gifts matches 4.. run scoreboard players set @s alch.gifts 3
execute if score @s alch.gift.level matches 2 if score @s alch.gifts matches 6.. run scoreboard players set @s alch.gifts 5
function core:class/ability/alchemist/7/refresh
playsound entity.experience_orb.pickup player @s ~ ~ ~ 0.6 1.5
