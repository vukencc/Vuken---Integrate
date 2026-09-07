execute if entity @s[tag=EnchObsShot] run return fail
tag @s add EnchObsShot

execute store result score @s stdTemp1 on attacker run function core:custom_ench/forge/observation/cal
execute if score @s stdTemp1 matches 0 run return fail

data merge storage input {duration:100,level:2}
execute store result storage input level int 1 run scoreboard players get @s stdTemp1
function operation:stats/vulnerable/init with storage input