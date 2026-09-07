#------scb counting of triggers------#
    scoreboard players remove @s[scores={melee.rc.cd=1..}] melee.rc.cd 1
    scoreboard players remove @s[scores={magic_book.rc.cd=1..}] magic_book.rc.cd 1
    scoreboard players remove @s[scores={wand.rc.cd=1..}] wand.rc.cd 1
    scoreboard players remove @s[scores={scythe.rc.cd=1..}] scythe.rc.cd 1
    scoreboard players remove @s[scores={magic_book.lc.cd=1..}] magic_book.lc.cd 1
    scoreboard players remove @s[scores={range.lc.cd=1..}] range.lc.cd 1
    scoreboard players remove @s[scores={pot.lc.cd=1..}] pot.lc.cd 1
    scoreboard players remove @s[scores={wand.lc.cd=1..}] wand.lc.cd 1
    scoreboard players remove @s[scores={melee.slc.cd=1..}] melee.slc.cd 1
    scoreboard players remove @s[scores={magic_book.slc.cd=1..}] magic_book.slc.cd 1
    scoreboard players remove @s[scores={range.slc.cd=1..}] range.slc.cd 1
    scoreboard players remove @s[scores={pot.slc.cd=1..}] pot.slc.cd 1
    scoreboard players remove @s[scores={wand.slc.cd=1..}] wand.slc.cd 1
    scoreboard players remove @s[scores={scythe.slc.cd=1..}] scythe.slc.cd 1
    scoreboard players remove @s[scores={melee.swap.cd=1..}] melee.swap.cd 1
    scoreboard players remove @s[scores={magic_book.swap.cd=1..}] magic_book.swap.cd 1
    scoreboard players remove @s[scores={range.swap.cd=1..}] range.swap.cd 1
    scoreboard players remove @s[scores={pot.swap.cd=1..}] pot.swap.cd 1
    scoreboard players remove @s[scores={wand.swap.cd=1..}] wand.swap.cd 1
    scoreboard players remove @s[scores={scythe.swap.cd=1..}] scythe.swap.cd 1
    scoreboard players remove @s[scores={melee.sswap.cd=1..}] melee.sswap.cd 1
    scoreboard players remove @s[scores={magic_book.sswap.cd=1..}] magic_book.sswap.cd 1
    scoreboard players remove @s[scores={range.sswap.cd=1..}] range.sswap.cd 1
    scoreboard players remove @s[scores={pot.sswap.cd=1..}] pot.sswap.cd 1
    scoreboard players remove @s[scores={wand.sswap.cd=1..}] wand.sswap.cd 1
    scoreboard players remove @s[scores={scythe.sswap.cd=1..}] scythe.sswap.cd 1
    scoreboard players remove @s[scores={melee.drop.cd=1..}] melee.drop.cd 1
    scoreboard players remove @s[scores={magic_book.drop.cd=1..}] magic_book.drop.cd 1
    scoreboard players remove @s[scores={range.drop.cd=1..}] range.drop.cd 1
    scoreboard players remove @s[scores={pot.drop.cd=1..}] pot.drop.cd 1
    scoreboard players remove @s[scores={wand.drop.cd=1..}] wand.drop.cd 1
    scoreboard players remove @s[scores={scythe.drop.cd=1..}] scythe.drop.cd 1
    scoreboard players remove @s[scores={melee.sdrop.cd=1..}] melee.sdrop.cd 1
    scoreboard players remove @s[scores={magic_book.sdrop.cd=1..}] magic_book.sdrop.cd 1
    scoreboard players remove @s[scores={range.sdrop.cd=1..}] range.sdrop.cd 1
    scoreboard players remove @s[scores={pot.sdrop.cd=1..}] pot.sdrop.cd 1
    scoreboard players remove @s[scores={wand.sdrop.cd=1..}] wand.sdrop.cd 1
    scoreboard players remove @s[scores={scythe.sdrop.cd=1..}] scythe.sdrop.cd 1
    scoreboard players remove @s[scores={melee.src.cd=1..}] melee.src.cd 1
    scoreboard players remove @s[scores={magic_book.src.cd=1..}] magic_book.src.cd 1
    scoreboard players remove @s[scores={range.src.cd=1..}] range.src.cd 1
    scoreboard players remove @s[scores={pot.src.cd=1..}] pot.src.cd 1
    scoreboard players remove @s[scores={wand.src.cd=1..}] wand.src.cd 1
    scoreboard players remove @s[scores={scythe.src.cd=1..}] scythe.src.cd 1

execute if score @s class matches 1 run function core:class/ability/warrior/off_cooldown
execute if score @s class matches 2 run function core:class/ability/mage/off_cooldown
execute if score @s class matches 3 run function core:class/ability/alchemist/off_cooldown
execute if score @s class matches 4 run function core:class/ability/scout/off_cooldown
execute if score @s class matches 5 run function core:class/ability/assassin/off_cooldown