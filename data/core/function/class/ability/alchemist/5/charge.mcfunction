scoreboard players remove @s alch.kills 3
execute if score @s pot.drop matches 1 run scoreboard players add @s alch.charges 1
execute if score @s pot.drop matches 2 run scoreboard players add @s alch.charges 2
execute if score @s pot.drop matches 1 if score @s alch.charges matches 3.. run scoreboard players set @s alch.charges 2
execute if score @s pot.drop matches 2 if score @s alch.charges matches 4.. run scoreboard players set @s alch.charges 3
title @s actionbar [{translate:"class.alchemist.ability5.name.text",color:"#d10000"},{text:" × "},{score:{name:"@s",objective:"alch.charges"}}]
