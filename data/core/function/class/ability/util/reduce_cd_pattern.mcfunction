# scb is the skill objective; its remaining cooldown is stored in <scb>.cd.
$execute unless score @s $(scb) matches 1.. run return fail
# Leave ready, missing and already-finishing cooldowns unchanged.
$execute unless score @s $(scb).cd matches 3.. run return fail
$scoreboard players remove @s $(scb).cd $(value)
# The normal cooldown tick handles the 2 -> 1 notification and 1 -> 0 completion.
$execute if score @s $(scb).cd matches ..1 run scoreboard players set @s $(scb).cd 2
