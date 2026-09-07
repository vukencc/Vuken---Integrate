function core:class/sys/init
execute as @s at @s run function core:inter_chat/chatre
tellraw @s {text:"★========================★",color:"blue",bold:true}
tellraw @s {text:""}

execute if score @s class matches 0 run tellraw @s [{translate:"class.ui.current_class",color:white,bold:true,with:[{translate:"class.null",color:white,bold:true}]}]
execute if score @s class matches 1 run tellraw @s [{translate:"class.ui.current_class",color:white,bold:true,with:[{translate:"class.warrior.name",color:"#ff0d0d",bold:true}]}]
execute if score @s class matches 2 run tellraw @s [{translate:"class.ui.current_class",color:white,bold:true,with:[{translate:"class.mage.name",color:"#ff8ad1",bold:true}]}]
execute if score @s class matches 3 run tellraw @s [{translate:"class.ui.current_class",color:white,bold:true,with:[{translate:"class.alchemist.name",color:"#8aff8a",bold:true}]}]
execute if score @s class matches 4 run tellraw @s [{translate:"class.ui.current_class",color:white,bold:true,with:[{translate:"class.scout.name",color:"#6ec7ff",bold:true}]}]
execute if score @s class matches 5 run tellraw @s [{translate:"class.ui.current_class",color:white,bold:true,with:[{translate:"class.assassin.name",color:"#c77eff",bold:true}]}]

tellraw @s [{translate:"class.ui.reset",color:"#66ffd1",bold:true,click_event:{action:"run_command",command:"/trigger class_menu.trigger set 8"},hover_event:{action:"show_text",value:[{translate:"class.ui.reset.hover"}]}}]
tellraw @s {text:""}

execute if score @s class matches 0 run tellraw @s [{translate:"class.warrior.name",color:"#ff0d0d",bold:true,click_event:{action:"run_command",command:"/trigger class_menu.trigger set 1"},hover_event:{action:"show_text",value:[{translate:"class.warrior.hover_name",color:"#ff0d0d",underlined:true,bold:true},{translate:"class.warrior.desc"}]}}]
execute if score @s class matches 1 run tellraw @s [{translate:"class.warrior.name",color:"#ff0d0d",bold:true,click_event:{action:"run_command",command:"/trigger class_menu.trigger set 1"},hover_event:{action:"show_text",value:[{translate:"class.warrior.hover_name",color:"#ff0d0d",underlined:true,bold:true},{translate:"class.warrior.desc"}]}}]
execute unless score @s class matches 0 unless score @s class matches 1 run tellraw @s [{translate:"class.warrior.name",color:gray,bold:true,click_event:{action:"run_command",command:"/trigger class_menu.trigger set 11"},hover_event:{action:"show_text",value:[{translate:"class.warrior.hover_name",color:"#ff0d0d",underlined:true,bold:true},{translate:"class.warrior.desc"}]}}]

tellraw @s {text:""}

execute if score @s class matches 0 run tellraw @s [{translate:"class.mage.name",color:"#ff8ad1",bold:true,click_event:{action:"run_command",command:"/trigger class_menu.trigger set 2"},hover_event:{action:"show_text",value:[{translate:"class.mage.hover_name",color:"#ff8ad1",underlined:true,bold:true},{translate:"class.mage.desc"}]}}]
execute if score @s class matches 2 run tellraw @s [{translate:"class.mage.name",color:"#ff8ad1",bold:true,click_event:{action:"run_command",command:"/trigger class_menu.trigger set 2"},hover_event:{action:"show_text",value:[{translate:"class.mage.hover_name",color:"#ff8ad1",underlined:true,bold:true},{translate:"class.mage.desc"}]}}]
execute unless score @s class matches 0 unless score @s class matches 2 run tellraw @s [{translate:"class.mage.name",color:gray,bold:true,click_event:{action:"run_command",command:"/trigger class_menu.trigger set 12"},hover_event:{action:"show_text",value:[{translate:"class.mage.hover_name",color:"#ff8ad1",underlined:true,bold:true},{translate:"class.mage.desc"}]}}]

tellraw @s {text:""}

execute if score @s class matches 0 run tellraw @s [{translate:"class.alchemist.name",color:"#8aff8a",bold:true,click_event:{action:"run_command",command:"/trigger class_menu.trigger set 3"},hover_event:{action:"show_text",value:[{translate:"class.alchemist.hover_name",color:"#8aff8a",underlined:true,bold:true},{translate:"class.alchemist.desc"}]}}]
execute if score @s class matches 3 run tellraw @s [{translate:"class.alchemist.name",color:"#8aff8a",bold:true,click_event:{action:"run_command",command:"/trigger class_menu.trigger set 3"},hover_event:{action:"show_text",value:[{translate:"class.alchemist.hover_name",color:"#8aff8a",underlined:true,bold:true},{translate:"class.alchemist.desc"}]}}]
execute unless score @s class matches 0 unless score @s class matches 3 run tellraw @s [{translate:"class.alchemist.name",color:gray,bold:true,click_event:{action:"run_command",command:"/trigger class_menu.trigger set 13"},hover_event:{action:"show_text",value:[{translate:"class.alchemist.hover_name",color:"#8aff8a",underlined:true,bold:true},{translate:"class.alchemist.desc"}]}}]

tellraw @s {text:""}

execute if score @s class matches 0 run tellraw @s [{translate:"class.scout.name",color:"#6ec7ff",bold:true,click_event:{action:"run_command",command:"/trigger class_menu.trigger set 4"},hover_event:{action:"show_text",value:[{translate:"class.scout.hover_name",color:"#6ec7ff",underlined:true,bold:true},{translate:"class.scout.desc"}]}}]
execute if score @s class matches 4 run tellraw @s [{translate:"class.scout.name",color:"#6ec7ff",bold:true,click_event:{action:"run_command",command:"/trigger class_menu.trigger set 4"},hover_event:{action:"show_text",value:[{translate:"class.scout.hover_name",color:"#6ec7ff",underlined:true,bold:true},{translate:"class.scout.desc"}]}}]
execute unless score @s class matches 0 unless score @s class matches 4 run tellraw @s [{translate:"class.scout.name",color:gray,bold:true,click_event:{action:"run_command",command:"/trigger class_menu.trigger set 14"},hover_event:{action:"show_text",value:[{translate:"class.scout.hover_name",color:"#6ec7ff",underlined:true,bold:true},{translate:"class.scout.desc"}]}}]

tellraw @s {text:""}

execute if score @s class matches 0 run tellraw @s [{translate:"class.assassin.name",color:"#c77eff",bold:true,click_event:{action:"run_command",command:"/trigger class_menu.trigger set 5"},hover_event:{action:"show_text",value:[{translate:"class.assassin.hover_name",color:"#c77eff",underlined:true,bold:true},{translate:"class.assassin.desc"}]}}]
execute if score @s class matches 5 run tellraw @s [{translate:"class.assassin.name",color:"#c77eff",bold:true,click_event:{action:"run_command",command:"/trigger class_menu.trigger set 5"},hover_event:{action:"show_text",value:[{translate:"class.assassin.hover_name",color:"#c77eff",underlined:true,bold:true},{translate:"class.assassin.desc"}]}}]
execute unless score @s class matches 0 unless score @s class matches 5 run tellraw @s [{translate:"class.assassin.name",color:gray,bold:true,click_event:{action:"run_command",command:"/trigger class_menu.trigger set 15"},hover_event:{action:"show_text",value:[{translate:"class.assassin.hover_name",color:"#c77eff",underlined:true,bold:true},{translate:"class.assassin.desc"}]}}]

tellraw @s {text:""}
tellraw @s {text:"★========================★",color:"blue",bold:true}
