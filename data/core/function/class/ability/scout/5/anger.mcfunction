# Establish retaliation through the normal damage path only when another attacker displaced the decoy.
# Rewriting last_hurt_by_mob during every pulse resets ranged mobs' attack state.
$execute if entity @s[nbt={data:{scout_decoy_anger:$(target)},last_hurt_by_mob:$(target)}] run return fail
$execute store success score @s scout.tmp run damage @s 0 minecraft:mob_attack by @e[type=villager,tag=scout.decoy,nbt={UUID:$(target)},limit=1]
execute unless score @s scout.tmp matches 1 run return fail
# Zero damage records the attacker but does not advance the retaliation timestamp.
# Set it once so HurtByTargetGoal adopts the decoy without repeatedly interrupting bow use.
data modify entity @s ticks_since_last_hurt_by_mob set value 1
$data modify entity @s data.scout_decoy_anger set value $(target)
