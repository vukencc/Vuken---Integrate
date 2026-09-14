# Enchantment affected=damaging_entity supplies the exact arrow, independent of nearby arrows.
tag @e[tag=scout.hit_arrow] remove scout.hit_arrow
execute if entity @s[type=#arrows] if data entity @s data.damage run tag @s add scout.hit_arrow
