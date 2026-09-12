attribute @s movement_efficiency modifier remove core:alch_elixir
attribute @s movement_speed modifier remove core:alch_elixir_spd
$attribute @s movement_efficiency modifier add core:alch_elixir $(value) add_multiplied_total
attribute @s movement_speed modifier add core:alch_elixir_spd 0.15 add_multiplied_total
tag @s add alch.elixir
