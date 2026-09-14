tag @s remove scout.using
scoreboard players set @s scout.using 0
# Accept the old version:1 backup once, then leave a cheap active:false marker.
execute if items entity @s weapon.mainhand #minecraft:range if items entity @s weapon.mainhand *[custom_data~{core:{scout8:{active:1b}}}] run function core:class/ability/scout/8/disable_mainhand
execute if items entity @s weapon.mainhand #minecraft:range if items entity @s weapon.mainhand *[custom_data~{core:{scout8:{version:1b}}}] unless items entity @s weapon.mainhand *[custom_data~{core:{scout8:{active:0b}}}] run function core:class/ability/scout/8/disable_mainhand
# Short effect leases expire naturally, preserving stronger effects from other skills.
