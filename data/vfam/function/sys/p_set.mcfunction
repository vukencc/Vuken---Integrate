scoreboard players add $vfam_players vfam.index 1
data modify storage vfam vfam append value {count:0,modifiers:[]}
return run scoreboard players get $vfam_players vfam.index