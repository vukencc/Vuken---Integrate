execute if score @s melee.swap.cd matches 1.. run return fail
execute store result score @s melee.swap.cd run function core:custom_ench/aptitude/cal {time:240}

scoreboard players set @s warrior.contract -160
execute if score @s melee.swap matches 1 run function vfam:add {target:"@s",effect:attack_damage,id:warrior_contract,value:0.25,duration:160,type:add_multiplied_total}
execute if score @s melee.swap matches 2 run function vfam:add {target:"@s",effect:attack_damage,id:warrior_contract,value:0.4,duration:160,type:add_multiplied_total}

playsound entity.wither.spawn hostile @s ~ ~ ~

particle large_smoke ~ ~1 ~ 0.652630961100258 0 4.95722430686905 0.1 0 normal
particle large_smoke ~ ~1 ~ 1.2940952255126 0 4.82962913144534 0.1 0 normal
particle large_smoke ~ ~1 ~ 1.91341716182545 0 4.61939766255643 0.1 0 normal
particle large_smoke ~ ~1 ~ 3.0438071450436 0 3.96676670145618 0.1 0 normal
particle large_smoke ~ ~1 ~ 3.53553390593274 0 3.53553390593274 0.1 0 normal
particle large_smoke ~ ~1 ~ 3.96676670145618 0 3.0438071450436 0.1 0 normal
particle large_smoke ~ ~1 ~ 4.61939766255643 0 1.91341716182545 0.1 0 normal
particle large_smoke ~ ~1 ~ 4.82962913144534 0 1.2940952255126 0.1 0 normal
particle large_smoke ~ ~1 ~ 4.95722430686905 0 0.652630961100259 0.1 0 normal
particle large_smoke ~ ~1 ~ 4.95722430686905 0 -0.652630961100258 0.1 0 normal
particle large_smoke ~ ~1 ~ 4.82962913144534 0 -1.2940952255126 0.1 0 normal
particle large_smoke ~ ~1 ~ 4.61939766255643 0 -1.91341716182545 0.1 0 normal
particle large_smoke ~ ~1 ~ 3.96676670145618 0 -3.04382071450436 0.1 0 normal
particle large_smoke ~ ~1 ~ 3.53553390593274 0 -3.53553390593274 0.1 0 normal
particle large_smoke ~ ~1 ~ 3.0438071450436 0 -3.96676670145618 0.1 0 normal
particle large_smoke ~ ~1 ~ 1.91341716182545 0 -4.61939766255643 0.1 0 normal
particle large_smoke ~ ~1 ~ 1.29409522551261 0 -4.82962913144534 0.1 0 normal
particle large_smoke ~ ~1 ~ 0.652630961100258 0 -4.95722430686905 0.1 0 normal
particle large_smoke ~ ~1 ~ -0.652630961100257 0 -4.95722430686905 0.1 0 normal
particle large_smoke ~ ~1 ~ -1.2940952255126 0 -4.82962913144534 0.1 0 normal
particle large_smoke ~ ~1 ~ -1.91341716182545 0 -4.61939766255643 0.1 0 normal
particle large_smoke ~ ~1 ~ -3.0438071450436 0 -3.96676670145618 0.1 0 normal
particle large_smoke ~ ~1 ~ -3.53553390593274 0 -3.53553390593274 0.1 0 normal
particle large_smoke ~ ~1 ~ -3.96676670145618 0 -3.0438071450436 0.1 0 normal
particle large_smoke ~ ~1 ~ -4.61939766255643 0 -1.91341716182545 0.1 0 normal
particle large_smoke ~ ~1 ~ -4.82962913144534 0 -1.2940952255126 0.1 0 normal
particle large_smoke ~ ~1 ~ -4.95722430686905 0 -0.652630961100258 0.1 0 normal
particle large_smoke ~ ~1 ~ -4.95722430686905 0 0.652630961100256 0.1 0 normal
particle large_smoke ~ ~1 ~ -4.82962913144534 0 1.2940952255126 0.1 0 normal
particle large_smoke ~ ~1 ~ -4.61939766255643 0 1.91341716182545 0.1 0 normal
particle large_smoke ~ ~1 ~ -3.96676670145618 0 3.0438071450436 0.1 0 normal
particle large_smoke ~ ~1 ~ -3.53553390593274 0 3.53553390593274 0.1 0 normal
particle large_smoke ~ ~1 ~ -3.0438071450436 0 3.96676670145618 0.1 0 normal
particle large_smoke ~ ~1 ~ -1.91341716182545 0 4.61939766255643 0.1 0 normal
particle large_smoke ~ ~1 ~ -1.2940952255126 0 4.82962913144534 0.1 0 normal
particle large_smoke ~ ~1 ~ -0.652630961100258 0 4.95722430686905 0.1 0 normal