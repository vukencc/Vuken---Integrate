execute if score @s melee.sswap matches 0 run return fail

scoreboard players add @s warrior.rage_req 1
execute if score @s melee.sswap matches 1 if score @s warrior.rage_req matches ..1 run return fail

tag @s add warrior_rage_apply

scoreboard players set @s warrior.rage_req 0
scoreboard players add @s warrior.rage 1
execute if score @s melee.sswap matches 1 if score @s warrior.rage matches 9.. run scoreboard players set @s warrior.rage 8
execute if score @s melee.sswap matches 2 if score @s warrior.rage matches 13.. run scoreboard players set @s warrior.rage 12

execute if score @s melee.sswap matches 1 if score @s warrior.rage matches 1 run title @s actionbar [{text:"✦✧✧✧✧✧✧✧",color:gold,bold:true}]
execute if score @s melee.sswap matches 1 if score @s warrior.rage matches 2 run title @s actionbar [{text:"✦✦✧✧✧✧✧✧",color:gold,bold:true}]
execute if score @s melee.sswap matches 1 if score @s warrior.rage matches 3 run title @s actionbar [{text:"✦✦✦✧✧✧✧✧",color:gold,bold:true}]
execute if score @s melee.sswap matches 1 if score @s warrior.rage matches 4 run title @s actionbar [{text:"✦✦✦✦✧✧✧✧",color:gold,bold:true}]
execute if score @s melee.sswap matches 1 if score @s warrior.rage matches 5 run title @s actionbar [{text:"✦✦✦✦✦✧✧✧",color:gold,bold:true}]
execute if score @s melee.sswap matches 1 if score @s warrior.rage matches 6 run title @s actionbar [{text:"✦✦✦✦✦✦✧✧",color:gold,bold:true}]
execute if score @s melee.sswap matches 1 if score @s warrior.rage matches 7 run title @s actionbar [{text:"✦✦✦✦✦✦✦✧",color:gold,bold:true}]
execute if score @s melee.sswap matches 1 if score @s warrior.rage matches 8 run title @s actionbar [{text:"✦✦✦✦✦✦✦✦",color:gold,bold:true}]

execute if score @s melee.sswap matches 2 if score @s warrior.rage matches 1 run title @s actionbar [{text:"✦✧✧✧✧✧✧✧✧✧✧✧",color:gold,bold:true}]
execute if score @s melee.sswap matches 2 if score @s warrior.rage matches 2 run title @s actionbar [{text:"✦✦✧✧✧✧✧✧✧✧✧✧",color:gold,bold:true}]
execute if score @s melee.sswap matches 2 if score @s warrior.rage matches 3 run title @s actionbar [{text:"✦✦✦✧✧✧✧✧✧✧✧✧",color:gold,bold:true}]
execute if score @s melee.sswap matches 2 if score @s warrior.rage matches 4 run title @s actionbar [{text:"✦✦✦✦✧✧✧✧✧✧✧✧",color:gold,bold:true}]
execute if score @s melee.sswap matches 2 if score @s warrior.rage matches 5 run title @s actionbar [{text:"✦✦✦✦✦✧✧✧✧✧✧✧",color:gold,bold:true}]
execute if score @s melee.sswap matches 2 if score @s warrior.rage matches 6 run title @s actionbar [{text:"✦✦✦✦✦✦✧✧✧✧✧✧",color:gold,bold:true}]
execute if score @s melee.sswap matches 2 if score @s warrior.rage matches 7 run title @s actionbar [{text:"✦✦✦✦✦✦✦✧✧✧✧✧",color:gold,bold:true}]
execute if score @s melee.sswap matches 2 if score @s warrior.rage matches 8 run title @s actionbar [{text:"✦✦✦✦✦✦✦✦✧✧✧✧",color:gold,bold:true}]
execute if score @s melee.sswap matches 2 if score @s warrior.rage matches 9 run title @s actionbar [{text:"✦✦✦✦✦✦✦✦✦✧✧✧",color:gold,bold:true}]
execute if score @s melee.sswap matches 2 if score @s warrior.rage matches 10 run title @s actionbar [{text:"✦✦✦✦✦✦✦✦✦✦✧✧",color:gold,bold:true}]
execute if score @s melee.sswap matches 2 if score @s warrior.rage matches 11 run title @s actionbar [{text:"✦✦✦✦✦✦✦✦✦✦✦✧",color:gold,bold:true}]
execute if score @s melee.sswap matches 2 if score @s warrior.rage matches 12 run title @s actionbar [{text:"✦✦✦✦✦✦✦✦✦✦✦✦",color:gold,bold:true}]

attribute @s movement_speed modifier remove warrior_rage_spd
execute store result storage temp temp double 0.03 run scoreboard players get @s warrior.rage
function core:class/ability/warrior/7/speed with storage temp
