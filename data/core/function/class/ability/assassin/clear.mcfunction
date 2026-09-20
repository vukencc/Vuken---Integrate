scoreboard players set @s assassin.7.count 0
scoreboard players set @s assassin.7.step 0
scoreboard players set @s assassin.rc.duration 1
scoreboard players set @s assassin.3.duration 1
function core:class/ability/assassin/8/clear
function vfam:remove {target:"@s",id:assassin_1}
function vfam:remove {target:"@s",id:assassin_5_dmg}
function vfam:remove {target:"@s",id:assassin_5_spd}
tag @s remove assassin.active
tag @s remove assassin.moon.busy
tag @s remove assassin.skill.damage
