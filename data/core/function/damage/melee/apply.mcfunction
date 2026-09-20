$execute if entity @p[tag=tempApply,scores={class=5,assassin.pas3=1..2}] run return run function core:class/ability/assassin/8/apply_tracking {BaseTaken:$(BaseTaken)}
$damage @s $(BaseTaken) core:custom_melee by @p[tag=tempApply]
function operation:event/enemy/take_damage/melee
