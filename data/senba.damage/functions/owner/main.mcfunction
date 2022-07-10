# >main

#オーナー回収用スケジュール
schedule function senba.damage:owner/kill 2t

#ブレイズにはダメージが多くなってしまうんだ...
 #オーナー召喚
 execute as @s[tag=!senba.damage-killed] run summon snowball ~ ~-0.31 ~ {Tags:[senba.damage-owner,senba.damage-killed,senba.born],Motion:[0d,10d,0d],Silent:1b,Item:{id:"minecraft:paper",Count:1b,tag:{CustomModelData:3}}}
 execute as @s[tag= senba.damage-killed] run summon area_effect_cloud ~ ~ ~ {Tags:[senba.damage-owner,senba.damage-killed,senba.born],Radius:0f,Duration:6,Age:4,Effects:[{Id:6,Amplifier:28,Duration:2,ShowParticles:0b},{Id:7,Amplifier:28,Duration:2,ShowParticles:0b}]}
 #execute as @s[tag= senba.damage-killed] run summon evoker_fangs ~ ~ ~ {Tags:[senba.damage-owner,senba.damage-killed,senba.born],Warmup:-7}
 execute as @s[tag= senba.damage-killed] run data merge entity @s {Motion:[0d,0d,0d]}
 #頂いたUUIDを代入
 execute as @e[tag=senba.damage-owner,distance=..1] run data modify entity @s Owner set from storage senba.damage owner
 #誤感をなくすためタグ消し
 tag @s[distance=..1,tag=senba.damage-owner,tag=senba.born] remove senba.born

#ノックバック耐性(有志)
execute if data storage senba.damage {knockback:0b} run attribute @s[type=!player] minecraft:generic.knockback_resistance modifier add 85c48b3d-1671-4206-b1be-3a95a14d7e62 "1" 1 add

#死ぬならエフェクトとヘルスを...
data merge entity @s[tag=senba.damage-killed] {ActiveEffects:[],Health:0.001f}

#タグ付与
tag @s[type=!player,tag=!senba.damage-after] add senba.damage-after

#ストレージ回収
 data remove storage senba.damage owner
 data remove storage senba.damage knockback
