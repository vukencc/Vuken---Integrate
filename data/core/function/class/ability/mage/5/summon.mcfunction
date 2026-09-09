# Called as the caster, at their feet, with their facing.
execute unless score @s class matches 2 run return fail
execute unless score @s wand.slc matches 1.. run return fail
execute if score @s wand.slc.cd matches 1.. run return fail
execute store result score @s wand.slc.cd run function core:custom_ench/aptitude/cal {time:240}

# Snapshot before spawning: neither nearby players nor later equipment changes
# may replace this cast's owner, damage or level. Preserve fractional damage.
data modify storage core:mage_5 cast set value {value:3.0,lifetime:100}
execute if score @s wand.slc matches 2 run data modify storage core:mage_5 cast merge value {lifetime:160}
execute store result storage core:mage_5 cast.owner int 1 run scoreboard players get @s marker
function core:damage/magic/get {value:3}
data modify storage core:mage_5 cast.value set from storage magic_get_return value

execute if score @s wand.slc matches 1 positioned ^ ^ ^1 run summon snowball ~ ~1.3 ~ {Item:{id:"crying_obsidian",count:1},Tags:["mage.5.projectile","mage.5.new","t_limited_with"],Passengers:[{id:armor_stand,Tags:["mage.5","mage.5.1"],data:{stats:{timing_limited:70}},NoGravity:1b,Invulnerable:1b,Invisible:1b,Silent:1b,attributes:[{base:0.01,id:scale}],equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"core:class/mage/5":1,"operation:stats/t_limited_1":1}}}}}],NoGravity:true,Silent:1b}
execute if score @s wand.slc matches 2 positioned ^ ^ ^1 run summon snowball ~ ~1.3 ~ {Item:{id:"crying_obsidian",count:1},Tags:["mage.5.projectile","mage.5.new","t_limited_with"],Passengers:[{id:armor_stand,Tags:["mage.5","mage.5.2"],data:{stats:{timing_limited:70}},NoGravity:1b,Invulnerable:1b,Invisible:1b,Silent:1b,attributes:[{base:0.01,id:scale}],equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"core:class/mage/5":1,"operation:stats/t_limited_1":1}}}}}],NoGravity:true,Silent:1b}
execute positioned ^ ^ ^1 as @n[type=snowball,tag=mage.5.new] run function core:class/ability/mage/5/set

data remove storage core:mage_5 cast

playsound entity.ender_dragon.shoot hostile @s ~ ~ ~ 1 1.5 1

function core:class/ability/mage/7/push {id:5}