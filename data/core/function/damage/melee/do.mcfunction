# Always initialize the base amount before the optional passive. No early return into skill code.
$data modify storage core:assassin_8 custom.value set value $(value)
execute if entity @p[tag=DamageOwner,scores={class=5,assassin.pas3=1..2}] run function core:class/ability/assassin/8/custom_damage
function core:damage/melee/commit with storage core:assassin_8 custom
