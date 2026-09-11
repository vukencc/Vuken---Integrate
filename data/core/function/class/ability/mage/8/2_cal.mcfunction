execute unless score @s class matches 2 run return fail
execute if score @s mage.pas1 matches ..1 run return fail
execute store result score @s stdTemp1 run function core:damage/magic/get {value:10}
scoreboard players operation $temp stdTemp1 += @s stdTemp1