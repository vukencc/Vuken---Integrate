tag @s remove WarriorDash

execute if score @s melee.rc matches 1 store result storage input value double 1.0 run function core:damage/melee/get {value:8}
execute if score @s melee.rc matches 2 store result storage input value double 1.0 run function core:damage/melee/get {value:12}

execute if score @s melee.rc matches 1 at @s as @e[type=!#minecraft:bypass,distance=..5] run function operation:stats/stunned/init {duration:20,type:1}
execute if score @s melee.rc matches 2 at @s as @e[type=!#minecraft:bypass,distance=..5] run function operation:stats/stunned/init {duration:40,type:1}

tag @s add DamageOwner
execute at @s as @e[type=!#minecraft:bypass,distance=..5] run function core:damage/melee/do with storage input
tag @s remove DamageOwner

playsound minecraft:entity.iron_golem.repair hostile @s ~ ~-1 ~ 1 1.2 1
# ===== 震荡破 —— 战士落地冲击特效 =====
# 用法：落地瞬间执行一次，烟尘环由内向外扩散并上扬

# ---- 中心落地冲击 ----
particle explosion ~ ~0.5 ~ 0 0 0 0 2 normal
particle cloud ~ ~0.5 ~ 0 0 0 0.35 20 normal
particle crit ~ ~0.35 ~ 0 0 0 0.8 12 normal

# ---- 地面扩散环 R=3（内环，慢速先行） ----
particle cloud ~ ~1 ~ 3 0 0 0.04 0 normal
particle cloud ~ ~1 ~ 2.89777748 0 0.77645714 0.04 0 normal
particle cloud ~ ~1 ~ 2.59807621 0 1.5 0.04 0 normal
particle cloud ~ ~1 ~ 2.12132034 0 2.12132034 0.04 0 normal
particle cloud ~ ~1 ~ 1.5 0 2.59807621 0.04 0 normal
particle cloud ~ ~1 ~ 0.77645714 0 2.89777748 0.04 0 normal
particle cloud ~ ~1 ~ 0 0 3 0.04 0 normal
particle cloud ~ ~1 ~ -0.77645714 0 2.89777748 0.04 0 normal
particle cloud ~ ~1 ~ -1.5 0 2.59807621 0.04 0 normal
particle cloud ~ ~1 ~ -2.12132034 0 2.12132034 0.04 0 normal
particle cloud ~ ~1 ~ -2.59807621 0 1.5 0.04 0 normal
particle cloud ~ ~1 ~ -2.89777748 0 0.77645714 0.04 0 normal
particle cloud ~ ~1 ~ -3 0 0 0.04 0 normal
particle cloud ~ ~1 ~ -2.89777748 0 -0.77645714 0.04 0 normal
particle cloud ~ ~1 ~ -2.59807621 0 -1.5 0.04 0 normal
particle cloud ~ ~1 ~ -2.12132034 0 -2.12132034 0.04 0 normal
particle cloud ~ ~1 ~ -1.5 0 -2.59807621 0.04 0 normal
particle cloud ~ ~1 ~ -0.77645714 0 -2.89777748 0.04 0 normal
particle cloud ~ ~1 ~ 0 0 -3 0.04 0 normal
particle cloud ~ ~1 ~ 0.77645714 0 -2.89777748 0.04 0 normal
particle cloud ~ ~1 ~ 1.5 0 -2.59807621 0.04 0 normal
particle cloud ~ ~1 ~ 2.12132034 0 -2.12132034 0.04 0 normal
particle cloud ~ ~1 ~ 2.59807621 0 -1.5 0.04 0 normal
particle cloud ~ ~1 ~ 2.89777748 0 -0.77645714 0.04 0 normal

# ---- 地面扩散环 R=5（中环） ----
particle cloud ~ ~1 ~ 5 0 0 0.06 0 normal
particle cloud ~ ~1 ~ 4.92403877 0 0.86824089 0.06 0 normal
particle cloud ~ ~1 ~ 4.6984631 0 1.71010072 0.06 0 normal
particle cloud ~ ~1 ~ 4.33012702 0 2.5 0.06 0 normal
particle cloud ~ ~1 ~ 3.83022222 0 3.21393805 0.06 0 normal
particle cloud ~ ~1 ~ 3.21393805 0 3.83022222 0.06 0 normal
particle cloud ~ ~1 ~ 2.5 0 4.33012702 0.06 0 normal
particle cloud ~ ~1 ~ 1.71010072 0 4.6984631 0.06 0 normal
particle cloud ~ ~1 ~ 0.86824089 0 4.92403877 0.06 0 normal
particle cloud ~ ~1 ~ 0 0 5 0.06 0 normal
particle cloud ~ ~1 ~ -0.86824089 0 4.92403877 0.06 0 normal
particle cloud ~ ~1 ~ -1.71010072 0 4.6984631 0.06 0 normal
particle cloud ~ ~1 ~ -2.5 0 4.33012702 0.06 0 normal
particle cloud ~ ~1 ~ -3.21393805 0 3.83022222 0.06 0 normal
particle cloud ~ ~1 ~ -3.83022222 0 3.21393805 0.06 0 normal
particle cloud ~ ~1 ~ -4.33012702 0 2.5 0.06 0 normal
particle cloud ~ ~1 ~ -4.6984631 0 1.71010072 0.06 0 normal
particle cloud ~ ~1 ~ -4.92403877 0 0.86824089 0.06 0 normal
particle cloud ~ ~1 ~ -5 0 0 0.06 0 normal
particle cloud ~ ~1 ~ -4.92403877 0 -0.86824089 0.06 0 normal
particle cloud ~ ~1 ~ -4.6984631 0 -1.71010072 0.06 0 normal
particle cloud ~ ~1 ~ -4.33012702 0 -2.5 0.06 0 normal
particle cloud ~ ~1 ~ -3.83022222 0 -3.21393805 0.06 0 normal
particle cloud ~ ~1 ~ -3.21393805 0 -3.83022222 0.06 0 normal
particle cloud ~ ~1 ~ -2.5 0 -4.33012702 0.06 0 normal
particle cloud ~ ~1 ~ -1.71010072 0 -4.6984631 0.06 0 normal
particle cloud ~ ~1 ~ -0.86824089 0 -4.92403877 0.06 0 normal
particle cloud ~ ~1 ~ 0 0 -5 0.06 0 normal
particle cloud ~ ~1 ~ 0.86824089 0 -4.92403877 0.06 0 normal
particle cloud ~ ~1 ~ 1.71010072 0 -4.6984631 0.06 0 normal
particle cloud ~ ~1 ~ 2.5 0 -4.33012702 0.06 0 normal
particle cloud ~ ~1 ~ 3.21393805 0 -3.83022222 0.06 0 normal
particle cloud ~ ~1 ~ 3.83022222 0 -3.21393805 0.06 0 normal
particle cloud ~ ~1 ~ 4.33012702 0 -2.5 0.06 0 normal
particle cloud ~ ~1 ~ 4.6984631 0 -1.71010072 0.06 0 normal
particle cloud ~ ~1 ~ 4.92403877 0 -0.86824089 0.06 0 normal

# ---- 地面扩散环 R=8（外环） ----
particle cloud ~ ~1 ~ 8 0 0 0.08 0 normal
particle cloud ~ ~1 ~ 7.87846202 0 1.38918542 0.08 0 normal
particle cloud ~ ~1 ~ 7.51754097 0 2.73616115 0.08 0 normal
particle cloud ~ ~1 ~ 6.92820323 0 4 0.08 0 normal
particle cloud ~ ~1 ~ 6.12835554 0 5.14230088 0.08 0 normal
particle cloud ~ ~1 ~ 5.14230088 0 6.12835554 0.08 0 normal
particle cloud ~ ~1 ~ 4 0 6.92820323 0.08 0 normal
particle cloud ~ ~1 ~ 2.73616115 0 7.51754097 0.08 0 normal
particle cloud ~ ~1 ~ 1.38918542 0 7.87846202 0.08 0 normal
particle cloud ~ ~1 ~ 0 0 8 0.08 0 normal
particle cloud ~ ~1 ~ -1.38918542 0 7.87846202 0.08 0 normal
particle cloud ~ ~1 ~ -2.73616115 0 7.51754097 0.08 0 normal
particle cloud ~ ~1 ~ -4 0 6.92820323 0.08 0 normal
particle cloud ~ ~1 ~ -5.14230088 0 6.12835554 0.08 0 normal
particle cloud ~ ~1 ~ -6.12835554 0 5.14230088 0.08 0 normal
particle cloud ~ ~1 ~ -6.92820323 0 4 0.08 0 normal
particle cloud ~ ~1 ~ -7.51754097 0 2.73616115 0.08 0 normal
particle cloud ~ ~1 ~ -7.87846202 0 1.38918542 0.08 0 normal
particle cloud ~ ~1 ~ -8 0 0 0.08 0 normal
particle cloud ~ ~1 ~ -7.87846202 0 -1.38918542 0.08 0 normal
particle cloud ~ ~1 ~ -7.51754097 0 -2.73616115 0.08 0 normal
particle cloud ~ ~1 ~ -6.92820323 0 -4 0.08 0 normal
particle cloud ~ ~1 ~ -6.12835554 0 -5.14230088 0.08 0 normal
particle cloud ~ ~1 ~ -5.14230088 0 -6.12835554 0.08 0 normal
particle cloud ~ ~1 ~ -4 0 -6.92820323 0.08 0 normal
particle cloud ~ ~1 ~ -2.73616115 0 -7.51754097 0.08 0 normal
particle cloud ~ ~1 ~ -1.38918542 0 -7.87846202 0.08 0 normal
particle cloud ~ ~1 ~ 0 0 -8 0.08 0 normal
particle cloud ~ ~1 ~ 1.38918542 0 -7.87846202 0.08 0 normal
particle cloud ~ ~1 ~ 2.73616115 0 -7.51754097 0.08 0 normal
particle cloud ~ ~1 ~ 4 0 -6.92820323 0.08 0 normal
particle cloud ~ ~1 ~ 5.14230088 0 -6.12835554 0.08 0 normal
particle cloud ~ ~1 ~ 6.12835554 0 -5.14230088 0.08 0 normal
particle cloud ~ ~1 ~ 6.92820323 0 -4 0.08 0 normal
particle cloud ~ ~1 ~ 7.51754097 0 -2.73616115 0.08 0 normal
particle cloud ~ ~1 ~ 7.87846202 0 -1.38918542 0.08 0 normal

# ---- 地面扩散环 R=12（最外环，扩散最快） ----
particle cloud ~ ~1 ~ 12 0 0 0.1 0 normal
particle cloud ~ ~1 ~ 11.81769304 0 2.08377813 0.1 0 normal
particle cloud ~ ~1 ~ 11.27631145 0 4.10424172 0.1 0 normal
particle cloud ~ ~1 ~ 10.39230485 0 6 0.1 0 normal
particle cloud ~ ~1 ~ 9.19253332 0 7.71345132 0.1 0 normal
particle cloud ~ ~1 ~ 7.71345132 0 9.19253332 0.1 0 normal
particle cloud ~ ~1 ~ 6 0 10.39230485 0.1 0 normal
particle cloud ~ ~1 ~ 4.10424172 0 11.27631145 0.1 0 normal
particle cloud ~ ~1 ~ 2.08377813 0 11.81769304 0.1 0 normal
particle cloud ~ ~1 ~ 0 0 12 0.1 0 normal
particle cloud ~ ~1 ~ -2.08377813 0 11.81769304 0.1 0 normal
particle cloud ~ ~1 ~ -4.10424172 0 11.27631145 0.1 0 normal
particle cloud ~ ~1 ~ -6 0 10.39230485 0.1 0 normal
particle cloud ~ ~1 ~ -7.71345132 0 9.19253332 0.1 0 normal
particle cloud ~ ~1 ~ -9.19253332 0 7.71345132 0.1 0 normal
particle cloud ~ ~1 ~ -10.39230485 0 6 0.1 0 normal
particle cloud ~ ~1 ~ -11.27631145 0 4.10424172 0.1 0 normal
particle cloud ~ ~1 ~ -11.81769304 0 2.08377813 0.1 0 normal
particle cloud ~ ~1 ~ -12 0 0 0.1 0 normal
particle cloud ~ ~1 ~ -11.81769304 0 -2.08377813 0.1 0 normal
particle cloud ~ ~1 ~ -11.27631145 0 -4.10424172 0.1 0 normal
particle cloud ~ ~1 ~ -10.39230485 0 -6 0.1 0 normal
particle cloud ~ ~1 ~ -9.19253332 0 -7.71345132 0.1 0 normal
particle cloud ~ ~1 ~ -7.71345132 0 -9.19253332 0.1 0 normal
particle cloud ~ ~1 ~ -6 0 -10.39230485 0.1 0 normal
particle cloud ~ ~1 ~ -4.10424172 0 -11.27631145 0.1 0 normal
particle cloud ~ ~1 ~ -2.08377813 0 -11.81769304 0.1 0 normal
particle cloud ~ ~1 ~ 0 0 -12 0.1 0 normal
particle cloud ~ ~1 ~ 2.08377813 0 -11.81769304 0.1 0 normal
particle cloud ~ ~1 ~ 4.10424172 0 -11.27631145 0.1 0 normal
particle cloud ~ ~1 ~ 6 0 -10.39230485 0.1 0 normal
particle cloud ~ ~1 ~ 7.71345132 0 -9.19253332 0.1 0 normal
particle cloud ~ ~1 ~ 9.19253332 0 -7.71345132 0.1 0 normal
particle cloud ~ ~1 ~ 10.39230485 0 -6 0.1 0 normal
particle cloud ~ ~1 ~ 11.27631145 0 -4.10424172 0.1 0 normal
particle cloud ~ ~1 ~ 11.81769304 0 -2.08377813 0.1 0 normal

# ---- 上扬尘柱（沿 R=2.5 环，向量带 Y 分量上扬） ----
particle cloud ~ ~1 ~ 2.5 3.5 0 0.06 0 normal
particle cloud ~ ~1 ~ 2.41481457 3.5 0.64704761 0.06 0 normal
particle cloud ~ ~1 ~ 2.16506351 3.5 1.25 0.06 0 normal
particle cloud ~ ~1 ~ 1.76776695 3.5 1.76776695 0.06 0 normal
particle cloud ~ ~1 ~ 1.25 3.5 2.16506351 0.06 0 normal
particle cloud ~ ~1 ~ 0.64704761 3.5 2.41481457 0.06 0 normal
particle cloud ~ ~1 ~ 0 3.5 2.5 0.06 0 normal
particle cloud ~ ~1 ~ -0.64704761 3.5 2.41481457 0.06 0 normal
particle cloud ~ ~1 ~ -1.25 3.5 2.16506351 0.06 0 normal
particle cloud ~ ~1 ~ -1.76776695 3.5 1.76776695 0.06 0 normal
particle cloud ~ ~1 ~ -2.16506351 3.5 1.25 0.06 0 normal
particle cloud ~ ~1 ~ -2.41481457 3.5 0.64704761 0.06 0 normal
particle cloud ~ ~1 ~ -2.5 3.5 0 0.06 0 normal
particle cloud ~ ~1 ~ -2.41481457 3.5 -0.64704761 0.06 0 normal
particle cloud ~ ~1 ~ -2.16506351 3.5 -1.25 0.06 0 normal
particle cloud ~ ~1 ~ -1.76776695 3.5 -1.76776695 0.06 0 normal
particle cloud ~ ~1 ~ -1.25 3.5 -2.16506351 0.06 0 normal
particle cloud ~ ~1 ~ -0.64704761 3.5 -2.41481457 0.06 0 normal
particle cloud ~ ~1 ~ 0 3.5 -2.5 0.06 0 normal
particle cloud ~ ~1 ~ 0.64704761 3.5 -2.41481457 0.06 0 normal
particle cloud ~ ~1 ~ 1.25 3.5 -2.16506351 0.06 0 normal
particle cloud ~ ~1 ~ 1.76776695 3.5 -1.76776695 0.06 0 normal
particle cloud ~ ~1 ~ 2.16506351 3.5 -1.25 0.06 0 normal
particle cloud ~ ~1 ~ 2.41481457 3.5 -0.64704761 0.06 0 normal

# ---- 上扬尘柱（沿 R=4 环，更高更快） ----
particle cloud ~ ~1 ~ 4 4.5 0 0.08 0 normal
particle cloud ~ ~1 ~ 3.86370331 4.5 1.03527618 0.08 0 normal
particle cloud ~ ~1 ~ 3.46410162 4.5 2 0.08 0 normal
particle cloud ~ ~1 ~ 2.82842712 4.5 2.82842712 0.08 0 normal
particle cloud ~ ~1 ~ 2 4.5 3.46410162 0.08 0 normal
particle cloud ~ ~1 ~ 1.03527618 4.5 3.86370331 0.08 0 normal
particle cloud ~ ~1 ~ 0 4.5 4 0.08 0 normal
particle cloud ~ ~1 ~ -1.03527618 4.5 3.86370331 0.08 0 normal
particle cloud ~ ~1 ~ -2 4.5 3.46410162 0.08 0 normal
particle cloud ~ ~1 ~ -2.82842712 4.5 2.82842712 0.08 0 normal
particle cloud ~ ~1 ~ -3.46410162 4.5 2 0.08 0 normal
particle cloud ~ ~1 ~ -3.86370331 4.5 1.03527618 0.08 0 normal
particle cloud ~ ~1 ~ -4 4.5 0 0.08 0 normal
particle cloud ~ ~1 ~ -3.86370331 4.5 -1.03527618 0.08 0 normal
particle cloud ~ ~1 ~ -3.46410162 4.5 -2 0.08 0 normal
particle cloud ~ ~1 ~ -2.82842712 4.5 -2.82842712 0.08 0 normal
particle cloud ~ ~1 ~ -2 4.5 -3.46410162 0.08 0 normal
particle cloud ~ ~1 ~ -1.03527618 4.5 -3.86370331 0.08 0 normal
particle cloud ~ ~1 ~ 0 4.5 -4 0.08 0 normal
particle cloud ~ ~1 ~ 1.03527618 4.5 -3.86370331 0.08 0 normal
particle cloud ~ ~1 ~ 2 4.5 -3.46410162 0.08 0 normal
particle cloud ~ ~1 ~ 2.82842712 4.5 -2.82842712 0.08 0 normal
particle cloud ~ ~1 ~ 3.46410162 4.5 -2 0.08 0 normal
particle cloud ~ ~1 ~ 3.86370331 4.5 -1.03527618 0.08 0 normal

# ---- 外圈爆裂火星（R=12 环上的 crit 火花） ----
particle crit ~ ~1 ~ 4 0.8 0 0.15 0 normal
particle crit ~ ~1 ~ 3.93923101 0.8 0.69459271 0.15 0 normal
particle crit ~ ~1 ~ 3.75877048 0.8 1.36808057 0.15 0 normal
particle crit ~ ~1 ~ 3.46410162 0.8 2 0.15 0 normal
particle crit ~ ~1 ~ 3.06417777 0.8 2.57115044 0.15 0 normal
particle crit ~ ~1 ~ 2.57115044 0.8 3.06417777 0.15 0 normal
particle crit ~ ~1 ~ 2 0.8 3.46410162 0.15 0 normal
particle crit ~ ~1 ~ 1.36808057 0.8 3.75877048 0.15 0 normal
particle crit ~ ~1 ~ 0.69459271 0.8 3.93923101 0.15 0 normal
particle crit ~ ~1 ~ 0 0.8 4 0.15 0 normal
particle crit ~ ~1 ~ -0.69459271 0.8 3.93923101 0.15 0 normal
particle crit ~ ~1 ~ -1.36808057 0.8 3.75877048 0.15 0 normal
particle crit ~ ~1 ~ -2 0.8 3.46410162 0.15 0 normal
particle crit ~ ~1 ~ -2.57115044 0.8 3.06417777 0.15 0 normal
particle crit ~ ~1 ~ -3.06417777 0.8 2.57115044 0.15 0 normal
particle crit ~ ~1 ~ -3.46410162 0.8 2 0.15 0 normal
particle crit ~ ~1 ~ -3.75877048 0.8 1.36808057 0.15 0 normal
particle crit ~ ~1 ~ -3.93923101 0.8 0.69459271 0.15 0 normal
particle crit ~ ~1 ~ -4 0.8 0 0.15 0 normal
particle crit ~ ~1 ~ -3.93923101 0.8 -0.69459271 0.15 0 normal
particle crit ~ ~1 ~ -3.75877048 0.8 -1.36808057 0.15 0 normal
particle crit ~ ~1 ~ -3.46410162 0.8 -2 0.15 0 normal
particle crit ~ ~1 ~ -3.06417777 0.8 -2.57115044 0.15 0 normal
particle crit ~ ~1 ~ -2.57115044 0.8 -3.06417777 0.15 0 normal
particle crit ~ ~1 ~ -2 0.8 -3.46410162 0.15 0 normal
particle crit ~ ~1 ~ -1.36808057 0.8 -3.75877048 0.15 0 normal
particle crit ~ ~1 ~ -0.69459271 0.8 -3.93923101 0.15 0 normal
particle crit ~ ~1 ~ 0 0.8 -4 0.15 0 normal
particle crit ~ ~1 ~ 0.69459271 0.8 -3.93923101 0.15 0 normal
particle crit ~ ~1 ~ 1.36808057 0.8 -3.75877048 0.15 0 normal
particle crit ~ ~1 ~ 2 0.8 -3.46410162 0.15 0 normal
particle crit ~ ~1 ~ 2.57115044 0.8 -3.06417777 0.15 0 normal
particle crit ~ ~1 ~ 3.06417777 0.8 -2.57115044 0.15 0 normal
particle crit ~ ~1 ~ 3.46410162 0.8 -2 0.15 0 normal
particle crit ~ ~1 ~ 3.75877048 0.8 -1.36808057 0.15 0 normal
particle crit ~ ~1 ~ 3.93923101 0.8 -0.69459271 0.15 0 normal

# ---- 中心上升烟柱 ----
particle cloud ~ ~1 ~ 0 4 0 0.07 0 normal
particle cloud ~ ~1.2 ~ 0.8 3 0.4 0.07 0 normal
particle cloud ~ ~1.2 ~ -0.6 3.2 -0.8 0.07 0 normal
particle cloud ~ ~1.5 ~ 1.2 2.6 -1 0.07 0 normal
particle cloud ~ ~1.5 ~ -1.1 2.8 0.9 0.07 0 normal