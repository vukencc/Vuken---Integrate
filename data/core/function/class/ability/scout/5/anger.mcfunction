# 26.1.2 persists the last attacking living entity. Refresh its timestamp so retaliation AI notices it.
$data modify entity @s last_hurt_by_mob set value $(target)
data modify entity @s ticks_since_last_hurt_by_mob set value 0
