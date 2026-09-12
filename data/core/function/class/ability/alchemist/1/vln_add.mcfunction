execute unless items entity @s saddle *[enchantments~[{enchantments:"operation:stats/vulnerable"}]] if score @p[tag=TempPotOwner] alch.pas1 matches 1 run return run function operation:stats/vulnerable/init {duration:160,level:2}
execute unless items entity @s saddle *[enchantments~[{enchantments:"operation:stats/vulnerable"}]] if score @p[tag=TempPotOwner] alch.pas1 matches 2 run return run function operation:stats/vulnerable/init {duration:160,level:3}

execute if entity @s[tag=alch.1.buffed] run return fail

execute store result score @s stdTemp1 run data get entity @s equipment.saddle.components."minecraft:enchantments"."operation:stats/vulnerable"
scoreboard players add @s stdTemp1 2
execute if score @p[tag=TempPotOwner] alch.pas1 matches 2 run scoreboard players add @s stdTemp1 1
execute store result entity @s equipment.saddle.components."minecraft:enchantments"."operation:stats/vulnerable" int 1 run scoreboard players get @s stdTemp1

tag @s add alch.1.buffed