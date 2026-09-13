from pathlib import Path
import sys,json,shutil
root=Path(__file__).resolve().parent.parent
out=Path(sys.argv[1]);out.mkdir(parents=True,exist_ok=True)
def write(name,obj):
 p=out/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(json.dumps(obj),encoding='utf-8')
def copy(name):
 p=out/name;p.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(root/name,p)
copy('pack.mcmeta')
for name in ['class/ability/util/reduce_cd_pattern','class/ability/mage/6/reduce_cd','class/ability/mage/7/pop_event/4','class/ability/mage/7/pop_event/6','data/ability_off_cd']+[f'class/ability/{c}/off_cooldown' for c in ['mage','warrior','alchemist','scout','assassin']]:
 copy('data/core/function/'+name+'.mcfunction')
write('data/test/test_instance/reduce_cd.json',{'type':'minecraft:function','function':'test:reduce_cd','environment':'minecraft:default','structure':'minecraft:empty','max_ticks':100,'setup_ticks':1})
lines=[];seen=set()
for l in (root/'data/core/function/set.mcfunction').read_text(encoding='utf-8-sig').splitlines():
 if l.startswith('scoreboard objectives add ') and l.split()[3] not in seen:lines.append(l);seen.add(l.split()[3])
p=out/'data/test/function/setup.mcfunction';p.parent.mkdir(parents=True,exist_ok=True);p.write_text('\n'.join(lines)+'\n',encoding='utf-8')
print(out)
