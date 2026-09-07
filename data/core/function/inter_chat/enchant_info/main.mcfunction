execute as @s at @s run function core:inter_chat/chatre
execute at @s run playsound item.book.page_turn hostile @s ~ ~ ~
tellraw @p {"text":"★========================★",color:"blue",bold:true}
tellraw @p {"text":"",color:"blue",bold:true}
tellraw @s [{translate:name.return.display,"fallback":"[ Return ]",color:"#a2fff7",bold:true,"click_event":{action:"run_command",command:"/trigger menu.trigger set 2"}}]
tellraw @p {"text":"",color:"blue",bold:true}
tellraw @s [{translate:name.defence_ench.display,"fallback":"[ Defence ]",color:"#7dff6c",bold:true,"click_event":{action:"run_command",command:"/trigger menu.trigger set 6"}}]
tellraw @p {"text":"",color:"blue",bold:true}
tellraw @s [{translate:name.melee_ench.display,"fallback":"[ Melee ]",color:"#e04c4c",bold:true,"click_event":{action:"run_command",command:"/trigger menu.trigger set 7"}}]
tellraw @p {"text":"",color:"blue",bold:true}
tellraw @s [{translate:name.range_ench.display,"fallback":"[ Range ]",color:"#90fff6",bold:true,"click_event":{action:"run_command",command:"/trigger menu.trigger set 8"}}]
tellraw @p {"text":"",color:"blue",bold:true}
tellraw @s [{translate:name.assistance_ench.display,"fallback":"[ Assistance ]",color:"#574bff",bold:true,"click_event":{action:"run_command",command:"/trigger menu.trigger set 9"}}]
tellraw @p {"text":"",color:"blue",bold:true}
tellraw @s [{translate:name.special.display,"fallback":"[ Special ]",color:"#ff76ed",bold:true,"click_event":{action:"run_command",command:"/trigger menu.trigger set 10"}}]
tellraw @p {"text":"",color:"blue",bold:true}
tellraw @p {"text":"★========================★",color:"blue",bold:true}
