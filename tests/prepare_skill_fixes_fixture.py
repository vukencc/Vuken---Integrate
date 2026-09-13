"""Build an isolated GameTest pack from production functions; never opens a user world."""
from pathlib import Path
import json, shutil, sys
root=Path(__file__).resolve().parent.parent
out=Path(sys.argv[1]);out.mkdir(parents=True,exist_ok=True)
def copy(path):
 src=root/path;dst=out/path;dst.parent.mkdir(parents=True,exist_ok=True)
 if src.is_dir():shutil.copytree(src,dst,dirs_exist_ok=True)
 else:shutil.copy2(src,dst)
def write(path,obj):
 p=out/path;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(json.dumps(obj),encoding='utf-8')
copy('pack.mcmeta')
for path in ['data/core/function/class/ability/alchemist','data/core/function/trigger/basic/arcane_pot','data/core/function/damage/magic','data/core/function/custom_ench/aptitude','data/operation/function/motion','data/operation/function/stats','data/vfam/function','data/core/damage_type','data/operation/predicate','data/minecraft/tags','data/core/tags']:
 copy(path)
# Parse references to other enchantments without activating unrelated combat systems.
for src in (root/'data').glob('*/enchantment/**/*.json'):
 if src.parts[len(root.parts)+1]=='minecraft':continue
 write(src.relative_to(root),{'description':'Test registry identity','supported_items':'minecraft:saddle','weight':1,'max_level':255,'min_cost':{'base':1,'per_level_above_first':0},'max_cost':{'base':1,'per_level_above_first':0},'anvil_cost':1,'slots':['any'],'effects':{}})
for path in ['data/core/enchantment/class/alchemist/entity.json','data/core/enchantment/inter/pot_as_trigger.json','data/operation/enchantment/stats/t_limited_1.json','data/operation/enchantment/stats/t_limited_2.json','data/operation/enchantment/stats/pas_only.json','data/core/advancement/class/alchemist/kill.json','data/operation/advancement/stats/heal_player.json']:
 copy(path)
write('data/test/test_instance/skill_fixes.json',{'type':'minecraft:function','function':'test:skill_fixes','environment':'minecraft:default','structure':'minecraft:empty','max_ticks':200,'setup_ticks':1})
# Register the project's objectives without running its map/global player reset.
lines=[];seen=set()
for name in ['data/core/function/set.mcfunction','data/operation/function/set.mcfunction']:
 for l in (root/name).read_text().splitlines():
  if l.startswith('scoreboard objectives add ') and l.split()[3] not in seen:
   lines.append(l);seen.add(l.split()[3])
lines+=['function core:class/ability/alchemist/load','scoreboard players set $100 math.times 100','scoreboard players set $1000 math.times 1000','scoreboard players set $2 math.times 2','scoreboard players set $3 math.times 3','scoreboard players set $5 math.times 5']
p=out/'data/test/function/setup.mcfunction';p.parent.mkdir(parents=True,exist_ok=True);p.write_text('\n'.join(lines)+'\n')
print(out)

write('data/minecraft/tags/function/load.json',{'values':[]})
write('data/minecraft/tags/function/tick.json',{'values':[]})

for path in ['data/core/function/class/ability/mage/6', 'data/core/enchantment/system/enemy/tick.json', 'data/operation/function/trigger/pot', 'data/operation/function/event/enemy/take_damage/magic.mcfunction', 'data/core/function/data/enemy/tick.mcfunction']:
 copy(path)

copy('data/core/function/custom_ench/assistance/inferno.mcfunction')
