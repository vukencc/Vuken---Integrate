#this launches the player-only entity to the target with tag motion.launch_target
#and creates a [cd] cd to better accommodate to the launch area where there is a tick-detect
execute if entity @s[scores={operation.motion.delay=1..}] run return run tag @n[tag=motion.launch_target] remove motion.launch_target
$execute facing entity @n[tag=motion.launch_target] eyes run function operation:motion/target/launch {power:$(power)}
$scoreboard players set @s operation.motion.delay $(cd)
tag @n[tag=motion.launch_target] remove motion.launch_target