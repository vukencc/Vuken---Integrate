### enemy_skill is the standard active-ability scb for enemies
### will be tick-set to 0 if the enemy is disabled in ability-use
### and continue to increase by 1 per tick as a timer for enemy skill loops
scoreboard players add @s enemy_skill 1

execute unless entity @s[tag=EnchBufferAffected] if entity @p[distance=..4.5,scores={ench.buffer.level=1..}] run function core:custom_ench/forge/buffer/apply

execute on passengers if entity @s[tag=mage.2.marked] run particle soul ~ ~1 ~ 0.2 0.6 0.2 0.05 2 normal
execute on passengers if entity @s[tag=mage_7_2] run particle sculk_soul ~ ~1 ~ 0.2 0.6 0.2 0.05 2 normal

execute if entity @s[tag=alch.2.marked] run scoreboard players remove @s alch.2.time 1
execute if entity @s[tag=alch.2.marked] run function core:class/ability/alchemist/2/particle_tick
execute if entity @s[tag=alch.2.marked] if score @s alch.2.time matches ..0 run function core:class/ability/alchemist/2/clear

scoreboard players remove @s[scores={mage.3.in=1..}] mage.3.in 1

execute if score @s mage.8.count matches 2.. run function core:class/ability/mage/8/1_init
execute if score @s mage.8.count.2 matches 3.. run function core:class/ability/mage/8/2_init