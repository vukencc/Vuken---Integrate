$execute as @e[type=!#minecraft:bypass] if predicate {condition:entity_properties,entity:"this",predicate:{distance:{horizontal:{max:$(radius)},y:{max:$(radius)}}}} run tag @s add tmp
$tag @p[scores={marker=$(id)}] add TempPotOwner

$execute as @p[tag=TempPotOwner] run function operation:trigger/pot/before_effect {damage:$(damage)}
$execute if entity @s[tag=from_sneaking] as @p[tag=TempPotOwner] run function operation:trigger/pot/if_sneak_before_effect {damage:$(damage)}

execute if data entity @s data.effects.slowness run function core:trigger/basic/arcane_pot/slowness with entity @s data.effects.slowness
execute if data entity @s data.effects.weakness run function core:trigger/basic/arcane_pot/weakness with entity @s data.effects.weakness
execute if data entity @s data.effects.blinded run function core:trigger/basic/arcane_pot/blinded with entity @s data.effects.blinded
execute if data entity @s data.effects.burning run function core:trigger/basic/arcane_pot/burning with entity @s data.effects.burning
execute if data entity @s data.effects.wither run function core:trigger/basic/arcane_pot/wither with entity @s data.effects.wither
execute if data entity @s data.effects.poison run function core:trigger/basic/arcane_pot/poison with entity @s data.effects.poison
execute if data entity @s data.effects.bleed run function core:trigger/basic/arcane_pot/bleed with entity @s data.effects.bleed
execute if data entity @s data.effects.frozen run function core:trigger/basic/arcane_pot/frozen with entity @s data.effects.frozen
execute if data entity @s data.effects.vulnerable run function core:trigger/basic/arcane_pot/vulnerable with entity @s data.effects.vulnerable
$execute as @e[type=!#bypass,tag=tmp] run damage @s $(damage) core:custom_magic by @p[tag=TempPotOwner]
$function core:trigger/basic/arcane_pot/tag {id:$(id)}

$execute as @p[tag=TempPotOwner] run function operation:trigger/pot/after_effect {damage:$(damage)}
$execute if entity @s[tag=from_sneaking] as @p[tag=TempPotOwner] run function operation:trigger/pot/if_sneak_after_effect {damage:$(damage)}

tag @e[type=!#bypass] remove tmp

kill @s

tag @a remove TempPotOwner