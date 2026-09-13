function core:class/ability/alchemist/6/migrate_cd
execute unless score @s alch.runtime matches 1 run function core:class/ability/alchemist/player_init
execute if score @s alch.deaths matches 1.. run function core:class/ability/alchemist/on_death
execute unless score @s class matches 3 run function core:class/ability/alchemist/clear_skills
execute if score @s class matches 3 unless score @s pot.swap matches 1..2 if score @s alch.elixir matches 1.. run function core:class/ability/alchemist/3/end
execute if score @s class matches 3 unless score @s pot.sswap matches 1..2 run function core:class/ability/alchemist/4/end
execute unless score @s pot.drop matches 1..2 run scoreboard players set @s alch.charges 0
execute unless score @s pot.drop matches 1..2 run scoreboard players set @s alch.kills 0
execute if score @s pot.drop matches 1 if score @s alch.charges matches 3.. run scoreboard players set @s alch.charges 2
execute if entity @s[gamemode=spectator] run return fail
execute if entity @s[nbt={Health:0.0f}] run return fail
scoreboard players remove @s[scores={alch.elixir=1..}] alch.elixir 1
execute if score @s alch.elixir matches 0 if entity @s[tag=alch.elixir] run function core:class/ability/alchemist/3/end
execute if score @s alch.garden matches 1.. run function core:class/ability/alchemist/4/tick
scoreboard players remove @s[scores={alch.gift.cd=1..}] alch.gift.cd 1
execute if score @s alch.gift.cd matches 1 if score @s alch.pas3 matches 1..2 run title @s actionbar [{translate:class.alchemist.ability7.name.text,color:"aqua",bold:true},{translate:class.ability.off_cooldown,color:"white",bold:true}]
scoreboard players remove @s[scores={alch.heal.cd=1..}] alch.heal.cd 1
execute if score @s alch.gifts matches 1.. run function core:class/ability/alchemist/7/player_tick
