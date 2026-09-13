# stdTemp1 is the shared ranged damage accumulator. Apply once per damage snapshot.
execute unless score @s class matches 4 run return fail
execute if entity @s[nbt={OnGround:1b}] run return fail
execute unless score @s scout.pas3 matches 1..2 run return fail
scoreboard players set @s scout.air.mult 115
execute if score @s scout.pas3 matches 2 run scoreboard players set @s scout.air.mult 125
scoreboard players operation @s stdTemp1 *= @s scout.air.mult
scoreboard players operation @s stdTemp1 /= $100 math.times
