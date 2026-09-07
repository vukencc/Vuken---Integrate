execute if entity @s[tag=no_pickup] run return 1
execute if items entity @s container.0 rotten_flesh run return 1
execute if items entity @s container.0 spider_eye run return 1
execute if items entity @s container.0 #pickup run return fail
execute unless data entity @s Item.components run return run tag @s add no_pickup