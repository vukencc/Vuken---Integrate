# class、输入 trigger 与技能回调

本文基于当前工作区代码；第五技能的游戏内验收项见末尾。未修改职业点数规则、全局初始化或其他职业。

## 1. 配置层与运行层

`core:class/sys/tick` 处理玩家的 `class_menu.trigger`。三位数 `abc` 分别表示职业、技能、等级，例如 `251/252` 调用 `sys/action/mage/5_1` 或 `5_2`。

这些 action 只写入技能等级，随后调用 `cal_points` 和 UI。它们本身不施法。法师的技能映射如下：

| 技能 | 等级/状态 | 输入 | 当前实现 |
| --- | --- | --- | --- |
| 1 魔力射线 | `wand.lc` | 左键 | `mage/1/cast`；充能由玩家 tick 管理 |
| 2 奥术子弹 | `wand.rc` | 右键 | `mage/2/cast`；弹体、命中标记及后续效果 |
| 3 暴风雪 | `wand.src` | 潜行右键 | `mage/3/summon`；实体附魔驱动移动区域 |
| 4 樱花步 | `wand.drop` | 丢弃 | `mage/4/cast` |
| 5 混沌新星 | `wand.slc` | 潜行左键 | `mage/5/summon`；本次补全 |
| 6 镜碎 | `wand.swap` | F | 目前只有配置和冷却提示 |
| 7 童话 | `wand.sdrop` | 设计为故事被动，含潜行丢弃分支 | 未发现故事队列/消耗运行实现 |
| 8 天使之声 | `mage.pas1` | 被动 | 未发现多技能命中计数运行实现 |

战士 1～8 已有运行函数。炼金、侦察兵、刺客目前主要是配置/UI 与冷却提示，不能把 action 文件的存在视为技能效果已实现。

## 2. 输入链与冷却

```text
玩家 saddle 上的 core:inter/tick_load
  → core:data/_tick_
    → core:data/trigger_tick（手持 #weapon_id 附魔物品）
      → operation:trigger/lc_refresh/wand
        → 潜行时 lc_refresh/s_wand
          → 已学习且不在冷却：添加 piercing_weapon 和零距离 attack_range

左键触发法杖 core:inter/wand_effect 的 post_piercing_attack
  → 潜行条件成立：operation:trigger/slc
    → class=2 + 法杖附魔 + wand.slc≥1
      → core:class/ability/mage/5/summon
```

因此零距离 piercing attack 是输入事件载体，实际伤害由技能函数产生。第五技能入口额外检查职业、等级 1～2 和冷却，确保冷却中的重复事件不会生成弹体。

基础冷却 240 tick，经 `core:custom_ench/aptitude/cal` 应用 aptitude 减冷却。`core:data/ability_off_cd` 每 tick 递减 `wand.slc.cd`；`mage/off_cooldown` 已有第五技能的冷却结束提示；`mage/reset` 已有等级清理。本次无需新增 objective 或提高 `$version`。

右键刷新走 consumable；F/潜行 F 与丢弃输入分别由 `operation:trigger/swap`、`sswap`、`drop`、`sdrop` 分发。玩家 tick 还直接处理部分被动，因此阅读技能时必须同时检查 `data/player/tick`、攻击/受伤回调和实体附魔。

## 3. 混沌新星的状态与实体

```text
summon（施法者）
  → 保存 UUID、魔法伤害及等级参数
  → 生成一个雪弹 + 一个微型盔甲架乘客
  → set：设置弹体 Owner、Motion，将参数复制到乘客 data

乘客 saddle 附魔 core:class/mage/5
  → tick（@s 为乘客，位置为乘客位置）
    → 有载具：飞行粒子；70 tick 未碰撞则清理弹体和乘客
    → 无载具：effect，原乘客转为 mage.5.active 黑洞
      → active：牵引、每20 tick脉冲、粒子、寿命扣减
        → end：清理实体
```

保留原有雪弹碰撞方案，由原版碰撞移除弹体、乘客脱离载具触发落点效果。因而弹体遵循原版实体碰撞规则，不额外改写友方穿透行为。伤害和牵引对象统一使用项目的 `type=!#minecraft:bypass`，玩家和技术实体不会受到黑洞效果。

| 参数 | 等级 I | 等级 II |
| --- | --- | --- |
| 基础冷却 | 240 tick / 12 秒 | 相同 |
| 黑洞寿命 | 100 tick / 5 秒 | 160 tick / 8 秒 |
| 半径 | 3.5 格 | 5 格 |
| 脉冲 | 生成时立即一次，以后每20 tick一次；共5次 | 共8次 |
| 每次基础魔法伤害 | 3，按施法时魔法系数计算 | 相同 |
| 易伤 | II，40 tick | IV，40 tick |
| 牵引 | 每 tick 向该黑洞中心写入0.2速度，中心0.5格内不覆盖速度 | 相同 |

半径是文档未指定数值时采用的实现默认值，集中在 `summon.mcfunction` 配置。牵引复用 `operation:motion/set_forward/init`，通过 Motion 让实体保留物理碰撞，不使用传送穿墙。

每个乘客自有 `data`、`timing_limited`、`inter_custom_cd`。此技能不同时挂载通用 `t_limited_*` 附魔，避免两个 tick 驱动争用计时和提前删除实体。原有飞行粒子保留，黑洞粒子另设函数。

## 4. 伤害归属与 hook

施法时调用 `core:damage/magic/get {value:3}`，从 `magic_get_return.value` 复制完整小数结果，而不是从整数命令返回值取伤害。

每次脉冲通过宏将 UUID、伤害和易伤等级传给各目标，目标回调对共享 `input`、`stdTemp*` 的修改不会改变同一脉冲后续目标的参数。黑洞中心坐标也使用各自的宏参数，重叠黑洞不会错误地选择最近的其他黑洞。

`apply` 使用与 `core:damage/magic/do` 相同的 `core:custom_magic`，直接指定 UUID 对应玩家作为 `by`。它不借用全局 `DamageOwner` 临时标签，因此其他技能或附魔嵌套伤害不会替换本技能归属。

```text
damage ... core:custom_magic by 实际施法者
  → core:magic_hurt_entity / core:magic_kill_entity advancements
    → operation:event/player/magic_*_entity/trigger_pre
      → trigger
      → revoke advancement，允许下次触发
```

目前魔法命中 trigger 包含 creativity、scholar、sidestep、silver_radiance 等附魔。易伤复用 `operation:stats/vulnerable/init`，持续40 tick，并遵守其较强等级保护规则。本次补齐了依赖函数 `vulnerable/compare` 的成功分支 `return 1`：调用方使用 `unless function`，原先没有显式成功返回会阻止已有易伤的正常刷新。这个修正也适用于其他通过同一接口施加易伤的技能。施法者离线后，剩余黑洞继续牵引和施加易伤，但跳过伤害，不把击杀归给其他玩家。

“童话”的故事队列和“天使之声”的多技能计数尚未实现，因此本次没有擅自添加无条件虚弱或模拟这些被动。如果以后实现，需要在成功施法之后登记技能5，并在命中侧登记技能来源。

## 5. 现有框架注意点

- UI 的灰色按钮不构成执行端校验：升级 action 尚未校验剩余点数/当前职业，这是独立于本技能的现有问题。
- 玩家主循环依赖特殊 saddle 初始化；本次不改写新玩家加入流程。
- 两个 `pack.mcmeta` 当前缺少版本范围声明；完整包加载验证之前需先解决该既有问题。
- 静态 JSON、引用、宏绑定和计时检查不能替代 Minecraft 26.1.2 中的实际运行。

## 6. 已执行的离线校验

使用本机 Minecraft 26.1.2 与 Java 25 的实际 `Commands` / `CommandFunction` 解析器，编译技能目录、`operation:trigger/slc` 及易伤比较依赖共13个函数，并使用两级参数分别实例化全部宏，结果通过。包括 UUID 整数数组、带小数的伤害/半径、负数落点坐标。

可复现命令（需要已安装的26.1.2游戏和Java 25）：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\tests\check_mage5.ps1 -MinecraftRoot 'D:\MC_PCL2\.minecraft'
```

校验器从项目读取实际 `custom_magic` 伤害类型，并为法杖附魔注册仅供命令引用解析的占位值。它不启动服务器、不打开存档，不模拟实体物理或执行附魔效果，因此不代表整个数据包已成功加载。全部686个JSON基础解析、848个函数的静态命令引用、新增宏字段及 `git diff --check` 也已通过。

## 7. 游戏内验收

在已正确初始化玩家、能正常加载此数据包的测试存档内验证：

1. 法师学习技能5一级，手持法杖潜行左键，一次输入仅产生一个雪弹；正常左键仍为技能1。
2. 对墙、地面和敌人射击，碰撞后出现黑洞；观察5秒内五次脉冲、易伤II和3.5格牵引。
3. 切换二级，检查8秒八次脉冲、易伤IV、5格半径；半径之外目标不受影响。
4. 对空发射，不碰撞时约3.5秒后弹体与乘客一起删除，不生成黑洞。
5. 冷却中反复输入不会重复施法；冷却结束提示和 aptitude 减冷却仍工作。
6. 两名法师交叉发射并制造重叠黑洞，核对各自伤害、技能等级和击杀归属；施法后换装备不改变已生成黑洞伤害。
7. 玩家、物品和技术实体不被牵引/伤害；怪物被吸向墙时不应传送穿墙。
8. 检查魔法命中附魔及击杀回调；施法者离线后没有其他玩家接收其伤害归属，黑洞仍按时清理。
