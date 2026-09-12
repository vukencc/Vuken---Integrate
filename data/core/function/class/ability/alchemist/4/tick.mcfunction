scoreboard players remove @s alch.garden.next 1
execute if score @s alch.garden.next matches ..0 run function core:class/ability/alchemist/4/apply
scoreboard players remove @s alch.garden 1
execute if score @s alch.garden matches ..0 run function core:class/ability/alchemist/4/end
