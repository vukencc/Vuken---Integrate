# Remove the armed tag before damage to prevent re-entry.
execute unless entity @s[tag=scout.explosive] run return fail
tag @s remove scout.explosive
data modify storage core:scout hit set from entity @s data.scout
execute store result score @s scout.tmp run data get storage core:scout hit.damage 1000
scoreboard players set @s scout.bonus 125
execute if data storage core:scout hit{level:2} run scoreboard players set @s scout.bonus 175
scoreboard players operation @s scout.tmp *= @s scout.bonus
execute store result storage core:scout hit.value double 0.00001 run scoreboard players get @s scout.tmp
execute as @e[type=!#bypass,distance=..3.5,nbt=!{Health:0.0f}] run function core:class/ability/scout/2/blast with storage core:scout hit
function core:class/ability/scout/2/particle
execute if data storage core:scout hit{level:2} summon marker run function core:class/ability/scout/2/mine
kill @s
