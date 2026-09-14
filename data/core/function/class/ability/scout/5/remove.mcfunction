function core:class/ability/scout/5/clear_anger with entity @s data.scout
tag @s remove scout.decoy
function core:class/ability/scout/5/cooldown with entity @s data.scout
tp @s ~ ~-100 ~
kill @s
