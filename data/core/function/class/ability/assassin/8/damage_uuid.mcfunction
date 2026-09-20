playsound entity.warden.sonic_boom hostile @s ~ ~ ~ 0.45 1.55 0
particle dust_color_transition{from_color:3223857,to_color:10921638,scale:1.35} ~ ~1 ~ 1.2 0.9 1.2 0.14 46 normal
particle reverse_portal ~ ~1 ~ 1.1 0.8 1.1 0.12 34 normal
$damage @s $(value) core:custom_melee by @a[nbt={UUID:$(owner)},limit=1]