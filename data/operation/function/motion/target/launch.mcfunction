tp @s ~ ~1000 ~
tag @s[gamemode=survival] add temp.survival
tag @s[gamemode=adventure] add temp.adventure
gamemode creative @s
$execute positioned ~ ~1001.2 ~ positioned ^ ^ ^-2.35 run function operation:motion/pulse/init {temp:$(power)}
gamemode survival @s[tag=temp.survival]
gamemode adventure @s[tag=temp.adventure]
tag @s remove temp.survival
tag @s remove temp.adventure
tp @s ~ ~ ~