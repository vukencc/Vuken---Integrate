# Do not scan stowed items.  A former skill-8 bow/crossbow is restored when held.
item modify entity @s weapon.mainhand [{function:set_custom_data,tag:{core:{scout8:{active:0b}}}},{function:set_components,components:{use_effects:{speed_multiplier:0.3f}}}]
