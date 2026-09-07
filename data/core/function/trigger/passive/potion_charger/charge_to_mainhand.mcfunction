execute as @n[type=sheep,tag=pc.placeholder] run function operation:stats/kill_this
$tp @n[type=acacia_chest_boat,distance=..8,tag=PotionCharger.Init,scores={marker=$(id)}] ~ ~-300 ~
$kill @n[type=acacia_chest_boat,tag=PotionCharger.Init,scores={marker=$(id)}]
tag @s remove pc.cursor