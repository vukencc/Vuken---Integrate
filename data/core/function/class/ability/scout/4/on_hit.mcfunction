# As the struck enemy. The natural arrow owner is tagged by effects_transform_pre.
execute on passengers if entity @s[type=marker,tag=scout.mark,scores={scout.used=0,scout.life=1..}] run function core:class/ability/scout/4/bonus with entity @s data.scout
