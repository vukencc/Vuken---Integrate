advancement revoke @s only core:forge_inter/forge_hurt
advancement revoke @s only core:forge_inter/forge_inter

execute as @n[tag=Forge] unless entity @s[tag=inited] at @s run function core:forge/trigger/pos_forge_run
execute positioned ~-10 ~-10 ~-10 run kill @e[dx=19,dy=19,dz=19,type=text_display,tag=clump_cost_display]
execute at @n[tag=Forge] run summon text_display ~ ~-0.6 ~-0.7 {Tags:["clump_cost_display"],Rotation:[0.0f,0.0f],alignment:"center",background:0,billboard:"vertical",default_background:0b,fall_distance:0.0d,glow_color_override:-1,height:0.0f,interpolation_duration:0,line_width:200,see_through:0b,shadow:0b,shadow_radius:0.0f,shadow_strength:1.0f,teleport_duration:0,text:[{bold:1b,color:"#ace8ff",translate:lore.forge.confirm}],transformation:{left_rotation:[0.0f,7.536411E-4f,0.0f,0.99999976f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0000005f,1.0000001f,1.0000005f],translation:[0.0f,0.0f,0.0f]},view_range:1.0f,width:0.0f,brightness:{block:15,sky:15}}
execute as @n[tag=Forge] at @s if entity @s[tag=rotate] run tp @n[type=text_display,tag=clump_cost_display] ~ ~-0.6 ~0.7

execute as @n[tag=Forge] run function core:forge/trigger/exe_forge_run
execute positioned ~-5 ~-5 ~-5 run kill @n[dx=9,dy=9,dz=9,tag=af_Forge]
execute positioned ~-5 ~-5 ~-5 run kill @n[dx=9,dy=9,dz=9,tag=pf_Forge]
execute positioned ~-5 ~-5 ~-5 run kill @n[dx=9,dy=9,dz=9,tag=uf_Forge]

function core:forge/trigger/return_forge_af
function core:forge/trigger/return_forge_pf
function core:forge/trigger/return_forge_uf

execute unless items entity @s weapon.mainhand *[custom_data~{ActiveSlot:1}] if items entity @s weapon.mainhand #armor at @n[tag=Forge] run summon interaction ~1.0 ~ ~ {Tags:["af_Forge"],width:0.7}
execute unless items entity @s weapon.mainhand *[custom_data~{PassiveSlot:1}] if items entity @s weapon.mainhand #armor at @n[tag=Forge] run summon interaction ~-1.0 ~ ~ {Tags:["pf_Forge"],width:0.7}
execute unless items entity @s weapon.mainhand *[custom_data~{ActiveSlot:1}] unless items entity @s weapon.mainhand #armor if items entity @s weapon.mainhand *[custom_data~{Offhand:1b}] at @n[tag=Forge] run summon interaction ~1.0 ~ ~ {Tags:["af_Forge"],width:0.7}
execute unless items entity @s weapon.mainhand *[custom_data~{PassiveSlot:1}] unless items entity @s weapon.mainhand #armor if items entity @s weapon.mainhand *[custom_data~{Offhand:1b}] at @n[tag=Forge] run summon interaction ~-1.0 ~ ~ {Tags:["pf_Forge"],width:0.7}

# execute unless items entity @s weapon.mainhand *[custom_data~{UpgradeSlot:1}] if items entity @s weapon.mainhand #armor at @n[tag=Forge] run summon interaction ~ ~1.1 ~ {Tags:["uf_Forge"],height:0.7}

execute as @n[tag=Forge] if entity @s[tag=rotate] at @s run function core:forge/trigger/switch_place

execute if score @n[tag=Forge] marker matches 1.. run function core:forge/trigger/return_forge

#
# execute unless items entity @s weapon.mainhand *[custom_data~{ActiveSlot:1}] positioned ~-10 ~-10 ~-10 run function core:forge/trigger/if_pos_af

# execute unless items entity @s weapon.mainhand *[custom_data~{PassiveSlot:1}] positioned ~-10 ~-10 ~-10 run function core:forge/trigger/if_pos_pf
#

execute if score @n[tag=Forge] marker_2 matches 1.. run function core:forge/trigger/give_forge

execute if entity @e[type=item_display,tag=forge_show] run function core:forge/trigger/deal_cal

execute positioned ~-5 ~-5 ~-5 run kill @n[dx=9,dy=9,dz=9,tag=deal_Forge]
execute if entity @e[tag=forge_show] at @n[tag=Forge] run summon interaction ~ ~-1 ~ {Tags:["deal_Forge"],width:1.35}