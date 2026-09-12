# Integer remainder preserves 5%/7% bonuses to the base 10 mana units per tick.
scoreboard players set @s alch.tmp 5
execute if score @s alch.gift.level matches 2 run scoreboard players set @s alch.tmp 7
scoreboard players operation @s alch.tmp *= @s alch.gifts
scoreboard players set @s alch.tmp2 10
scoreboard players operation @s alch.tmp *= @s alch.tmp2
execute if score @s player.ManaBar matches ..3999 run scoreboard players operation @s alch.mana.frac += @s alch.tmp
scoreboard players operation @s alch.tmp = @s alch.mana.frac
scoreboard players set @s alch.tmp2 100
scoreboard players operation @s alch.tmp /= @s alch.tmp2
scoreboard players operation @s alch.mana.frac %= @s alch.tmp2
execute if score @s player.ManaBar matches ..3999 run scoreboard players operation @s player.ManaBar += @s alch.tmp
execute if score @s player.ManaBar matches 4001.. run scoreboard players set @s player.ManaBar 4000
execute if score @s alch.heal.cd matches 1.. run return fail
execute store result score @s alch.tmp run data get entity @s Health 1000
execute store result score @s alch.tmp2 run attribute @s max_health get 1000
execute if score @s alch.tmp < @s alch.tmp2 run function core:class/ability/alchemist/7/heal
