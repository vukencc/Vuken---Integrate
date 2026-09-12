attribute @s luck modifier remove core:alch_gifts
execute if score @s alch.gifts matches ..0 run scoreboard players set @s alch.gift.level 0
execute if score @s alch.gifts matches ..0 run scoreboard players set @s alch.mana.frac 0
execute unless score @s alch.gifts matches 1.. run return fail
scoreboard players set @s alch.tmp 5
execute if score @s alch.gift.level matches 2 run scoreboard players set @s alch.tmp 7
scoreboard players operation @s alch.tmp *= @s alch.gifts
execute store result storage core:alchemist gift_buff.value double 0.01 run scoreboard players get @s alch.tmp
function core:class/ability/alchemist/7/attribute with storage core:alchemist gift_buff
