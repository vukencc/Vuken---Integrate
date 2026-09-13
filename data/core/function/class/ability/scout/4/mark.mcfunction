execute on passengers if entity @s[tag=scout.mark] run function core:class/ability/scout/4/replace with storage core:scout shot
effect give @s glowing 10 0 true
function operation:stats/vulnerable/init {level:2,duration:200}
data modify storage core:scout shot.target set from entity @s UUID
execute summon marker run function core:class/ability/scout/4/marker
