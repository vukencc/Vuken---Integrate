playsound entity.enderman.teleport hostile @a ~ ~ ~
playsound entity.enderman.teleport hostile @a ~ ~ ~
playsound block.amethyst_block.chime hostile @a ~ ~ ~
playsound block.amethyst_block.chime hostile @a ~ ~ ~
playsound block.amethyst_block.chime hostile @a ~ ~ ~
execute positioned ~ ~1.5 ~ rotated ~ -90 run function core:class/ability/mage/4/particle

execute if score @s wand.drop matches 1 store result storage input value double 1.0 run function core:damage/magic/get {value:6}
execute if score @s wand.drop matches 2 store result storage input value double 1.0 run function core:damage/magic/get {value:8}
tag @s add DamageOwner
execute as @e[tag=mage.4.marked] run scoreboard players add @s mage.8.count 1
execute as @e[tag=mage.4.marked] run function core:damage/magic/do with storage input
tag @s remove DamageOwner

execute store result score @s stdTemp1 if entity @e[tag=mage.4.marked]
scoreboard players operation @s stdTemp2 = @s stdTemp1
scoreboard players operation @s bacTemp1 = @s stdTemp1

execute if score @s stdTemp2 matches 6.. run scoreboard players set @s stdTemp2 5
data merge storage input {target:"@s",effect:movement_speed,id:mage_4_spd,value:0.05,duration:160,type:add_multiplied_total}
execute store result storage input value double 0.05 run scoreboard players get @s stdTemp2
function vfam:add with storage input

execute store result score @s wand.drop.cd run function core:custom_ench/aptitude/cal {time:240}

execute if score @s wand.drop matches 1 run return run tag @e remove mage.4.marked

execute if score @s bacTemp1 matches 5.. run scoreboard players set @s bacTemp1 4
scoreboard players set @s stdTemp1 12
scoreboard players operation @s stdTemp1 -= @s bacTemp1
execute store result storage input time int 20 run scoreboard players get @s stdTemp1
execute store result score @s wand.drop.cd run function core:custom_ench/aptitude/cal with storage input

tag @e remove mage.4.marked