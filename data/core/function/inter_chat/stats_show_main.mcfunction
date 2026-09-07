execute as @s at @s run function core:inter_chat/chatre
execute at @s run playsound item.book.page_turn hostile @s ~ ~ ~
scoreboard objectives add temp_armor dummy
execute store result score @s temp_armor run attribute @s luck get
tellraw @p {"text":"★========================★",color:"blue",bold:true}
tellraw @p {"text":"",color:"blue",bold:true}
tellraw @s [{translate:name.return.display,"fallback":"[ Return ]",color:"#a2fff7",bold:true,"click_event":{action:"run_command",command:"/trigger menu.trigger set 2"}}]
tellraw @p {"text":"",color:"blue",bold:true}
tellraw @s [{translate:name.total_defence.display,"fallback":"Total Defence Amount : ",color:white,bold:true},{score:{name:"@s",objective:"temp_armor"},color:"#ade6ff",bold:true}]
tellraw @s [{translate:name.defence.lore,"fallback":"In this map, each point of toughness can be converted into three times the defense value, but the defense value converted from toughness cannot exceed the defense value provided by the armor itself. The following defense calculation results include the defense value, potion effects, and Protection enchantments, but exclude secondary enchantments.",color:"#a3e3ee"}]
tellraw @s [{translate:name.defence.hover_hint,color:gray}]
tellraw @p {"text":"",color:"blue",bold:true}
execute if score @s chat.armor.enhance matches ..99 run scoreboard players set @s chat.armor.enhance 100
scoreboard players operation @s stdTemp1 = @s chat.armor.enhance
scoreboard players operation @s stdTemp1 %= $100 math.times
scoreboard players operation @s stdTemp2 = @s chat.armor.enhance
scoreboard players operation @s stdTemp2 /= $100 math.times
tellraw @s [{text:"[-20%]",color:"#ff7676",bold:true,click_event:{action:"run_command",command:"/trigger menu.trigger set 22"}},{translate:name.defence.enhance.name,color:"#a2fff7",bold:true,with:[{score:{name:"@s",objective:stdTemp2},bold:true,color:"#3bff4b"},{score:{name:"@s",objective:stdTemp1},bold:true,color:"#3bff4b"}],hover_event:{action:"show_text",value:{translate:name.defence.enhance.lore,color:white,bold:true}}},{text:"[+20%]",color:"#3bff4b",bold:true,click_event:{action:"run_command",command:"/trigger menu.trigger set 23"}}]
tellraw @p {"text":"",color:"blue",bold:true}
execute as @s at @s run function core:inter_chat/melee_stats
tellraw @p {"text":"",color:"blue",bold:true}
execute as @s at @s run function core:inter_chat/range_stats
tellraw @p {"text":"",color:"blue",bold:true}
execute as @s at @s run function core:inter_chat/magic_stats
tellraw @p {"text":"",color:"blue",bold:true}
execute as @s at @s run function core:inter_chat/env_stats
tellraw @p {"text":"",color:"blue",bold:true}
tellraw @p {"text":"★========================★",color:"blue",bold:true}
scoreboard objectives remove temp_armor