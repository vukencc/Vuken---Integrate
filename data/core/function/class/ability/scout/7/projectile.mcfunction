data merge entity @s {NoGravity:1b,Silent:1b,Tags:["scout.wind.projectile","scout.wind.new"],Item:{id:wind_charge,count:1}}
data modify entity @s Owner set from storage core:scout wind.owner
function operation:motion/set_forward/init {speed:2.2}
data modify entity @s Motion set from storage motion set_forward
execute summon armor_stand run function core:class/ability/scout/7/carrier
tag @s remove scout.wind.new
