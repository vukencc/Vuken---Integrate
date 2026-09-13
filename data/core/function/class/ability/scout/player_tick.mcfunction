execute unless score @s class matches 4 run return run function core:class/ability/scout/clear
execute if entity @s[gamemode=spectator] run return run function core:class/ability/scout/clear
execute if entity @s[nbt={Health:0.0f}] run return run function core:class/ability/scout/clear
execute if score @s range.drop matches 1..2 unless entity @s[tag=scout.speed] run function core:class/ability/scout/3/speed
execute unless score @s range.drop matches 1..2 if entity @s[tag=scout.speed] run function core:class/ability/scout/3/clear
execute unless score @s range.lc matches 1..2 run scoreboard players set @s scout.charges 0
execute if score @s range.lc matches 1..2 unless score @s range.lc.cd matches 1.. run function core:class/ability/scout/1/refill
execute if score @s range.lc matches 1 if score @s scout.charges matches 2.. run scoreboard players set @s scout.charges 1
scoreboard players remove @s[scores={scout.pas1.cd=1..}] scout.pas1.cd 1
execute if score @s scout.pas1.cd matches 1 run title @s actionbar [{translate:"class.scout.ability2.name.text",color:"#d60c0c"},{translate:"class.ability.off_cooldown",color:"white"}]
execute if score @s scout.dash matches 1.. run function core:class/ability/scout/3/tick
function core:class/ability/scout/8/tick
