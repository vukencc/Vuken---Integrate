# Runs before the map version gate, including on existing saves.
scoreboard objectives add assassin.pas1 dummy
scoreboard objectives add assassin.pas2 dummy
scoreboard objectives add assassin.pas3 dummy
scoreboard objectives add assassin.rc.duration custom:play_time
scoreboard objectives add assassin.3.duration custom:play_time
scoreboard objectives add assassin.4.duration custom:play_time
scoreboard objectives add assassin.7.count dummy
scoreboard objectives add assassin.7.step dummy
scoreboard objectives add assassin.3.interval dummy
scoreboard objectives add assassin.5.duration dummy
scoreboard objectives add assassin.5.fx dummy
scoreboard objectives add assassin.tmp dummy
scoreboard objectives add assassin.8.facing dummy
scoreboard objectives add assassin.8.health dummy
scoreboard objectives add assassin.8.threshold dummy
scoreboard players set $36000 assassin.8.facing 36000
scoreboard objectives add assassin.4.step dummy
scoreboard objectives add assassin.8.damage_dealt custom:damage_dealt

# Discard transient guards left by interrupted old damage callbacks.
tag @a remove assassin.skill.damage
tag @a remove assassin.skill.damage.new
tag @a remove assassin.8.attacker
tag @a remove assassin.native.open
