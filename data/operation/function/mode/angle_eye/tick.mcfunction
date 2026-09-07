execute positioned ~-12 ~-3 ~-12 unless entity @e[type=!#bypass,dx=23,dy=5,dz=23] run return fail
execute rotated ~ 0 positioned ^ ^ ^0.1 summon marker run function operation:mode/angle_eye/store_1
execute facing entity @n[type=!#bypass] feet rotated ~ 0 positioned ^ ^ ^0.1 summon marker run function operation:mode/angle_eye/store_2
scoreboard players operation @s stdTemp2 -= @s stdTemp1
execute if score @s stdTemp2 matches ..-181 run scoreboard players operation @s stdTemp2 += $360 math.times
execute if score @s stdTemp2 matches 181.. run scoreboard players operation @s stdTemp2 -= $360 math.times
execute if score @s stdTemp2 matches 3.. run return run function operation:mode/angle_eye/right
execute if score @s stdTemp2 matches ..-3 run return run function operation:mode/angle_eye/left
title @s times 0t 2t 0t
title @s subtitle {text:"<--- Locked On --->",color:"#a8fffb",bold:true,shadow_color:0}
title @s title {text:""}