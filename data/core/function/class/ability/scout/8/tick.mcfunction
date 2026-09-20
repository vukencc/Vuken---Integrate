execute unless score @s class matches 4 run return run function core:class/ability/scout/8/clear
execute unless score @s scout.pas3 matches 1..2 run return run function core:class/ability/scout/8/clear

execute if score @s scout.pas3 matches 1 unless predicate {condition:entity_properties,entity:"this",predicate:{effects:{haste:{}}}} run effect give @s haste 1 0 true
execute if score @s scout.pas3 matches 2 unless predicate {condition:entity_properties,entity:"this",predicate:{effects:{haste:{amplifier:{min:1}}}}} run effect give @s haste 1 1 true

# Only the held bow/crossbow is inspected.  Items in inventory, the offhand, and
# dropped items are updated lazily when they next become the main-hand item.
execute if items entity @s weapon.mainhand #minecraft:range unless items entity @s weapon.mainhand *[custom_data~{core:{scout8:{active:1b}}}] run function core:class/ability/scout/8/enable_mainhand
scoreboard players remove @s[scores={scout.using=1..}] scout.using 1
execute unless score @s scout.using matches 1.. run tag @s remove scout.using
