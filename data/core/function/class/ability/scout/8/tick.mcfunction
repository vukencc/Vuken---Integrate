execute unless score @s scout.pas3 matches 1..2 run return run function core:class/ability/scout/8/clear
execute if score @s scout.pas3 matches 1 run effect give @s haste 1 0 true
execute if score @s scout.pas3 matches 2 run effect give @s haste 1 1 true
scoreboard players remove @s[scores={scout.using=1..}] scout.using 1
execute unless score @s scout.using matches 1.. if entity @s[tag=scout.using] run function core:class/ability/scout/8/clear
