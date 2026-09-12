tag @s add t_limited_with
rotate @s ~ ~
$summon armor_stand ~ ~ ~ {NoGravity:1b,Marker:1b,Invisible:1b,Invulnerable:1b,data:{damage:$(damage),radius:$(radius),color:$(color),id:0,effects:{},stats:{timing_limited:100}},equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"core:inter/pot_as_trigger":1,"operation:stats/t_limited_1":1,"operation:stats/pas_only":1}}}},Tags:["pot_as","core.pot.new"]}
data modify entity @s Item set from storage core:alchemist pot_item
ride @n[type=armor_stand,tag=core.pot.new] mount @s
execute on passengers run tag @s remove core.pot.new
$function operation:motion/set_forward/init {speed:$(speed)}
data modify entity @s Motion set from storage motion set_forward
execute on passengers run data modify entity @s data.id set from storage core:alchemist pot_id
execute on passengers run data modify entity @s Tags append from storage core:alchemist pot_tag
execute on passengers run data modify entity @s data.effects set from storage core:alchemist pot_effects

execute if data storage core:alchemist {pot_scatter:1} on passengers run tag @s add alch.2.pot

execute if data storage core:alchemist {pot_sneak:1} on passengers run tag @s add from_sneaking
function core:class/ability/alchemist/pot/attach
