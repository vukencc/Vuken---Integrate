# Item entities support item copy; armor stands do not reliably support this equipment operation.
execute unless items entity @s weapon.mainhand * run return run function operation:container/offhand_to_main
summon item ~ ~ ~ {Tags:["operation.swap.buffer"],Item:{id:stone_button,count:1},PickupDelay:32767s}
item replace entity @n[type=item,tag=operation.swap.buffer,distance=..0.1] contents from entity @s weapon.mainhand
item replace entity @s weapon.mainhand from entity @s weapon.offhand
item replace entity @s weapon.offhand from entity @n[type=item,tag=operation.swap.buffer,distance=..0.1] contents
kill @n[type=item,tag=operation.swap.buffer,distance=..0.1]
