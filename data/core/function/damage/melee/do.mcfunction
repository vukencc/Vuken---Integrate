$damage @s $(value) core:custom_melee by @p[tag=DamageOwner]

### For this map only:
### to be removed

execute as @p[tag=DamageOwner] unless score @s class matches 5 run return fail
execute as @p[tag=DamageOwner] unless score @s assassin.pas3 matches 1.. run return fail

execute store result score @s assassin.8.facing run data get entity @s Rotation[0] 100
execute at @s facing entity @p[tag=DamageOwner] feet summon marker run function core:class/ability/assassin/8/bearing
scoreboard players operation @s assassin.8.facing -= $assassin.bearing assassin.8.facing
scoreboard players operation @s assassin.8.facing %= $36000 assassin.8.facing
execute if score @s assassin.8.facing matches 18001.. run scoreboard players remove @s assassin.8.facing 36000
execute if score @s assassin.8.facing matches ..-18001 run scoreboard players add @s assassin.8.facing 36000
execute unless score @s assassin.8.facing matches 9001.. unless score @s assassin.8.facing matches ..-9001 run return fail

$data modify storage core:assassin_8 custom.value set value $(value)
execute if entity @p[tag=DamageOwner,scores={assassin.pas3=1}] store result storage core:assassin_8 custom.value double 0.035 run data get storage core:assassin_8 custom.value 10
execute if entity @p[tag=DamageOwner,scores={assassin.pas3=2}] store result storage core:assassin_8 custom.value double 0.06 run data get storage core:assassin_8 custom.value 10
function core:class/ability/assassin/8/ex_do with storage core:assassin_8 custom

### End