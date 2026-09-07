scoreboard players operation @s temp_forge_count -= @s resin_clump_cost

execute unless items entity @n[tag=forge_show] contents *[lore] run data merge entity @n[type=item_display,tag=forge_show] {item:{components:{"minecraft:lore":[]}}}
execute unless items entity @n[tag=forge_show] contents *[custom_data] run data merge entity @n[type=item_display,tag=forge_show] {item:{components:{"minecraft:custom_data":{}}}}

# execute unless data entity @n[tag=forge_show] item.components."minecraft:lore".[0].extra run data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:lore".[0].extra set value [{text:" [☆] ",color:"#a7a7a7",italic:false},{text:"[☆] ",color:"#a7a7a7",italic:false},{text:"[☆] ",color:"#a7a7a7",italic:false}]
execute unless data entity @n[tag=forge_show] item.components."minecraft:lore".[0].extra run data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:lore".[0].extra set value [{text:" [☆] ",color:"#a7a7a7",italic:false},{text:"[☆] ",color:"#a7a7a7",italic:false}]

data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:custom_data" merge from entity @n[type=item_display,tag=af_forge_show] item.components."minecraft:custom_data"
data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:custom_data" merge from entity @n[type=item_display,tag=pf_forge_show] item.components."minecraft:custom_data"
#data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:custom_data" merge from entity @n[type=item_display,tag=uf_forge_show] item.components."minecraft:custom_data"

data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:enchantments" merge from entity @n[type=item_display,tag=af_forge_show] item.components."minecraft:enchantments"
data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:enchantments" merge from entity @n[type=item_display,tag=pf_forge_show] item.components."minecraft:enchantments"
#data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:enchantments" merge from entity @n[type=item_display,tag=uf_forge_show] item.components."minecraft:enchantments"

execute as @n[tag=forge_show] if items entity @s contents *[custom_data~{PassiveSlot:1}] unless items entity @s contents *[custom_data~{PassiveSlotDisplay:1}] run function core:forge/trigger/pf_ench_info_display

###
    # scoreboard players set @p stdTemp1 0
    #     execute if items entity @n[type=item_display,tag=forge_show] container.0 *[custom_data~{ActiveSlot:1}] store result score @p stdTemp1 run data get entity @n[type=item_display,tag=af_forge_show] item.components."minecraft:custom_data".level
    #     execute if score @p stdTemp1 matches 1 run data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:lore".[0].extra.[0] set value {text:" [★] ",color:white,italic:false}
    #     execute if score @p stdTemp1 matches 2 run data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:lore".[0].extra.[0] set value {text:" [★] ",color:green,italic:false}
    #     execute if score @p stdTemp1 matches 3 run data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:lore".[0].extra.[0] set value {text:" [★] ",color:blue,italic:false}
    #     execute if score @p stdTemp1 matches 4 run data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:lore".[0].extra.[0] set value {text:" [★] ",color:gold,italic:false}
    #     execute if score @p stdTemp1 matches 5 run data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:lore".[0].extra.[0] set value {text:" [★] ",color:aqua,italic:false}

###
    # scoreboard players set @p stdTemp1 0
    #     execute if items entity @n[type=item_display,tag=forge_show] container.0 *[custom_data~{PassiveSlot:1}] store result score @p stdTemp1 run data get entity @n[type=item_display,tag=pf_forge_show] item.components."minecraft:custom_data".level
    #     execute if score @p stdTemp1 matches 1 run data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:lore".[0].extra.[1] set value {text:"[★] ",color:white,italic:false}
    #     execute if score @p stdTemp1 matches 2 run data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:lore".[0].extra.[1] set value {text:"[★] ",color:green,italic:false}
    #     execute if score @p stdTemp1 matches 3 run data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:lore".[0].extra.[1] set value {text:"[★] ",color:blue,italic:false}
    #     execute if score @p stdTemp1 matches 4 run data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:lore".[0].extra.[1] set value {text:"[★] ",color:gold,italic:false}
    #     execute if score @p stdTemp1 matches 5 run data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:lore".[0].extra.[1] set value {text:"[★] ",color:aqua,italic:false}

###
    # scoreboard players set @p stdTemp1 0
    #     execute if items entity @n[type=item_display,tag=forge_show] container.0 *[custom_data~{UpgradeSlot:1}] store result score @p stdTemp1 run data get entity @n[type=item_display,tag=uf_forge_show] item.components."minecraft:custom_data".level
    #     execute if score @p stdTemp1 matches 1 run data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:lore".[0].extra.[2] set value {text:"[★] ",color:white,italic:false}
    #     execute if score @p stdTemp1 matches 2 run data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:lore".[0].extra.[2] set value {text:"[★] ",color:green,italic:false}
    #     execute if score @p stdTemp1 matches 3 run data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:lore".[0].extra.[2] set value {text:"[★] ",color:blue,italic:false}
    #     execute if score @p stdTemp1 matches 4 run data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:lore".[0].extra.[2] set value {text:"[★] ",color:gold,italic:false}
    #     execute if score @p stdTemp1 matches 5 run data modify entity @n[type=item_display,tag=forge_show] item.components."minecraft:lore".[0].extra.[2] set value {text:"[★] ",color:aqua,italic:false}
function core:forge/trigger/return_forge_af
function core:forge/trigger/return_forge_pf

kill @n[type=item_display,tag=af_forge_show]
kill @n[type=item_display,tag=pf_forge_show]

kill @n[tag=clump_cost_display_txt]

# function core:forge/trigger/return_forge_uf

kill @n[tag=af_Forge]
kill @n[tag=pf_Forge]
kill @n[tag=uf_Forge]

execute at @n[tag=Forge] run particle enchant ~ ~0.5 ~ 1.2 1.2 1.2 0.25 110 normal
playsound block.enchantment_table.use hostile @s ~ ~ ~

team join purple @n[type=item_display,tag=forge_show]

scoreboard players set @s resin_clump_cost 0