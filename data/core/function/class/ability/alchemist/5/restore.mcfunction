$execute unless items entity @n[type=item,distance=..4,nbt={Thrower:$(owner),Item:{components:{"minecraft:custom_data":{IsArcanePot:1b}}}}] contents *[custom_data~{IsArcanePot:true}] run return fail
$item replace entity @s weapon.mainhand from entity @n[type=item,distance=..4,nbt={Thrower:$(owner),Item:{components:{"minecraft:custom_data":{IsArcanePot:1b}}}}] contents
$kill @n[type=item,distance=..4,nbt={Thrower:$(owner),Item:{components:{"minecraft:custom_data":{IsArcanePot:1b}}}}]
return 1
