execute unless items entity @s armor.feet * run data merge entity @s {equipment:{feet:{id:stone,count:1,components:{enchantments:{"core:class/war/2":1}}}}}
item modify entity @s armor.feet {function:set_enchantments,enchantments:{"core:class/war/2":1}}

particle dust{color:10354688,scale:1.1} ~ ~1 ~ 0 2 0 0 15 normal