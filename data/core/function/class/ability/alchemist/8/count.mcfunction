scoreboard players set @s alch.debuffs 0
scoreboard players set @s alch.strong 0
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{slowness:{}}}} run scoreboard players add @s alch.debuffs 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{slowness:{amplifier:{min:1}}}}} run scoreboard players add @s alch.strong 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{mining_fatigue:{}}}} run scoreboard players add @s alch.debuffs 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{mining_fatigue:{amplifier:{min:1}}}}} run scoreboard players add @s alch.strong 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{nausea:{}}}} run scoreboard players add @s alch.debuffs 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{nausea:{amplifier:{min:1}}}}} run scoreboard players add @s alch.strong 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{blindness:{}}}} run scoreboard players add @s alch.debuffs 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{blindness:{amplifier:{min:1}}}}} run scoreboard players add @s alch.strong 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{hunger:{}}}} run scoreboard players add @s alch.debuffs 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{hunger:{amplifier:{min:1}}}}} run scoreboard players add @s alch.strong 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{weakness:{}}}} run scoreboard players add @s alch.debuffs 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{weakness:{amplifier:{min:1}}}}} run scoreboard players add @s alch.strong 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{poison:{}}}} run scoreboard players add @s alch.debuffs 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{poison:{amplifier:{min:1}}}}} run scoreboard players add @s alch.strong 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{wither:{}}}} run scoreboard players add @s alch.debuffs 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{wither:{amplifier:{min:1}}}}} run scoreboard players add @s alch.strong 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{levitation:{}}}} run scoreboard players add @s alch.debuffs 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{levitation:{amplifier:{min:1}}}}} run scoreboard players add @s alch.strong 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{unluck:{}}}} run scoreboard players add @s alch.debuffs 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{unluck:{amplifier:{min:1}}}}} run scoreboard players add @s alch.strong 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{darkness:{}}}} run scoreboard players add @s alch.debuffs 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{darkness:{amplifier:{min:1}}}}} run scoreboard players add @s alch.strong 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{infested:{}}}} run scoreboard players add @s alch.debuffs 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{infested:{amplifier:{min:1}}}}} run scoreboard players add @s alch.strong 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{oozing:{}}}} run scoreboard players add @s alch.debuffs 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{oozing:{amplifier:{min:1}}}}} run scoreboard players add @s alch.strong 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{weaving:{}}}} run scoreboard players add @s alch.debuffs 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{weaving:{amplifier:{min:1}}}}} run scoreboard players add @s alch.strong 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{wind_charged:{}}}} run scoreboard players add @s alch.debuffs 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{wind_charged:{amplifier:{min:1}}}}} run scoreboard players add @s alch.strong 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{bad_omen:{}}}} run scoreboard players add @s alch.debuffs 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{bad_omen:{amplifier:{min:1}}}}} run scoreboard players add @s alch.strong 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{trial_omen:{}}}} run scoreboard players add @s alch.debuffs 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{trial_omen:{amplifier:{min:1}}}}} run scoreboard players add @s alch.strong 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{raid_omen:{}}}} run scoreboard players add @s alch.debuffs 1
execute if predicate {condition:entity_properties,entity:this,predicate:{effects:{raid_omen:{amplifier:{min:1}}}}} run scoreboard players add @s alch.strong 1
execute if predicate {condition:entity_properties,entity:this,predicate:{flags:{is_on_fire:true}}} run scoreboard players add @s alch.debuffs 1
execute if items entity @s saddle *[enchantments~[{enchantments:"operation:stats/vulnerable",levels:{min:1}}]] run scoreboard players add @s alch.debuffs 1
execute if items entity @s saddle *[enchantments~[{enchantments:"operation:stats/vulnerable",levels:{min:2}}]] run scoreboard players add @s alch.strong 1
execute if items entity @s saddle *[enchantments~[{enchantments:"operation:stats/bleed",levels:{min:1}}]] run scoreboard players add @s alch.debuffs 1
execute if items entity @s saddle *[enchantments~[{enchantments:"operation:stats/bleed",levels:{min:2}}]] run scoreboard players add @s alch.strong 1
execute if items entity @s saddle *[enchantments~[{enchantments:"operation:stats/stunned"}]] run scoreboard players add @s alch.debuffs 1
execute unless predicate {condition:entity_properties,entity:this,predicate:{effects:{blindness:{}}}} if items entity @s saddle *[enchantments~[{enchantments:"operation:stats/blinded"}]] run scoreboard players add @s alch.debuffs 1
execute unless predicate {condition:entity_properties,entity:this,predicate:{effects:{wither:{}}}} if items entity @s saddle *[enchantments~[{enchantments:"operation:stats/poisoned"}]] run scoreboard players add @s alch.debuffs 1
execute unless predicate {condition:entity_properties,entity:this,predicate:{effects:{wither:{}}}} if items entity @s saddle *[enchantments~[{enchantments:"operation:stats/poisoned"}]] if score @s stats.poisoned.level matches 2.. run scoreboard players add @s alch.strong 1
