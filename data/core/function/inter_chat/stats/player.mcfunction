execute as @s at @s run function core:inter_chat/chatre
execute at @s run playsound item.book.page_turn hostile @s ~ ~ ~
tellraw @p {"text":"★========================★",color:"blue",bold:true}
tellraw @p {"text":"",color:"blue",bold:true}
tellraw @s [{translate:name.return.display,"fallback":"[ Return ]",color:"#a2fff7",bold:true,"click_event":{action:"run_command",command:"/trigger menu.trigger set 17"}}]
tellraw @p {"text":"",color:"blue",bold:true}
#   "lore.stats.luck":"每级减少你受到伤害的10%%。",
#   "lore.stats.unluck":"每级增加你受到伤害的10%%。",
#   "lore.stats.poison":"每秒使你失去最大血量的(2.5%%*状态等级)，忽视任何防御。",
#   "lore.stats.strength":"每级提升你所有伤害类型造成伤害的30%%。",
#   "lore.stats.weakness":"每级降低你所有伤害类型造成伤害的20%%。",
#   "lore.stats.speed":"每级提升你移动速度20%%。",
#   "lore.stats.hasten":"每级提升你的攻击速度10%%与挖掘效率20%%。",
tellraw @s [{translate:rawtext.blank.english,with:[{translate:effect.minecraft.luck}],color:"#afffca",bold:true,hover_event:{action:"show_text",value:[{translate:lore.stats.luck,"bold":true}]}}]
tellraw @s [{translate:rawtext.blank.english,with:[{translate:effect.minecraft.unluck}],color:"#afffca",bold:true,hover_event:{action:"show_text",value:[{translate:lore.stats.unluck,"bold":true}]}}]
tellraw @s [{translate:rawtext.blank.english,with:[{translate:effect.minecraft.wither}],color:"#afffca",bold:true,hover_event:{action:"show_text",value:[{translate:lore.stats.poison,"bold":true}]}}]
tellraw @s [{translate:rawtext.blank.english,with:[{translate:effect.minecraft.poison}],color:"#afffca",bold:true,hover_event:{action:"show_text",value:[{translate:lore.stats.mc_poison,"bold":true}]}}]
tellraw @s [{translate:rawtext.blank.english,with:[{translate:effect.minecraft.strength}],color:"#afffca",bold:true,hover_event:{action:"show_text",value:[{translate:lore.stats.strength,"bold":true}]}}]
tellraw @s [{translate:rawtext.blank.english,with:[{translate:effect.minecraft.weakness}],color:"#afffca",bold:true,hover_event:{action:"show_text",value:[{translate:lore.stats.weakness,"bold":true}]}}]
tellraw @s [{translate:rawtext.blank.english,with:[{translate:effect.minecraft.speed}],color:"#afffca",bold:true,hover_event:{action:"show_text",value:[{translate:lore.stats.speed,"bold":true}]}}]
tellraw @s [{translate:rawtext.blank.english,with:[{translate:effect.minecraft.haste}],color:"#afffca",bold:true,hover_event:{action:"show_text",value:[{translate:lore.stats.hasten,"bold":true}]}}]
tellraw @p {"text":"",color:"blue",bold:true}
tellraw @p {"text":"★========================★",color:"blue",bold:true}