$execute if entity @s[tag=shattered_crystal] run function core:trigger/basic/arcane_pot/list/shattered_crystal/check {id:$(id)}
$execute if entity @s[tag=shattered_crystal_ex] run function core:trigger/basic/arcane_pot/list/shattered_crystal_ex/check {id:$(id)}
$execute if entity @s[tag=gravity_core] run function core:trigger/basic/arcane_pot/list/gravity_core/pull_start {id:$(id)}
$execute if entity @s[tag=wild] run function core:trigger/basic/arcane_pot/list/wild/check {id:$(id)}
$execute if entity @s[tag=kanade] run function core:trigger/basic/arcane_pot/list/kanade/check {id:$(id)}