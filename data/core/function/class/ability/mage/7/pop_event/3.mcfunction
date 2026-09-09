execute if score @s wand.src matches 1 at @s as @e[type=!#bypass,distance=..8] run function operation:stats/stunned/init {duration:20,type:2}
execute if score @s wand.src matches 2 if score @s wand.sdrop matches 1 at @s as @e[type=!#bypass,distance=..8] run function operation:stats/stunned/init {duration:20,type:2}
execute if score @s wand.src matches 2 if score @s wand.sdrop matches 2 at @s as @e[type=!#bypass,distance=..8] run function operation:stats/stunned/init {duration:40,type:2}
playsound block.glass.break hostile @a ~ ~ ~
particle block{block_state:{Name:ice}} ~ ~0.2 ~ 2 0.1 2 0.1 35 normal
particle block{block_state:{Name:blue_ice}} ~ ~0.2 ~ 2 0.1 2 0.1 35 normal
particle block{block_state:{Name:packed_ice}} ~ ~0.2 ~ 2 0.1 2 0.1 35 normal