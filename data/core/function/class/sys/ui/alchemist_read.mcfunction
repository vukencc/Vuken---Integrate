execute as @s at @s run function core:inter_chat/chatre
tellraw @s {text:"★========================★",color:"blue",bold:true}
tellraw @s {text:""}
function core:class/sys/action/alchemist/1_desc
function core:class/sys/action/alchemist/2_desc
function core:class/sys/action/alchemist/3_desc
function core:class/sys/action/alchemist/4_desc
function core:class/sys/action/alchemist/5_desc
function core:class/sys/action/alchemist/6_desc
function core:class/sys/action/alchemist/7_desc
function core:class/sys/action/alchemist/8_desc

tellraw @s {text:""}
tellraw @s [{translate:"class.ui.back",color:"#66ffd1",bold:true,click_event:{action:"run_command",command:"/trigger class_menu.trigger set 0"},hover_event:{action:"show_text",value:[{translate:"class.ui.back.hover"}]}}]
tellraw @s {text:""}
tellraw @s {text:"★========================★",color:"blue",bold:true}








