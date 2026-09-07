execute unless entity @s[tag=EnchUnrealBuff] run return fail
execute if score @s ench.unreal.interval matches 1 run effect give @s luck 2 1 true
execute if score @s ench.unreal.interval matches 2 run effect give @s luck 2 2 true
execute if score @s ench.unreal.interval matches 3.. run effect give @s luck 2 3 true