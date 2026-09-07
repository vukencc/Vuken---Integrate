execute if score @s warrior.pas1 matches 1 store result storage input value double 1.0 run function core:damage/melee/get {value:3}
execute if score @s warrior.pas1 matches 2 store result storage input value double 1.0 run function core:damage/melee/get {value:4}

tag @s add DamageOwner
execute on attacker run function core:damage/melee/do with storage input
execute on attacker at @s run particle crit ~ ~1 ~ 0.1 0.1 0.1 0.1 20 normal
tag @s remove DamageOwner