scoreboard players set @s alch.gift.cap 3
execute if score @s alch.pas3 matches 2 run scoreboard players set @s alch.gift.cap 5
execute if score @s alch.gift.level matches 2 run scoreboard players set @s alch.gift.cap 5
title @s actionbar [{text:"幸运礼物 ",color:"aqua"},{score:{name:"@s",objective:"alch.gifts"},color:"gold"},{text:"/",color:"gray"},{score:{name:"@s",objective:"alch.gift.cap"},color:"gold"}]
