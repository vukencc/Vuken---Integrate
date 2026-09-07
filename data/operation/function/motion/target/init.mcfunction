#this launches the player-only entity to the target with tag motion.launch_target
$execute facing entity @n[tag=motion.launch_target] eyes run function operation:motion/target/launch {power:$(power)}
tag @n[tag=motion.launch_target] remove motion.launch_target