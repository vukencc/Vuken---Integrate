# The second ordered post_attack effect supplies the exact victim of this collision.
execute unless entity @e[type=#arrows,tag=scout.hit_arrow,limit=1] run return fail
execute if entity @s[type=#bypass] run return run tag @e[tag=scout.hit_arrow] remove scout.hit_arrow
tag @e[tag=scout.hit_target] remove scout.hit_target
tag @s add scout.hit_target
execute as @n[type=#arrows,tag=scout.hit_arrow] at @s run function core:custom_ench/range/resolve_hit
