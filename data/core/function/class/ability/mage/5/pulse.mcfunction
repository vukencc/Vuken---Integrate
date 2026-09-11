execute store result storage input value double 1.0 run data get entity @s data.value
execute at @a if score @p marker = @s marker run tag @p add DamageOwner

execute if entity @s[tag=mage.5.1] as @e[type=!#bypass,distance=..5] run scoreboard players add @s mage.8.count 1
execute if entity @s[tag=mage.5.2] as @e[type=!#bypass,distance=..8] run scoreboard players add @s mage.8.count 1

execute if entity @s[tag=mage.5.1] as @e[type=!#bypass,distance=..5] run scoreboard players add @s mage.8.count.2 1
execute if entity @s[tag=mage.5.2] as @e[type=!#bypass,distance=..8] run scoreboard players add @s mage.8.count.2 1

execute if entity @s[tag=mage.5.1] as @e[type=!#bypass,distance=..5] run function core:damage/magic/do with storage input
execute if entity @s[tag=mage.5.2] as @e[type=!#bypass,distance=..8] run function core:damage/magic/do with storage input


execute if entity @s[tag=mage.5.1] as @e[type=!#bypass,distance=..5] run function operation:stats/vulnerable/init {level:2,duration:40}
execute if entity @s[tag=mage.5.2] as @e[type=!#bypass,distance=..8] run function operation:stats/vulnerable/init {level:4,duration:40}

tag @a remove DamageOwner