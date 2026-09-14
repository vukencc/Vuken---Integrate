from pathlib import Path
import shutil,sys
r=Path(__file__).resolve().parent.parent;o=Path(sys.argv[1])
for path in ['data/core/enchantment/inter/tick_load.json','data/core/function/data/_tick_.mcfunction','data/core/function/data/trigger_tick.mcfunction','data/core/advancement/data_refresh.json','data/core/function/data/count_delay.mcfunction','data/core/function/data/drop_offhand.mcfunction','data/core/function/data/swap_offhand.mcfunction','data/operation/function/container','data/operation/function/trigger/lc_refresh']:
 src=r/path;dst=o/path;dst.parent.mkdir(parents=True,exist_ok=True)
 if src.is_dir():shutil.copytree(src,dst,dirs_exist_ok=True)
 else:shutil.copy2(src,dst)
