scoreboard players set @s scout.dash 0
execute if score @s scout.level matches 1 as @e[type=!#bypass,distance=..3.5,nbt=!{Health:0.0f},sort=nearest,limit=1] run function operation:stats/stunned/init {type:1,duration:15}
execute if score @s scout.level matches 2 as @e[type=!#bypass,distance=..3.5,nbt=!{Health:0.0f}] run function operation:stats/stunned/init {type:1,duration:15}
function core:class/ability/scout/3/particle
