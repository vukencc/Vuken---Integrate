execute if score $config vfam.index matches 1 run return fail
scoreboard objectives remove vfam.timeline
scoreboard objectives remove vfam.index
data remove storage vfam vfam

scoreboard objectives add vfam.timeline custom:play_time
scoreboard players set @a vfam.timeline -2147483648
scoreboard objectives add vfam.index dummy
scoreboard players set $vfam_players vfam.index -1
data merge storage vfam {vfam:[]}
execute as @a store result score @s vfam.index run function vfam:sys/p_set
scoreboard objectives add vfam.e_index dummy
scoreboard objectives add vfam.tmp dummy
scoreboard objectives add vfam.tmp2 dummy
scoreboard players set $vfam vfam.index -20
scoreboard players set $config vfam.index 1

# To original function type:

# function vfam:add {target:"@s",effect:attack_damage,id:test,value:2,duration:200,type:add_value}

# function vfam:addp {args:[attack_damage,2,200,"+",test]} 
#   -> (target as "@s")
#   -> For TYPE: + for add_value, ++ for add_multiplied_base, +++ for add_multiplied_total

# function vfam:get {effect:magic_damage,type:"++",target:"@s",scale:1.5}
#   -> For TYPE: + for add_value, ++ for add_multiplied_base, +++ for add_multiplied_total

# function vfam:remove {target:"@s",id:test_2}

# function vfam:clear {target:"@s",effect:ranged_damage}