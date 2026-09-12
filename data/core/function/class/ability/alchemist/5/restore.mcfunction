$execute unless items entity @n[type=item,distance=..4,nbt={Thrower:$(owner)}] contents *[custom_data~{IsArcanePot:true}] run return fail
$item replace entity @s weapon.mainhand from entity @n[type=item,distance=..4,nbt={Thrower:$(owner)}] contents
$kill @n[type=item,distance=..4,nbt={Thrower:$(owner)}]
return 1
