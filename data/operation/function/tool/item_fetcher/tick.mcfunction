particle enchant ~ ~ ~ -0.7 -0.7 -0.7 4 4 normal
execute positioned ~ ~-1.5 ~ if entity @p[distance=..7,gamemode=!spectator,scores={in_boss=0}] run return run execute unless entity @s[tag=Glowing] run function operation:tool/item_fetcher/glowing
execute unless entity @s[tag=Glowing] run return fail
tag @s remove Glowing
data merge entity @s {Glowing:false}