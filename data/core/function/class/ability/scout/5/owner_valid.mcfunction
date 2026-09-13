$execute if entity @a[nbt={UUID:$(owner)},scores={class=4,range.slc=1..2},gamemode=!spectator,distance=..96,nbt=!{Health:0.0f}] run return 1
return 0
