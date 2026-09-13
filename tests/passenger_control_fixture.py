from pathlib import Path
import sys
p=Path(sys.argv[1])/'data/core/function/trigger/basic/arcane_pot/set_attributes.mcfunction'
s=p.read_text(encoding='utf-8').replace(',"operation:stats/pas_only":1','')
p.write_text(s,encoding='utf-8')
