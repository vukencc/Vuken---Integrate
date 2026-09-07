scoreboard players add @s enemy_skill 1

execute unless entity @s[tag=EnchBufferAffected] if entity @p[distance=..4.5,scores={ench.buffer.level=1..}] run function core:custom_ench/forge/buffer/apply

execute on passengers if entity @s[tag=mage.2.marked] run particle soul ~ ~1 ~ 0.2 0.6 0.2 0.05 2 normal

scoreboard players remove @s[scores={mage.3.in=1..}] mage.3.in 1