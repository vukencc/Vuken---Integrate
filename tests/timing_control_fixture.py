from pathlib import Path
import sys
p=Path(sys.argv[1])/'data/operation/function/stats/timing_limited/init.mcfunction'
p.write_text('scoreboard players set @s timing_limited 100\ndata remove entity @s equipment.saddle.components."minecraft:enchantments"."operation:stats/t_limited_1"\ndata modify entity @s equipment.saddle.components."minecraft:enchantments" merge value {"operation:stats/t_limited_2":1}\n',encoding='utf-8')
