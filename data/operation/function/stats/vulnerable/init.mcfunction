$scoreboard players set @s stdTemp1 $(level)
execute if items entity @s saddle *[enchantments~[{enchantments:"operation:stats/vulnerable",levels:{min:1}}]] unless function operation:stats/vulnerable/compare run return fail
function operation:stats/basic
#Each level of vulnerable makes enemies take 10% more damage
execute unless items entity @s saddle *[enchantments~[{enchantments:"operation:stats/vulnerable",levels:{min:1}}]] store result score @s health.B run data get entity @s Health 10
$scoreboard players set @s stats.vulnerable.duration $(duration)
$item modify entity @s saddle [{function:"set_enchantments",enchantments:{"operation:stats/vulnerable":$(level)}}]