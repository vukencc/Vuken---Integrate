execute positioned ^ ^ ^0.2 run particle dust_color_transition{from_color:2730751,to_color:13379071,scale:1} ~ ~ ~ 0 0 0 1 0 normal
execute positioned ^ ^ ^0.4 run particle dust_color_transition{from_color:2730751,to_color:13379071,scale:1} ~ ~ ~ 0 0 0 1 0 normal
execute positioned ^ ^ ^0.6 run particle dust_color_transition{from_color:2730751,to_color:13379071,scale:1} ~ ~ ~ 0 0 0 1 0 normal
execute positioned ^ ^ ^0.8 run particle dust_color_transition{from_color:2730751,to_color:13379071,scale:1} ~ ~ ~ 0 0 0 1 0 normal
execute positioned ^ ^ ^1.0 run particle dust_color_transition{from_color:2730751,to_color:13379071,scale:1} ~ ~ ~ 0 0 0 1 0 normal
scoreboard players remove @s stdTemp1 1
execute if score @s stdTemp1 matches 1.. positioned ^ ^ ^1.0 run function core:class/ability/mage/1/particle