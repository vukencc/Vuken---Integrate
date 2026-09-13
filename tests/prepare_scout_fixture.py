from pathlib import Path
import shutil,sys
r=Path(__file__).resolve().parent.parent;o=Path(sys.argv[1])
for path in ['data/core/function/class/ability/scout','data/core/enchantment/class/scout','data/core/advancement/class/scout','data/operation/enchantment/stats/blinded.json','data/operation/function/trigger/slc.mcfunction','data/operation/function/trigger/sswap.mcfunction','data/core/function/class/ability/util','data/core/function/custom_ench/range','data/core/function/damage/range','data/operation/function/event/player/shoot','data/operation/function/event/player/arrow_hurt_entity','data/operation/function/event/enemy/take_damage/direct_ranged.mcfunction','data/operation/function/trigger/lc.mcfunction','data/operation/function/trigger/swap.mcfunction','data/core/advancement/arrow_hurt_entity.json','data/core/enchantment/inter/arrow_effect.json','data/operation/enchantment/stats/stunned.json','data/operation/enchantment/stats/vulnerable.json']:
 src=r/path;dst=o/path;dst.parent.mkdir(parents=True,exist_ok=True)
 if src.is_dir():shutil.copytree(src,dst,dirs_exist_ok=True)
 else:shutil.copy2(src,dst)
p=o/'data/test/function/setup.mcfunction';p.write_text(p.read_text(encoding='utf-8')+'\nfunction core:class/ability/scout/load\nscoreboard players set $20 math.times 20\n',encoding='utf-8')
