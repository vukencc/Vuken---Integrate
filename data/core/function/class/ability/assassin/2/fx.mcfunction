playsound minecraft:block.amethyst_block.chime hostile @s ~ ~ ~ 0.75 1.15
playsound minecraft:item.trident.riptide_1 hostile @s ~ ~ ~ 0.5 0.85
playsound minecraft:block.anvil.hit hostile @s ~ ~ ~ 0.35 0.7

particle sweep_attack ~ ~1.3 ~ 1.4 1 1.4 0.3 20 normal
particle scrape ~ ~1.3 ~ 1 1 1 0.2 40 normal
particle dust_color_transition{from_color:14196479,to_color:16759807,scale:1.25} ~ ~1.1 ~ 2.4 0.55 2.4 0.04 56 normal
# Keep the centre sharp while the existing broad sweep expands through the six-block hit area.
particle dust_color_transition{from_color:4329983,to_color:16759807,scale:0.7} ~ ~1.05 ~ 0.45 0.16 0.45 0.02 18 normal
particle end_rod ~ ~1.3 ~ 0.18 0.55 0.18 0.03 12 normal
