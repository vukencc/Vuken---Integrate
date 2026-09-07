tellraw @a [{translate:rawtext.enter_game,color:white,bold:true,with:[[{text:"Reborn",color:"#8b93ff",bold:true}]]}]
execute as @a at @s run playsound map:entity.player.levelup_fix hostile @s ~ ~ ~

scoreboard players set $version config 12

execute if score $version_check config = $version config run return fail
function core:set
scoreboard players operation $version_check config = $version config
