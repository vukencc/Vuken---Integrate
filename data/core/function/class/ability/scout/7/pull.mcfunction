effect give @s slowness 1 1 true
data modify entity @s Motion[0] set value 0.0d
data modify entity @s Motion[2] set value 0.0d
execute at @s as @n[type=marker,tag=scout.cloud.center] if predicate {condition:entity_properties,entity:this,predicate:{distance:{horizontal:{max:0.5}}}} run return 0
execute at @s facing entity @n[type=marker,tag=scout.cloud.center] feet rotated ~ 0 run function operation:motion/set_forward/init {speed:0.28}
data modify entity @s Motion[0] set from storage motion set_forward[0]
data modify entity @s Motion[2] set from storage motion set_forward[2]
