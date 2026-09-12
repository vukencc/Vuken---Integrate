# Potion effects have already been applied. Snapshot survives nested damage callbacks.
function core:class/ability/alchemist/pot/hit with entity @s data.alch
execute if data entity @s data.alch{pool:1} run function core:class/ability/alchemist/6/spawn
execute if data entity @s data.alch{pool:2} run function core:class/ability/alchemist/6/spawn
