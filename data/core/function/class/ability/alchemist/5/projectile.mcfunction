data merge entity @s {NoGravity:1b,Silent:1b,Tags:["alch.bomb.projectile","alch.bomb.new"],Item:{id:fire_charge,count:1}}
data modify entity @s Owner set from storage core:alchemist bomb.owner
function operation:motion/set_forward/init {speed:2.5}
data modify entity @s Motion set from storage motion set_forward
execute summon armor_stand run function core:class/ability/alchemist/5/carrier
tag @s remove alch.bomb.new
