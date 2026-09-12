execute unless score @s class matches 3 run return fail
execute unless score @s pot.swap matches 1..2 run return fail
execute if score @s pot.swap.cd matches 1.. run return fail
execute unless data entity @s SelectedItem.components."minecraft:custom_data".ArcanePot.damage run return fail
execute unless data entity @s SelectedItem.components."minecraft:custom_data".ArcanePot.cost run return fail
execute store result score @s alch.tmp run data get entity @s SelectedItem.components."minecraft:custom_data".ArcanePot.cost 40
execute if score @s alch.pas1 matches 2 store result score @s alch.tmp run data get entity @s SelectedItem.components."minecraft:custom_data".ArcanePot.cost 32
execute unless score @s player.ManaBar >= @s alch.tmp run return fail
scoreboard players operation @s player.ManaBar -= @s alch.tmp
execute store result score @s pot.swap.cd run function core:custom_ench/aptitude/cal {time:100}
execute store result score @s alch.tmp run data get entity @s SelectedItem.components."minecraft:custom_data".ArcanePot.damage 1000
scoreboard players set @s alch.tmp2 3
execute if score @s pot.swap matches 2 run scoreboard players set @s alch.tmp2 5
scoreboard players operation @s alch.tmp *= @s alch.tmp2
scoreboard players add @s alch.tmp 10000
execute store result storage core:alchemist elixir.value double 0.00001 run scoreboard players get @s alch.tmp
function core:class/ability/alchemist/3/apply with storage core:alchemist elixir
scoreboard players set @s alch.elixir 120
execute if score @s pot.swap matches 2 run scoreboard players set @s alch.elixir 160
function core:class/ability/alchemist/4/on_skill
playsound entity.illusioner.cast_spell hostile @s ~ ~ ~ 1 1.5 1
particle witch ~ ~1 ~ 0.5 1 0.5 0.05 40 normal
