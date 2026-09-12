scoreboard players set @p bacTemp1 1
tag @p add DamageOwner
execute at @s anchored eyes positioned ^ ^ ^0 anchored feet facing entity @p[tag=DamageOwner] eyes run function core:class/ability/mage/6/particle
execute store result storage input value double 1.0 as @p run function core:damage/magic/get {value:5}
scoreboard players add @s mage.8.count 1
scoreboard players add @s mage.8.count.2 1
function core:damage/magic/do with storage input
tag @p remove DamageOwner

playsound block.amethyst_block.chime hostile @p ~ ~ ~
playsound block.amethyst_block.chime hostile @p ~ ~ ~
playsound block.amethyst_block.chime hostile @p ~ ~ ~
playsound block.glass.break hostile @p ~ ~ ~
