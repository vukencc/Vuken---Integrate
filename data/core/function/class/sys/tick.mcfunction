# 0 -> main (choose class)

# 1-5 -> choose-able class (warrior, mage, alchemist, scout, assassin) (equals to scoreboard class)
# 11-15 -> read-only class (you can only read ability descriptions)

# 8 -> reset class
# 9 -> reset abilities

#        / a -> class (1-5)
# abc -> | b -> ability (1-8)
#        \ c -> level (0-2)

execute if score @s class_menu.trigger matches ..10 run playsound map:entity.player.levelup_fix hostile @s ~ ~ ~ 1 2 1
execute if score @s class_menu.trigger matches 11..20 run playsound item.book.page_turn hostile @s ~ ~ ~ 1 1 1
execute if score @s class_menu.trigger matches 100.. run playsound minecraft:entity.experience_orb.pickup hostile @s ~ ~ ~ 1 1.5 1

execute if score @s class_menu.trigger matches 0 run function core:class/sys/ui/main

execute if score @s class_menu.trigger matches 1 run function core:class/sys/ui/warrior
execute if score @s class_menu.trigger matches 11 run function core:class/sys/ui/warrior_read
execute if score @s class_menu.trigger matches 2 run function core:class/sys/ui/mage
execute if score @s class_menu.trigger matches 12 run function core:class/sys/ui/mage_read
execute if score @s class_menu.trigger matches 3 run function core:class/sys/ui/alchemist
execute if score @s class_menu.trigger matches 13 run function core:class/sys/ui/alchemist_read
execute if score @s class_menu.trigger matches 4 run function core:class/sys/ui/scout
execute if score @s class_menu.trigger matches 14 run function core:class/sys/ui/scout_read
execute if score @s class_menu.trigger matches 5 run function core:class/sys/ui/assassin
execute if score @s class_menu.trigger matches 15 run function core:class/sys/ui/assassin_read

execute if score @s class_menu.trigger matches 8 run function core:class/sys/action/reset
execute if score @s class_menu.trigger matches 9 run function core:class/sys/action/reset_abilities

execute if score @s class_menu.trigger matches 110 run function core:class/sys/action/warrior/1_0
execute if score @s class_menu.trigger matches 111 run function core:class/sys/action/warrior/1_1
execute if score @s class_menu.trigger matches 112 run function core:class/sys/action/warrior/1_2

execute if score @s class_menu.trigger matches 120 run function core:class/sys/action/warrior/2_0
execute if score @s class_menu.trigger matches 121 run function core:class/sys/action/warrior/2_1
execute if score @s class_menu.trigger matches 122 run function core:class/sys/action/warrior/2_2
execute if score @s class_menu.trigger matches 130 run function core:class/sys/action/warrior/3_0
execute if score @s class_menu.trigger matches 131 run function core:class/sys/action/warrior/3_1
execute if score @s class_menu.trigger matches 132 run function core:class/sys/action/warrior/3_2
execute if score @s class_menu.trigger matches 140 run function core:class/sys/action/warrior/4_0
execute if score @s class_menu.trigger matches 141 run function core:class/sys/action/warrior/4_1
execute if score @s class_menu.trigger matches 142 run function core:class/sys/action/warrior/4_2
execute if score @s class_menu.trigger matches 150 run function core:class/sys/action/warrior/5_0
execute if score @s class_menu.trigger matches 151 run function core:class/sys/action/warrior/5_1
execute if score @s class_menu.trigger matches 152 run function core:class/sys/action/warrior/5_2
execute if score @s class_menu.trigger matches 160 run function core:class/sys/action/warrior/6_0
execute if score @s class_menu.trigger matches 161 run function core:class/sys/action/warrior/6_1
execute if score @s class_menu.trigger matches 162 run function core:class/sys/action/warrior/6_2
execute if score @s class_menu.trigger matches 170 run function core:class/sys/action/warrior/7_0
execute if score @s class_menu.trigger matches 171 run function core:class/sys/action/warrior/7_1
execute if score @s class_menu.trigger matches 172 run function core:class/sys/action/warrior/7_2
execute if score @s class_menu.trigger matches 180 run function core:class/sys/action/warrior/8_0
execute if score @s class_menu.trigger matches 181 run function core:class/sys/action/warrior/8_1
execute if score @s class_menu.trigger matches 182 run function core:class/sys/action/warrior/8_2
execute if score @s class_menu.trigger matches 210 run function core:class/sys/action/mage/1_0
execute if score @s class_menu.trigger matches 211 run function core:class/sys/action/mage/1_1
execute if score @s class_menu.trigger matches 212 run function core:class/sys/action/mage/1_2
execute if score @s class_menu.trigger matches 220 run function core:class/sys/action/mage/2_0
execute if score @s class_menu.trigger matches 221 run function core:class/sys/action/mage/2_1
execute if score @s class_menu.trigger matches 222 run function core:class/sys/action/mage/2_2
execute if score @s class_menu.trigger matches 230 run function core:class/sys/action/mage/3_0
execute if score @s class_menu.trigger matches 231 run function core:class/sys/action/mage/3_1
execute if score @s class_menu.trigger matches 232 run function core:class/sys/action/mage/3_2
execute if score @s class_menu.trigger matches 240 run function core:class/sys/action/mage/4_0
execute if score @s class_menu.trigger matches 241 run function core:class/sys/action/mage/4_1
execute if score @s class_menu.trigger matches 242 run function core:class/sys/action/mage/4_2
execute if score @s class_menu.trigger matches 250 run function core:class/sys/action/mage/5_0
execute if score @s class_menu.trigger matches 251 run function core:class/sys/action/mage/5_1
execute if score @s class_menu.trigger matches 252 run function core:class/sys/action/mage/5_2
execute if score @s class_menu.trigger matches 260 run function core:class/sys/action/mage/6_0
execute if score @s class_menu.trigger matches 261 run function core:class/sys/action/mage/6_1
execute if score @s class_menu.trigger matches 262 run function core:class/sys/action/mage/6_2
execute if score @s class_menu.trigger matches 270 run function core:class/sys/action/mage/7_0
execute if score @s class_menu.trigger matches 271 run function core:class/sys/action/mage/7_1
execute if score @s class_menu.trigger matches 272 run function core:class/sys/action/mage/7_2
execute if score @s class_menu.trigger matches 280 run function core:class/sys/action/mage/8_0
execute if score @s class_menu.trigger matches 281 run function core:class/sys/action/mage/8_1
execute if score @s class_menu.trigger matches 282 run function core:class/sys/action/mage/8_2
execute if score @s class_menu.trigger matches 310 run function core:class/sys/action/alchemist/1_0
execute if score @s class_menu.trigger matches 311 run function core:class/sys/action/alchemist/1_1
execute if score @s class_menu.trigger matches 312 run function core:class/sys/action/alchemist/1_2
execute if score @s class_menu.trigger matches 320 run function core:class/sys/action/alchemist/2_0
execute if score @s class_menu.trigger matches 321 run function core:class/sys/action/alchemist/2_1
execute if score @s class_menu.trigger matches 322 run function core:class/sys/action/alchemist/2_2
execute if score @s class_menu.trigger matches 330 run function core:class/sys/action/alchemist/3_0
execute if score @s class_menu.trigger matches 331 run function core:class/sys/action/alchemist/3_1
execute if score @s class_menu.trigger matches 332 run function core:class/sys/action/alchemist/3_2
execute if score @s class_menu.trigger matches 340 run function core:class/sys/action/alchemist/4_0
execute if score @s class_menu.trigger matches 341 run function core:class/sys/action/alchemist/4_1
execute if score @s class_menu.trigger matches 342 run function core:class/sys/action/alchemist/4_2
execute if score @s class_menu.trigger matches 350 run function core:class/sys/action/alchemist/5_0
execute if score @s class_menu.trigger matches 351 run function core:class/sys/action/alchemist/5_1
execute if score @s class_menu.trigger matches 352 run function core:class/sys/action/alchemist/5_2
execute if score @s class_menu.trigger matches 360 run function core:class/sys/action/alchemist/6_0
execute if score @s class_menu.trigger matches 361 run function core:class/sys/action/alchemist/6_1
execute if score @s class_menu.trigger matches 362 run function core:class/sys/action/alchemist/6_2
execute if score @s class_menu.trigger matches 370 run function core:class/sys/action/alchemist/7_0
execute if score @s class_menu.trigger matches 371 run function core:class/sys/action/alchemist/7_1
execute if score @s class_menu.trigger matches 372 run function core:class/sys/action/alchemist/7_2
execute if score @s class_menu.trigger matches 380 run function core:class/sys/action/alchemist/8_0
execute if score @s class_menu.trigger matches 381 run function core:class/sys/action/alchemist/8_1
execute if score @s class_menu.trigger matches 382 run function core:class/sys/action/alchemist/8_2
execute if score @s class_menu.trigger matches 410 run function core:class/sys/action/scout/1_0
execute if score @s class_menu.trigger matches 411 run function core:class/sys/action/scout/1_1
execute if score @s class_menu.trigger matches 412 run function core:class/sys/action/scout/1_2
execute if score @s class_menu.trigger matches 420 run function core:class/sys/action/scout/2_0
execute if score @s class_menu.trigger matches 421 run function core:class/sys/action/scout/2_1
execute if score @s class_menu.trigger matches 422 run function core:class/sys/action/scout/2_2
execute if score @s class_menu.trigger matches 430 run function core:class/sys/action/scout/3_0
execute if score @s class_menu.trigger matches 431 run function core:class/sys/action/scout/3_1
execute if score @s class_menu.trigger matches 432 run function core:class/sys/action/scout/3_2
execute if score @s class_menu.trigger matches 440 run function core:class/sys/action/scout/4_0
execute if score @s class_menu.trigger matches 441 run function core:class/sys/action/scout/4_1
execute if score @s class_menu.trigger matches 442 run function core:class/sys/action/scout/4_2
execute if score @s class_menu.trigger matches 450 run function core:class/sys/action/scout/5_0
execute if score @s class_menu.trigger matches 451 run function core:class/sys/action/scout/5_1
execute if score @s class_menu.trigger matches 452 run function core:class/sys/action/scout/5_2
execute if score @s class_menu.trigger matches 460 run function core:class/sys/action/scout/6_0
execute if score @s class_menu.trigger matches 461 run function core:class/sys/action/scout/6_1
execute if score @s class_menu.trigger matches 462 run function core:class/sys/action/scout/6_2
execute if score @s class_menu.trigger matches 470 run function core:class/sys/action/scout/7_0
execute if score @s class_menu.trigger matches 471 run function core:class/sys/action/scout/7_1
execute if score @s class_menu.trigger matches 472 run function core:class/sys/action/scout/7_2
execute if score @s class_menu.trigger matches 480 run function core:class/sys/action/scout/8_0
execute if score @s class_menu.trigger matches 481 run function core:class/sys/action/scout/8_1
execute if score @s class_menu.trigger matches 482 run function core:class/sys/action/scout/8_2
execute if score @s class_menu.trigger matches 510 run function core:class/sys/action/assassin/1_0
execute if score @s class_menu.trigger matches 511 run function core:class/sys/action/assassin/1_1
execute if score @s class_menu.trigger matches 512 run function core:class/sys/action/assassin/1_2
execute if score @s class_menu.trigger matches 520 run function core:class/sys/action/assassin/2_0
execute if score @s class_menu.trigger matches 521 run function core:class/sys/action/assassin/2_1
execute if score @s class_menu.trigger matches 522 run function core:class/sys/action/assassin/2_2
execute if score @s class_menu.trigger matches 530 run function core:class/sys/action/assassin/3_0
execute if score @s class_menu.trigger matches 531 run function core:class/sys/action/assassin/3_1
execute if score @s class_menu.trigger matches 532 run function core:class/sys/action/assassin/3_2
execute if score @s class_menu.trigger matches 540 run function core:class/sys/action/assassin/4_0
execute if score @s class_menu.trigger matches 541 run function core:class/sys/action/assassin/4_1
execute if score @s class_menu.trigger matches 542 run function core:class/sys/action/assassin/4_2
execute if score @s class_menu.trigger matches 550 run function core:class/sys/action/assassin/5_0
execute if score @s class_menu.trigger matches 551 run function core:class/sys/action/assassin/5_1
execute if score @s class_menu.trigger matches 552 run function core:class/sys/action/assassin/5_2
execute if score @s class_menu.trigger matches 560 run function core:class/sys/action/assassin/6_0
execute if score @s class_menu.trigger matches 561 run function core:class/sys/action/assassin/6_1
execute if score @s class_menu.trigger matches 562 run function core:class/sys/action/assassin/6_2
execute if score @s class_menu.trigger matches 570 run function core:class/sys/action/assassin/7_0
execute if score @s class_menu.trigger matches 571 run function core:class/sys/action/assassin/7_1
execute if score @s class_menu.trigger matches 572 run function core:class/sys/action/assassin/7_2
execute if score @s class_menu.trigger matches 580 run function core:class/sys/action/assassin/8_0
execute if score @s class_menu.trigger matches 581 run function core:class/sys/action/assassin/8_1
execute if score @s class_menu.trigger matches 582 run function core:class/sys/action/assassin/8_2
scoreboard players set @s class_menu.trigger -1






































