# Death carrier preserves the death position. Each nearby alchemist has their own cooldown.
execute as @a[distance=..16,scores={class=3,alch.pas3=1..2},gamemode=!spectator,nbt=!{Health:0.0f}] unless score @s alch.gift.cd matches 1.. run function core:class/ability/alchemist/7/drop
