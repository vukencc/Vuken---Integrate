$execute if score @s $(scb) matches 0 run return fail
$scoreboard players remove @s $(scb) $(value)
$execute if score @s $(scb) matches ..1 run scoreboard players set @s $(scb) 2