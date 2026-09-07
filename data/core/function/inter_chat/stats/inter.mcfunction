execute as @s at @s run function core:inter_chat/chatre
execute at @s run playsound item.book.page_turn hostile @s ~ ~ ~
tellraw @p {"text":"★========================★",color:"blue",bold:true}
tellraw @p {"text":"",color:"blue",bold:true}
tellraw @s [{translate:name.return.display,"fallback":"[ Return ]",color:"#a2fff7",bold:true,"click_event":{action:"run_command",command:"/trigger menu.trigger set 2"}}]
tellraw @p {"text":"",color:"blue",bold:true}
tellraw @s [{translate:name.player_stats.display,"fallback":"[ Defence ]",color:"#63ff5e",bold:true,"click_event":{action:"run_command",command:"/trigger menu.trigger set 18"}}]
tellraw @p {"text":"",color:"blue",bold:true}
tellraw @s [{translate:name.enemy_stats.display,"fallback":"[ Melee ]",color:"#ff7676",bold:true,"click_event":{action:"run_command",command:"/trigger menu.trigger set 19"}}]
tellraw @p {"text":"",color:"blue",bold:true}
tellraw @p {"text":"★========================★",color:"blue",bold:true}