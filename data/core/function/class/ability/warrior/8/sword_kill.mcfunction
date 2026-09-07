execute if score @s warrior.pas2 matches 0 run return fail
execute unless items entity @s weapon.mainhand #swords run return fail

execute if score @s warrior.pas2 matches 1 run data merge storage input {target:"@s",effect:attack_speed,id:warrior_8_atk_spd,value:0.15,duration:100,type:add_multiplied_total}
execute if score @s warrior.pas2 matches 2 run data merge storage input {target:"@s",effect:attack_speed,id:warrior_8_atk_spd,value:0.25,duration:100,type:add_multiplied_total}
function vfam:add with storage input