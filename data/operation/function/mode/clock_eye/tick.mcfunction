### 12 - 1 - 2 ... 11
### 0 - 30 - 60 ... 330
execute positioned ~-12 ~-3 ~-12 unless entity @e[type=!#bypass,dx=23,dy=5,dz=23] run return fail
execute rotated ~ 0 run summon marker ^ ^ ^0.1 {Tags:["mode.clockeye","12clock"]}
execute rotated ~30 0 run summon marker ^ ^ ^0.1 {Tags:["mode.clockeye","1clock"]}
execute rotated ~60 0 run summon marker ^ ^ ^0.1 {Tags:["mode.clockeye","2clock"]}
execute rotated ~90 0 run summon marker ^ ^ ^0.1 {Tags:["mode.clockeye","3clock"]}
execute rotated ~120 0 run summon marker ^ ^ ^0.1 {Tags:["mode.clockeye","4clock"]}
execute rotated ~150 0 run summon marker ^ ^ ^0.1 {Tags:["mode.clockeye","5clock"]}
execute rotated ~180 0 run summon marker ^ ^ ^0.1 {Tags:["mode.clockeye","6clock"]}
execute rotated ~210 0 run summon marker ^ ^ ^0.1 {Tags:["mode.clockeye","7clock"]}
execute rotated ~240 0 run summon marker ^ ^ ^0.1 {Tags:["mode.clockeye","8clock"]}
execute rotated ~270 0 run summon marker ^ ^ ^0.1 {Tags:["mode.clockeye","9clock"]}
execute rotated ~300 0 run summon marker ^ ^ ^0.1 {Tags:["mode.clockeye","10clock"]}
execute rotated ~330 0 run summon marker ^ ^ ^0.1 {Tags:["mode.clockeye","11clock"]}
execute facing entity @n[type=!#bypass] feet rotated ~ 0 positioned ^ ^ ^0.1 as @n[type=marker,tag=mode.clockeye] run function operation:mode/clock_eye/check
execute positioned ~-1 ~-1 ~-1 run kill @e[type=marker,tag=mode.clockeye,dx=1,dy=1,dz=1]