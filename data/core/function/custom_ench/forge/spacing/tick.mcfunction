execute unless items entity @s armor.* *[enchantments~[{enchantments:"core:forge/pf/soft_pacing"}]] unless items entity @s weapon.offhand *[enchantments~[{enchantments:"core:forge/pf/soft_pacing"}]] unless items entity @s weapon.mainhand *[enchantments~[{enchantments:"core:forge/pf/soft_pacing"}]] if entity @s[tag=EnchSPacingBuff] run return run function core:custom_ench/forge/spacing/clear

execute store result score @s ench.spacing.speed1 run attribute @s movement_speed get 1000
execute unless score @s ench.spacing.speed1 = @s ench.spacing.speed2 run function core:custom_ench/forge/spacing/cal
execute store result score @s ench.spacing.speed2 run attribute @s movement_speed get 1000