tag @s add tempItemFetcher
execute at @s positioned ~ ~1 ~ positioned ^ ^ ^2.3 as @e[type=interaction,tag=item_fetcher,distance=..5] run function operation:tool/item_fetcher/give
execute as @s at @s run playsound map:entity.player.levelup_fix hostile @s ~ ~ ~
advancement revoke @s only operation:trigger/item_fetch
advancement revoke @s only operation:trigger/item_fetch_2