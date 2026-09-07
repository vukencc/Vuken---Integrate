execute unless items entity @s armor.* *[enchantments~[{enchantments:"core:forge/pf/block"}]] unless items entity @s weapon.offhand *[enchantments~[{enchantments:"core:forge/pf/block"}]] run return fail

scoreboard players add @s ench.block.timer 1
execute if score @s ench.block.timer >= @s ench.block.interval at @s run function core:custom_ench/forge/block/apply
