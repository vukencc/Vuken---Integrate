scoreboard players add $vfam vfam.index 1
execute if score $vfam vfam.index matches 0 run scoreboard players set $vfam vfam.index -20
execute if score $vfam vfam.index matches -10 as @a run function vfam:sys/p_tick
