execute unless score @s mage.1.charges matches 1.. run return fail

scoreboard players remove @s mage.1.charges 1
execute if score @s wand.lc matches 1 if score @s mage.1.charges matches 0 store result score @s wand.lc.cd run function core:custom_ench/aptitude/cal {time:80}
execute if score @s wand.lc matches 2 if score @s mage.1.charges matches 0 store result score @s wand.lc.cd run function core:custom_ench/aptitude/cal {time:60}

execute if score @s mage.1.charges matches 0 run tag @s remove mage.1.applied.0
execute if score @s mage.1.charges matches 0 run tag @s remove mage.1.applied.2
execute if score @s mage.1.charges matches 0 run tag @s remove mage.1.applied.1

execute if score @s wand.lc matches 1 if score @s mage.1.charges matches 0 run title @s actionbar [{translate:class.mage.ability1.name.text,color:"#00ffcc",bold:true},{text:" -✧-",color:aqua,bold:true}]
execute if score @s wand.lc matches 2 if score @s mage.1.charges matches 0 run title @s actionbar [{translate:class.mage.ability1.name.text,color:"#00ffcc",bold:true},{text:" -✧- -✧-",color:aqua,bold:true}]
execute if score @s wand.lc matches 2 if score @s mage.1.charges matches 1 run title @s actionbar [{translate:class.mage.ability1.name.text,color:"#00ffcc",bold:true},{text:" -✦- -✧-",color:aqua,bold:true}]

execute positioned ~ ~1.3 ~ positioned ^ ^ ^0 positioned ~-0.5 ~-0.5 ~-0.5 as @e[type=!#bypass,dx=0.1,dy=0.1,dz=0.1] run tag @s add tempMagicRayMarked
execute positioned ~ ~1.3 ~ positioned ^ ^ ^1 positioned ~-0.5 ~-0.5 ~-0.5 as @e[type=!#bypass,dx=0.1,dy=0.1,dz=0.1] run tag @s add tempMagicRayMarked
execute positioned ~ ~1.3 ~ positioned ^ ^ ^2 positioned ~-0.5 ~-0.5 ~-0.5 as @e[type=!#bypass,dx=0.1,dy=0.1,dz=0.1] run tag @s add tempMagicRayMarked
execute positioned ~ ~1.3 ~ positioned ^ ^ ^3 positioned ~-0.5 ~-0.5 ~-0.5 as @e[type=!#bypass,dx=0.1,dy=0.1,dz=0.1] run tag @s add tempMagicRayMarked
execute positioned ~ ~1.3 ~ positioned ^ ^ ^4 positioned ~-0.5 ~-0.5 ~-0.5 as @e[type=!#bypass,dx=0.1,dy=0.1,dz=0.1] run tag @s add tempMagicRayMarked
execute positioned ~ ~1.3 ~ positioned ^ ^ ^5 positioned ~-0.5 ~-0.5 ~-0.5 as @e[type=!#bypass,dx=0.1,dy=0.1,dz=0.1] run tag @s add tempMagicRayMarked
execute positioned ~ ~1.3 ~ positioned ^ ^ ^6 positioned ~-0.5 ~-0.5 ~-0.5 as @e[type=!#bypass,dx=0.1,dy=0.1,dz=0.1] run tag @s add tempMagicRayMarked
execute positioned ~ ~1.3 ~ positioned ^ ^ ^7 positioned ~-0.5 ~-0.5 ~-0.5 as @e[type=!#bypass,dx=0.1,dy=0.1,dz=0.1] run tag @s add tempMagicRayMarked

tag @s add DamageOwner
execute store result storage input value double 1.0 run function core:damage/magic/get {value:7}
execute as @e[type=!#bypass,tag=tempMagicRayMarked] run scoreboard players add @s mage.8.count 1
execute as @e[type=!#bypass,tag=tempMagicRayMarked] run scoreboard players add @s mage.8.count.2 1
execute as @e[type=!#bypass,tag=tempMagicRayMarked] run function core:damage/magic/do with storage input
tag @s remove DamageOwner

tag @e remove tempMagicRayMarked

function core:class/ability/mage/7/push {id:1}

scoreboard players set @s stdTemp1 7
execute positioned ~ ~1.3 ~ run function core:class/ability/mage/1/particle
playsound minecraft:entity.firework_rocket.launch hostile @s ~ ~ ~ 1 2 1