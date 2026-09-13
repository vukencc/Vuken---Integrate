$execute if score @s range.slc matches 2 as @e[type=villager,tag=scout.decoy,nbt={data:{scout:{owner:$(owner)}}}] at @s run function core:class/ability/scout/5/end
return 1
