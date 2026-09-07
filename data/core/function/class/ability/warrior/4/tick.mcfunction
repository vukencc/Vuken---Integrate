
execute if score @s timing_limited matches 1 positioned ~ ~-0.75 ~ run return run function core:class/ability/warrior/4/end

execute if score @s marker_2 matches 0 positioned ~ ~-0.75 ~ run return run function core:class/ability/warrior/4/end

execute on vehicle as @s rotated as @s run rotate @s ~5 ~
rotate @s ~2.5 ~

execute positioned ~ ~-0.75 ~ if entity @s[tag=gilded_region_1] as @a[distance=..4] unless predicate {condition:entity_properties,entity:this,predicate:{effects:{luck:{amplifier:{min:1}}}}} run effect give @s luck 1 1 true

execute positioned ~ ~-0.75 ~ if entity @s[tag=gilded_region_2] as @a[distance=..4] unless predicate {condition:entity_properties,entity:this,predicate:{effects:{luck:{amplifier:{min:3}}}}} run effect give @s luck 1 3 true

execute at @a if score @p marker = @s marker run tag @p add DamageOwner
data modify storage input value set from entity @s data.value

execute if entity @s[tag=gilded_region_1] positioned ~ ~-0.75 ~ as @e[distance=..4,type=!#bypass_without_projectiles] positioned ~ ~0.75 ~ run function core:class/ability/warrior/4/to_enemy_1
execute if entity @s[tag=gilded_region_2] positioned ~ ~-0.75 ~ as @e[distance=..4,type=!#bypass_without_projectiles] positioned ~ ~0.75 ~ run function core:class/ability/warrior/4/to_enemy_2

tag @a remove DamageOwner

execute if score @s marker_2 matches 1 unless entity @s[tag=gilded_region_hp_1] run function core:class/ability/warrior/4/name {health:1}
execute if score @s marker_2 matches 2 unless entity @s[tag=gilded_region_hp_2] run function core:class/ability/warrior/4/name {health:2}
execute if score @s marker_2 matches 3 unless entity @s[tag=gilded_region_hp_3] run function core:class/ability/warrior/4/name {health:3}
execute if score @s marker_2 matches 4 unless entity @s[tag=gilded_region_hp_4] run function core:class/ability/warrior/4/name {health:4}
execute if score @s marker_2 matches 5 unless entity @s[tag=gilded_region_hp_5] run function core:class/ability/warrior/4/name {health:5}
execute if score @s marker_2 matches 6 unless entity @s[tag=gilded_region_hp_6] run function core:class/ability/warrior/4/name {health:6}
execute if score @s marker_2 matches 7 unless entity @s[tag=gilded_region_hp_7] run function core:class/ability/warrior/4/name {health:7}

execute positioned ~ ~-0.75 ~ run function core:class/ability/warrior/4/particle
