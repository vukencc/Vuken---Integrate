import os
import re
import json

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
TEXTURES_DIR = os.path.join(SCRIPT_DIR, 'textures', 'item')
ITEMS_DIR = os.path.join(SCRIPT_DIR, 'items')
MODELS_DIR = os.path.join(SCRIPT_DIR, 'models')

COMPOUND_TYPES = ('bow', 'crossbow')

PATHS = [
    # "weapon/sword/blade_of_autumn_leaves",
    # "weapon/axe/axe_of_lost_ash"
]

BOW_DISPLAY = {
    "thirdperson_righthand": {
        "rotation": [-80, 260, -40],
        "translation": [-1, -2, 2.5],
        "scale": [0.9, 0.9, 0.9]
    },
    "thirdperson_lefthand": {
        "rotation": [-80, -280, 40],
        "translation": [-1, -2, 2.5],
        "scale": [0.9, 0.9, 0.9]
    },
    "firstperson_righthand": {
        "rotation": [0, -90, 25],
        "translation": [1.13, 3.2, 1.13],
        "scale": [0.68, 0.68, 0.68]
    },
    "firstperson_lefthand": {
        "rotation": [0, 90, -25],
        "translation": [1.13, 3.2, 1.13],
        "scale": [0.68, 0.68, 0.68]
    }
}

CROSSBOW_STANDBY_DISPLAY = {
    "thirdperson_righthand": {
        "rotation": [-90, 0, -60],
        "translation": [2, 0.1, -3],
        "scale": [0.9, 0.9, 0.9]
    },
    "thirdperson_lefthand": {
        "rotation": [-90, 0, 30],
        "translation": [2, 0.1, -3],
        "scale": [0.9, 0.9, 0.9]
    },
    "firstperson_righthand": {
        "rotation": [-90, 0, -55],
        "translation": [1.13, 3.2, 1.13],
        "scale": [0.68, 0.68, 0.68]
    },
    "firstperson_lefthand": {
        "rotation": [-90, 0, 35],
        "translation": [1.13, 3.2, 1.13],
        "scale": [0.68, 0.68, 0.68]
    }
}


def scan_textures():
    """扫描 textures/item/ 下所有普通物品 .png 文件(3层)，排除复合类型目录。"""
    paths = []
    for root, _, files in os.walk(TEXTURES_DIR):
        for f in files:
            if f.endswith('.png'):
                rel = os.path.relpath(os.path.join(root, f), TEXTURES_DIR)
                name_no_ext = os.path.splitext(rel)[0].replace('\\', '/')
                parts = name_no_ext.split('/')
                if len(parts) == 3:
                    if parts[1] in COMPOUND_TYPES:
                        continue
                    paths.append(tuple(parts))
    return paths


def scan_compound():
    """扫描 textures/item/{cat}/{type}/{name}/ 下含 .png 的目录(复合物品：弓/弩等)。
    返回 (category, subcategory, name, [png_files]) 列表。"""
    items = []
    for root, dirs, _ in os.walk(TEXTURES_DIR):
        rel = os.path.relpath(root, TEXTURES_DIR).replace('\\', '/')
        parts = rel.split('/') if rel != '.' else []
        if len(parts) == 2 and parts[1] in COMPOUND_TYPES:
            category, subcategory = parts
            for d in dirs:
                item_dir = os.path.join(root, d)
                pngs = [f for f in os.listdir(item_dir) if f.endswith('.png')]
                if pngs:
                    items.append((category, subcategory, d, pngs))
    return items


def resolve_texture_names(png_files, subcategory):
    """根据子类别规则将源 PNG 文件名映射为目标纹理名。

    通用规则：  文件名以 _数字 结尾 → 提取数字
    弓：        其余 → t
    弩：        文件名含 _standby → standby；其余 → t
    """
    mapping = {}
    for src in png_files:
        base = os.path.splitext(src)[0]

        if base in ('t', 'standby') or base.isdigit():
            mapping[src] = base
            continue

        if subcategory == 'crossbow':
            m = re.search(r'_standby$', base)
            if m:
                mapping[src] = 'standby'
                continue

        m = re.search(r'_(\d+)$', base)
        if m:
            mapping[src] = m.group(1)
        else:
            mapping[src] = 't'

    return mapping


def rename_textures(tex_dir, texture_map, overwrite=False):
    """根据 texture_map 重命名纹理文件。"""
    for src, target in texture_map.items():
        src_path = os.path.join(tex_dir, src)
        dst_path = os.path.join(tex_dir, f"{target}.png")
        if src == f"{target}.png":
            continue
        if os.path.exists(dst_path):
            if overwrite:
                os.remove(dst_path)
                os.rename(src_path, dst_path)
                print(f"  纹理覆盖：{src} -> {target}.png")
            else:
                print(f"  纹理命名冲突，跳过：{src} (目标 {target}.png 已存在)")
        else:
            os.rename(src_path, dst_path)
            print(f"  纹理重命名：{src} -> {target}.png")


def write_json(filepath, content, overwrite, generated):
    """写入 JSON 文件，已存在则跳过。"""
    if not overwrite and os.path.exists(filepath):
        print(f"  已存在，跳过：{os.path.relpath(filepath, SCRIPT_DIR)}")
        return
    os.makedirs(os.path.dirname(filepath), exist_ok=True)
    with open(filepath, 'w', encoding='utf-8') as f:
        json.dump(content, f, indent=2)
    print(f"  已生成：{os.path.relpath(filepath, SCRIPT_DIR)}")
    generated.append(filepath)


def generate_files(category, subcategory, name, overwrite=False):
    """生成普通物品的 items/ 和 models/ JSON。"""
    items_path = os.path.join(ITEMS_DIR, category, subcategory, f"{name}.json")
    models_path = os.path.join(MODELS_DIR, category, subcategory, f"{name}.json")

    os.makedirs(os.path.dirname(items_path), exist_ok=True)
    os.makedirs(os.path.dirname(models_path), exist_ok=True)

    model_ref = f"{category}/{subcategory}/{name}"
    texture_ref = f"item/{category}/{subcategory}/{name}"

    generated = []

    write_json(items_path, {
        "model": {
            "type": "minecraft:model",
            "model": model_ref
        }
    }, overwrite, generated)

    write_json(models_path, {
        "parent": "item/stone_sword",
        "textures": {
            "layer0": texture_ref
        }
    }, overwrite, generated)

    return generated


def generate_bow_files(category, bow_name, png_files, overwrite=False):
    """为弓生成 items/、models/ JSON，并规范纹理命名。"""
    tex_dir = os.path.join(TEXTURES_DIR, category, 'bow', bow_name)
    texture_map = resolve_texture_names(png_files, 'bow')
    generated = []

    rename_textures(tex_dir, texture_map, overwrite)

    model_dir = os.path.join(MODELS_DIR, category, 'bow', bow_name)
    unique_targets = set(texture_map.values())

    for target in unique_targets:
        model_path = os.path.join(model_dir, f"bow_pulling_{target}.json" if target != 't' else "bow.json")
        content = {
            "parent": "item/generated",
            "textures": {"layer0": f"item/{category}/bow/{bow_name}/t"}
        } if target == 't' else {
            "parent": "minecraft:item/bow",
            "textures": {"layer0": f"item/{category}/bow/{bow_name}/{target}"}
        }
        if target == 't':
            content["display"] = BOW_DISPLAY
        write_json(model_path, content, overwrite, generated)

    generate_bow_item(category, bow_name, unique_targets, overwrite, generated)
    return generated


def generate_bow_item(category, bow_name, unique_targets, overwrite, generated):
    """生成弓的物品 JSON。"""
    numbers = sorted([int(v) for v in unique_targets if v != 't'])
    item_path = os.path.join(ITEMS_DIR, category, 'bow', f"{bow_name}.json")

    if not numbers:
        content = {
            "model": {
                "type": "minecraft:model",
                "model": f"minecraft:{category}/bow/{bow_name}/bow"
            }
        }
    else:
        entries = []
        for i, n in enumerate(numbers[1:], 1):
            threshold = 0.65 if i == 1 else (0.9 if i == 2 and len(numbers) == 3 else round(i / len(numbers), 2))
            entries.append({
                "model": {
                    "type": "minecraft:model",
                    "model": f"minecraft:{category}/bow/{bow_name}/bow_pulling_{n}"
                },
                "threshold": threshold
            })
        content = {
            "model": {
                "type": "minecraft:condition",
                "on_false": {
                    "type": "minecraft:model",
                    "model": f"minecraft:{category}/bow/{bow_name}/bow"
                },
                "on_true": {
                    "type": "minecraft:range_dispatch",
                    "entries": entries,
                    "fallback": {
                        "type": "minecraft:model",
                        "model": f"minecraft:{category}/bow/{bow_name}/bow_pulling_{numbers[0]}"
                    },
                    "property": "minecraft:use_duration",
                    "scale": 0.05
                },
                "property": "minecraft:using_item"
            }
        }

    write_json(item_path, content, overwrite, generated)


def generate_crossbow_files(category, name, png_files, overwrite=False):
    """为弩生成 items/、models/ JSON，并规范纹理命名。"""
    tex_dir = os.path.join(TEXTURES_DIR, category, 'crossbow', name)
    texture_map = resolve_texture_names(png_files, 'crossbow')
    generated = []

    rename_textures(tex_dir, texture_map, overwrite)

    model_dir = os.path.join(MODELS_DIR, category, 'crossbow', name)
    unique_targets = set(texture_map.values())

    for target in unique_targets:
        if target == 't':
            model_file = "crossbow.json"
            content = {
                "parent": "minecraft:item/crossbow",
                "textures": {"layer0": f"minecraft:item/{category}/crossbow/{name}/t"}
            }
        elif target == 'standby':
            model_file = "crossbow_standby.json"
            content = {
                "parent": "item/generated",
                "textures": {"layer0": f"minecraft:item/{category}/crossbow/{name}/standby"},
                "display": CROSSBOW_STANDBY_DISPLAY
            }
        else:
            model_file = f"crossbow_pulling_{target}.json"
            content = {
                "parent": "minecraft:item/crossbow",
                "textures": {"layer0": f"minecraft:item/{category}/crossbow/{name}/{target}"}
            }
        model_path = os.path.join(model_dir, model_file)
        write_json(model_path, content, overwrite, generated)

    generate_crossbow_item(category, name, unique_targets, overwrite, generated)
    return generated


def generate_crossbow_item(category, name, unique_targets, overwrite, generated):
    """生成弩的物品 JSON。"""
    numbers = sorted([int(v) for v in unique_targets if v not in ('t', 'standby')])
    item_path = os.path.join(ITEMS_DIR, category, 'crossbow', f"{name}.json")

    cases = []
    if 'standby' in unique_targets:
        cases.append({
            "model": {
                "type": "minecraft:model",
                "model": f"minecraft:{category}/crossbow/{name}/crossbow_standby"
            },
            "when": "arrow"
        })

    if numbers:
        entries = []
        for i, n in enumerate(numbers[1:], 1):
            threshold = 0.58 if i == 1 else (1.0 if i == 2 and len(numbers) == 3 else round(i / len(numbers), 2))
            entries.append({
                "model": {
                    "type": "minecraft:model",
                    "model": f"minecraft:{category}/crossbow/{name}/crossbow_pulling_{n}"
                },
                "threshold": threshold
            })
        inner = {
            "type": "minecraft:condition",
            "on_false": {
                "type": "minecraft:model",
                "model": f"minecraft:{category}/crossbow/{name}/crossbow"
            },
            "on_true": {
                "type": "minecraft:range_dispatch",
                "entries": entries,
                "fallback": {
                    "type": "minecraft:model",
                    "model": f"minecraft:{category}/crossbow/{name}/crossbow_pulling_{numbers[0]}"
                },
                "property": "minecraft:crossbow/pull"
            },
            "property": "minecraft:using_item"
        }
    else:
        inner = {
            "type": "minecraft:model",
            "model": f"minecraft:{category}/crossbow/{name}/crossbow"
        }

    content = {
        "model": {
            "type": "minecraft:select",
            "cases": cases,
            "fallback": inner,
            "property": "minecraft:charge_type"
        }
    }

    write_json(item_path, content, overwrite, generated)


def main():
    total = 0

    if PATHS:
        targets = []
        for p in PATHS:
            parts = p.replace('\\', '/').split('/')
            if len(parts) != 3:
                print(f"[错误] 路径格式需为 category/subcategory/name：{p}")
                continue
            targets.append(tuple(parts))
    else:
        targets = scan_textures()

    if not targets:
        print("没有需要处理的普通物品。")

    for category, subcategory, name in sorted(targets):
        try:
            result = generate_files(category, subcategory, name)
            total += len(result)
            print()
        except Exception as e:
            print(f"[错误] 处理 '{category}/{subcategory}/{name}' 时出错：{e}\n")

    if not PATHS:
        compounds = scan_compound()
    else:
        compounds = []

    if not compounds:
        if not targets:
            print("没有需要处理的项。")
    else:
        for category, subcategory, name, png_files in sorted(compounds):
            label = f"[{subcategory}] {category}/{subcategory}/{name}"
            try:
                print(label)
                if subcategory == 'bow':
                    result = generate_bow_files(category, name, png_files)
                elif subcategory == 'crossbow':
                    result = generate_crossbow_files(category, name, png_files)
                else:
                    print(f"  [警告] 未知的复合类型: {subcategory}")
                    result = []
                total += len(result)
                print()
            except Exception as e:
                print(f"[错误] 处理 '{label}' 时出错：{e}\n")

    print(f"完成：生成 {total} 个文件。")


if __name__ == "__main__":
    main()
