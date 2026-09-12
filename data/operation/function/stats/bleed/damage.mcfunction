$execute store success score @s alch.2.hit run damage @s $(temp) core:custom_magic
particle block{block_state:{Name:redstone_block,Properties:{}}} ~ ~1 ~ 0.6 0.2 0.6 0.1 10 normal
playsound block.anvil.break hostile @a ~ ~ ~ 3
function core:class/ability/alchemist/2/on_magic_hit
