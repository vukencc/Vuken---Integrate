# executed after the enemy is killed
# positioned as where the enemy died
# with Tags of the dead enemy
# no actual executor!

execute if entity @s[tag=mage.2.marked] run function core:class/ability/mage/2/death_effect
execute if entity @s[tag=mage_7_2] run function core:class/ability/mage/7/2/death_effect
function core:class/ability/alchemist/7/on_enemy_death
