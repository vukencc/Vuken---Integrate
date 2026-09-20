# One combined hit prevents callbacks from losing the supplemental hit. Keep millipoint precision.
execute if entity @p[tag=DamageOwner,scores={assassin.pas3=1}] store result storage core:assassin_8 custom.value double 0.00135 run data get storage core:assassin_8 custom.value 1000
execute if entity @p[tag=DamageOwner,scores={assassin.pas3=2}] store result storage core:assassin_8 custom.value double 0.0016 run data get storage core:assassin_8 custom.value 1000
