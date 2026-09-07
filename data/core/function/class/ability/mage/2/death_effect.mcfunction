execute at @a if score @p marker = @s marker run tag @p add DamageOwner
execute store result storage input value double 1.0 run data get entity @s data.mage_2_damage.value

execute if entity @s[tag=mage.2.marked.1] as @e[type=!#bypass,distance=..3.5] run function core:class/ability/mage/2/death_damage
execute if entity @s[tag=mage.2.marked.2] as @e[type=!#bypass,distance=..7] run function core:class/ability/mage/2/death_damage

function core:class/ability/mage/2/death_particle

tag @a remove DamageOwner

playsound entity.firework_rocket.large_blast hostile @a ~ ~ ~
playsound entity.firework_rocket.large_blast_far hostile @a ~ ~ ~
playsound entity.firework_rocket.twinkle hostile @a ~ ~ ~
playsound entity.firework_rocket.twinkle_far hostile @a ~ ~ ~