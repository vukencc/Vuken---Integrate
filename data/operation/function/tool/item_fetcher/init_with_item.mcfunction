execute align xyz positioned ~0.5 ~0.25 ~0.5 run summon item ~ ~ ~ {PickupDelay:-1,NoGravity:1b,Invulnerable:1b,Tags:["item_to_fetch"],Item:{id:stone,count:1},Age:-32768}
execute align xyz positioned ~0.5 ~0.25 ~0.5 run item replace entity @n[type=item,tag=item_to_fetch] container.0 from entity @n[type=item,distance=..2,tag=item_pre_fetch] container.0
execute align xyz positioned ~0.5 ~0.25 ~0.5 run kill @n[type=item,tag=item_pre_fetch]
execute align xyz positioned ~0.5 ~ ~0.5 run summon interaction ~ ~ ~ {Tags:["item_fetcher"]}
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon armor_stand ~ ~ ~ {Marker:1b,NoGravity:1b,Invulnerable:1b,Invisible:1b,equipment:{saddle:{id:saddle,count:1,components:{enchantments:{"operation:trigger/item_fetcher":1}}}},Tags:["item_fetch_particle"]}