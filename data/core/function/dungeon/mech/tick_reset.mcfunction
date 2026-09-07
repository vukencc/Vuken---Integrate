execute if score $s_vir dungeon_is_loading matches 1 run return run function core:dungeon/load/bridge
execute if score $s_vir dungeon_is_loading matches -1 run return run function core:dungeon/load/end with storage dungeon_chunk_loader sp


###Set a Reload Area
#execute if score $s_vir dungeon_is_loading matches (ID) run function core:dungeon/load/init {x1:, y1:, z1:, x2:, y2:, z2:, dy:, sp_x:, sp_y:, sp_z:,v_x:, v_y:, v_z:, c_x:, c_y:, c_z:, v_yaw:, v_pitch:}
# Arguments: 
# ID(dungeon's id)
# [x,y,z][1,2](clone_box) 
# dy(target.y - origin.y)
# sp[x,y,z](reboot point, where you are after the dungeon is completed)
# v_[x,y,z,yaw,pitch](spectate point when reloading dungeon)
# c_[x,y,z](center of the reload area)

###EXAMPLE

#corner 1 : -868 121 -522
#corner 2 : -575 292 -316
#Y: -179
#Viewer: -685 39 -402
#Home: 26.50 124.00 55.49
#center: -685 39 -402
#execute if score $s_vir dungeon_is_loading matches 2 run function core:dungeon/load/init {x1:-868, y1:121, z1:-522, x2:-575, y2:292, z2:-316, dy:-179, sp_x:26.50, sp_y:124.00, sp_z:55.50,v_x:-685, v_y:39, v_z:-402, c_x:-685, c_y:39, c_z:-402, v_yaw:120, v_pitch:40}

###EXAMPLE END
