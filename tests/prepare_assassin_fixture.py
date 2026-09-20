"""Build an isolated 26.1.2 GameTest pack for assassin abilities."""
from pathlib import Path
import json, shutil, sys

root = Path(__file__).resolve().parent.parent
out = Path(sys.argv[1])
out.mkdir(parents=True, exist_ok=True)

def copy(path):
    src = root / path
    dst = out / path
    dst.parent.mkdir(parents=True, exist_ok=True)
    if src.is_dir():
        shutil.copytree(src, dst, dirs_exist_ok=True)
    else:
        shutil.copy2(src, dst)

def write(path, obj):
    dst = out / path
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_text(json.dumps(obj), encoding="utf-8")

copy("pack.mcmeta")
for path in [
    "data/core/function/class/ability/assassin",
    "data/core/function/class/ability/util",
    "data/core/function/custom_ench/aptitude",
    "data/core/function/damage/melee",
    "data/operation/function/displacement",
    "data/core/function/data/ability_off_cd.mcfunction",
    "data/operation/function/motion",
    "data/operation/function/stats",
    "data/operation/predicate",
    "data/vfam/function",
    "data/core/damage_type",
    "data/core/tags",
    "data/minecraft/tags",
]:
    copy(path)

# Function-loading requires the enchantment identities used by temporary skill
# entities. Keep their effects empty: the GameTest calls skill functions itself.
for src in (root / "data").glob("*/enchantment/**/*.json"):
    if src.relative_to(root).parts[1] == "minecraft": continue
    write(src.relative_to(root), {"description":"Test identity","supported_items":"minecraft:saddle","weight":1,"max_level":255,"min_cost":{"base":1,"per_level_above_first":0},"max_cost":{"base":1,"per_level_above_first":0},"anvil_cost":1,"slots":["any"],"effects":{}})
for path in ["data/core/predicate", "data/core/enchantment/class/assassin", "data/core/enchantment/inter/sword_effect.json", "data/operation/enchantment/stats/t_limited_1.json", "data/operation/enchantment/stats/t_limited_2.json", "data/operation/enchantment/stats/blinded.json", "data/operation/enchantment/stats/stunned.json", "data/operation/function/trigger", "data/operation/advancement/trigger", "data/operation/function/event/enemy/on_death", "data/operation/enchantment/enemy_event/on_death_tick.json", "data/operation/function/event/enemy/take_damage/melee.mcfunction", "data/core/function/data/enemy/tick.mcfunction"]:
    if (root/path).exists(): copy(path)

for path in ["data/core/function/defence/com_hurt_entity.mcfunction", "data/core/function/custom_ench/melee", "data/core/advancement/melee_hurt_entity.json", "data/operation/function/event/player/melee_hurt_entity", "data/core/advancement/data_refresh.json", "data/core/function/data/count_delay.mcfunction", "data/core/function/data/drop_offhand.mcfunction", "data/core/function/data/swap_offhand.mcfunction", "data/operation/function/container"]:
    copy(path)

copy("data/core/function/custom_ench/forge")
copy("data/core/function/trigger/enemy")

write("data/test/test_instance/assassin.json", {
    "type": "minecraft:function", "function": "test:assassin",
    "environment": "minecraft:default", "structure": "minecraft:empty",
    "max_ticks": 200, "setup_ticks": 1,
})

lines, seen = [], set()
for name in ["data/core/function/set.mcfunction", "data/operation/function/set.mcfunction"]:
    for line in (root / name).read_text(encoding="utf-8").splitlines():
        if line.startswith("scoreboard objectives add ") and line.split()[3] not in seen:
            lines.append(line)
            seen.add(line.split()[3])
lines += [
    "scoreboard players set $100 math.times 100",
    "scoreboard players set $1000 math.times 1000",
    "scoreboard players set $2 math.times 2",
    "scoreboard players set $3 math.times 3",
    "scoreboard players set $5 math.times 5",
    "scoreboard players set $10 math.times 10",
    "scoreboard players set $20 math.times 20",
    "scoreboard players set $36000 assassin.8.facing 36000",
    "function vfam:init",
    "scoreboard players set $-10 assassin.8.extra -10",
]
setup = out / "data/test/function/setup.mcfunction"
setup.parent.mkdir(parents=True, exist_ok=True)
setup.write_text("\n".join(lines) + "\n", encoding="utf-8")
write("data/minecraft/tags/function/load.json", {"values": []})
write("data/minecraft/tags/function/tick.json", {"values": []})
print(out)

# Temporary integration trace, removed after resolving shared callback coverage.
for rel in ["core/function/defence/com_hurt_entity", "core/function/custom_ench/melee/melee_argu", "core/function/damage/melee/direct_apply", "core/function/damage/melee/calculation", "vfam/function/get", "vfam/function/get/list", "vfam/function/get/get_effect", "operation/function/event/player/melee_hurt_entity/trigger"]:
    p=out / ("data/"+rel+".mcfunction")
    if not p.exists(): continue
    lines=[]
    for i,l in enumerate(p.read_text(encoding="utf-8").splitlines()):
        lines.append(l)
        if l and not l.startswith("#"): lines.append('data modify storage test:trace "'+rel+'" set value '+str(i+1))
    p.write_text("\n".join(lines)+"\n",encoding="utf-8")
