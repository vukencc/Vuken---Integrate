# executed after the enemy is killed
# positioned as where the enemy died
# with Tags of the dead enemy
# no actual executor!

execute if entity @s[tag=mage.2.marked] run function core:class/ability/mage/2/death_effect
execute if entity @s[tag=mage_7_2] run function core:class/ability/mage/7/2/death_effect
function core:class/ability/alchemist/7/on_enemy_death
execute if entity @s[tag=assassin.5.1.apply] if score @s assassin.5.duration matches ..-1 run function core:class/ability/assassin/5/effect_1
execute if entity @s[tag=assassin.5.2.apply] if score @s assassin.5.duration matches ..-1 run function core:class/ability/assassin/5/effect_2