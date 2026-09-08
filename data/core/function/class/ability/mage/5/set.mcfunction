# The caster's facing is retained while @s is the freshly tagged projectile.
execute on passengers store result score @s marker run data get storage core:mage_5 cast.owner
function operation:motion/set_forward/init {speed:1}
data modify entity @s Motion set from storage motion set_forward
execute on passengers run data modify entity @s data merge from storage core:mage_5 cast
execute on passengers run scoreboard players set @s inter_custom_cd 0
tag @s remove mage.5.new
