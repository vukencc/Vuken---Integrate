execute at @a if score @p marker = @s marker run tag @p add DamageOwner

scoreboard players operation $temp stdTemp1 = @s marker

data modify storage input value set from entity @s data.p1.value
data modify storage input value2 set from entity @s data.p2.value
execute store result storage input value3 int 1 run scoreboard players get @s marker_2
execute as @n[type=!#bypass,nbt={HurtTime:10s}] run function core:class/ability/mage/2/p1_damage

tag @a remove DamageOwner

kill @s