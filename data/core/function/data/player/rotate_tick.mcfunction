execute if entity @s[gamemode=spectator] run return fail
### This function ticks with:
### Self-rotated Facing
### Player Position
### Executed as Player
execute if score @s warrior.contract matches ..0 run function core:class/ability/warrior/3/tick