# @s is the victim. Preserve a guard owned by the calling skill.
$execute unless entity @p[tag=DamageOwner,scores={class=5,assassin.pas3=1..2}] run return run damage @s $(value) core:custom_melee by @p[tag=DamageOwner]
$execute if entity @p[tag=DamageOwner,tag=assassin.skill.damage] run return run damage @s $(value) core:custom_melee by @p[tag=DamageOwner]
tag @p[tag=DamageOwner] add assassin.skill.damage
$damage @s $(value) core:custom_melee by @p[tag=DamageOwner]
tag @p[tag=DamageOwner] remove assassin.skill.damage
