tellraw @a [{translate:rawtext.enter_game,color:white,bold:true,with:[[{text:"Reborn",color:"#8b93ff",bold:true}]]}]
execute as @a at @s run playsound map:entity.player.levelup_fix hostile @s ~ ~ ~

function core:class/ability/alchemist/load
function core:class/ability/scout/load
function core:class/ability/assassin/load
scoreboard players set $version config 12

execute if score $version_check config = $version config run return fail
function core:set
scoreboard players operation $version_check config = $version config
