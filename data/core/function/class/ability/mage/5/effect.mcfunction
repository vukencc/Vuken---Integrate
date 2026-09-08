# The snowball has collided and its passenger is now the stationary black hole.
tag @s add mage.5.active
data modify entity @s Motion set value [0.0d,0.0d,0.0d]
execute store result score @s timing_limited run data get entity @s data.lifetime
scoreboard players set @s inter_custom_cd 0
playsound block.bell.resonate hostile @a ~ ~ ~
playsound block.bell.use hostile @a ~ ~ ~
function core:class/ability/mage/5/active
