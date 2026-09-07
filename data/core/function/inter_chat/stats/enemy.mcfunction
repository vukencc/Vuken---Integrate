execute as @s at @s run function core:inter_chat/chatre
execute at @s run playsound item.book.page_turn hostile @s ~ ~ ~
tellraw @p {"text":"★========================★",color:"blue",bold:true}
tellraw @p {"text":"",color:"blue",bold:true}
tellraw @s [{translate:name.return.display,"fallback":"[ Return ]",color:"#a2fff7",bold:true,"click_event":{action:"run_command",command:"/trigger menu.trigger set 17"}}]
tellraw @p {"text":"",color:"blue",bold:true}
#   "lore.estats.vulnerable":"提升敌人受到的任意类型的伤害，包括固定百分比伤害。",
#   "lore.estats.poison":"每秒使敌人失去最大血量的(2.5%%*状态等级)，忽视任何防御。",
#   "lore.estats.weakness":"使敌人造成的近战与弹射物伤害减少(15*状态等级)%%，魔法伤害减少(10*状态等级)%%，最高五级，",
#   "lore.estats.bleed":"敌人每秒受到(1*状态等级)伤害，忽视任何防御。",
#   "lore.estats.frozen":"敌人被冻结，期间无法移动，攻击或使用主动技能。",
#   "lore.estats.stunned":"敌人眩晕，期间无法移动，但可以使用主动技能。",
#   "lore.estats.blinded":"敌人失明，期间无法追踪锁定敌人。",
tellraw @s [{translate:rawtext.blank.english,with:[{translate:effect.minecraft.vulnerable}],color:"#afffca",bold:true,hover_event:{action:"show_text",value:[{translate:lore.estats.vulnerable,"bold":true}]}}]
tellraw @s [{translate:rawtext.blank.english,with:[{translate:effect.minecraft.wither}],color:"#afffca",bold:true,hover_event:{action:"show_text",value:[{translate:lore.estats.poison,"bold":true}]}}]
tellraw @s [{translate:rawtext.blank.english,with:[{translate:effect.minecraft.poison}],color:"#afffca",bold:true,hover_event:{action:"show_text",value:[{translate:lore.estats.mc_poison,"bold":true}]}}]
tellraw @s [{translate:rawtext.blank.english,with:[{translate:effect.minecraft.weakness}],color:"#afffca",bold:true,hover_event:{action:"show_text",value:[{translate:lore.estats.weakness,"bold":true}]}}]
tellraw @s [{translate:rawtext.blank.english,with:[{translate:effect.minecraft.bleed}],color:"#afffca",bold:true,hover_event:{action:"show_text",value:[{translate:lore.estats.bleed,"bold":true}]}}]
tellraw @s [{translate:rawtext.blank.english,with:[{translate:effect.minecraft.frozen}],color:"#afffca",bold:true,hover_event:{action:"show_text",value:[{translate:lore.estats.frozen,"bold":true}]}}]
tellraw @s [{translate:rawtext.blank.english,with:[{translate:effect.minecraft.stunned}],color:"#afffca",bold:true,hover_event:{action:"show_text",value:[{translate:lore.estats.stunned,"bold":true}]}}]
tellraw @s [{translate:rawtext.blank.english,with:[{translate:effect.minecraft.blinded}],color:"#afffca",bold:true,hover_event:{action:"show_text",value:[{translate:lore.estats.blinded,"bold":true}]}}]
tellraw @p {"text":"",color:"blue",bold:true}
tellraw @p {"text":"★========================★",color:"blue",bold:true}