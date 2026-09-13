scoreboard players set @s alch.runtime 1
scoreboard players set @s alch.elixir 0
scoreboard players set @s alch.garden 0
scoreboard players set @s alch.garden.next 0
scoreboard players set @s alch.charges 0
scoreboard players set @s alch.kills 0
execute unless score @s pot.src.cd matches 0.. run scoreboard players set @s pot.src.cd 0
scoreboard players set @s alch.gift.cd 0
scoreboard players set @s alch.gifts 0
scoreboard players set @s alch.gift.level 0
scoreboard players set @s alch.heal.cd 0
scoreboard players set @s alch.mana.frac 0
scoreboard players set @s alch.deaths 0
execute if score @s vfam.index matches 0.. run function vfam:remove {target:"@s",id:alch_elixir}
execute if score @s vfam.index matches 0.. run function vfam:remove {target:"@s",id:alch_elixir_spd}
