execute at @a if score @p marker = @s marker run tag @p add DamageOwner
data modify storage input value set from entity @s data.value
execute as @e[dx=0.1,dy=0.1,dz=0.1,type=!#bypass] if entity @s[nbt={HurtTime:0s}] run function core:class/ability/warrior/5/apply_2
tag @a remove DamageOwner

tp @s ^ ^ ^0.2
particle block{block_state:{Name:stone}} ~ ~ ~ 0.2 0.05 0.2 0.015 7 normal
particle small_flame ~ ~ ~ 0.2 0.05 0.2 0.015 7 normal

execute if score $s_vir repeat_10_timing matches 1 run playsound block.bone_block.break hostile @a ~ ~ ~ 2 0.4 1
execute if score $s_vir repeat_10_timing matches 1 run playsound block.bone_block.break hostile @a ~ ~ ~ 2 0.4 1
execute if score $s_vir repeat_10_timing matches 1 run playsound block.bone_block.break hostile @a ~ ~ ~ 2 0.4 1
execute if score $s_vir repeat_10_timing matches 6 run playsound block.bone_block.break hostile @a ~ ~ ~ 2 0.4 1
execute if score $s_vir repeat_10_timing matches 6 run playsound block.bone_block.break hostile @a ~ ~ ~ 2 0.4 1
execute if score $s_vir repeat_10_timing matches 6 run playsound block.bone_block.break hostile @a ~ ~ ~ 2 0.4 1
execute unless score $s_vir repeat_10_timing matches 3 unless score $s_vir repeat_10_timing matches 8 run return fail
playsound block.stone.break hostile @a ~ ~ ~ 1 0.8 1
playsound block.stone.break hostile @a ~ ~ ~ 1 0.8 1
playsound block.stone.break hostile @a ~ ~ ~ 1 0.8 1
playsound block.stone.break hostile @a ~ ~ ~ 1 0.8 1