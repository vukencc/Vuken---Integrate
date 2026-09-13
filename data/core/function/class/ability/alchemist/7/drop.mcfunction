scoreboard players set @s alch.gift.cd 100
execute store result storage core:alchemist gift.level int 1 run scoreboard players get @s alch.pas3
execute positioned ~ ~100 ~ summon armor_stand run function core:class/ability/alchemist/7/set
