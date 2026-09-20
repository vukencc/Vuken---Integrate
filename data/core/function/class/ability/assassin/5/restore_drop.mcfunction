$execute unless entity @e[type=item,distance=..4,nbt={Thrower:$(dropped_owner)},limit=1] run return fail
$execute unless items entity @e[type=item,distance=..4,nbt={Thrower:$(dropped_owner)},sort=nearest,limit=1] contents #melee_weapon run return fail
execute if items entity @s weapon.mainhand * run return fail
$item replace entity @s weapon.mainhand from entity @e[type=item,distance=..4,nbt={Thrower:$(dropped_owner)},sort=nearest,limit=1] contents
$kill @e[type=item,distance=..4,nbt={Thrower:$(dropped_owner)},sort=nearest,limit=1]
function core:class/ability/assassin/5/cast
