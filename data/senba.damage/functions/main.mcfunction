#  <使ひ方>
#
#/data merge storage senba.damage {damage:~~~,armor_rate:0~100,effect_rate:0~100,motion:0b/1b,real_damage:0b/1b,hurt_particle:0b/1b,blood_particle:0b/1b}
#/function senba.damage main

#  <今から計算していく計算式>
#
#(防御力-(ダメージ÷(2+防具強度÷4)))÷25=軽減率


# スコア生成
 scoreboard objectives add senbaD.damage dummy
 scoreboard objectives add senbaD.score dummy
 scoreboard objectives add senba.damage dummy
 scoreboard objectives add senbaD.particle dummy
 execute store result score @s senbaD.particle run data get entity @s Health 1
#必要な値をピックアップ
 scoreboard players set $10 senbaD.score 10
 scoreboard players set $100 senbaD.score 100
 scoreboard players set $101 senbaD.score 101
 scoreboard players set $1000 senbaD.score 1000
 execute store result score @s senba.damage run data get storage minecraft:senba.damage damage
 execute store result score @s senbaD.damage run scoreboard players get @s senba.damage


# 各ダメージ
 #防具ダメージ
  function senba.damage:armor/main
 #耐性エフェクト
  execute if entity @s[nbt={ActiveEffects:[{Id:11}]}] run function senba.damage:effect/main
 #なぜかダメージが1.01倍になってしまうのでそれを修正
  scoreboard players operation @s senbaD.damage *= $1000 senbaD.score
  scoreboard players operation @s senbaD.damage /= $101 senbaD.score
  scoreboard players operation @s senbaD.damage /= $10 senbaD.score

# ダメージを実行
 execute as @s[type=player,gamemode=!creative,gamemode=!spectator] at @s run function senba.damage:damage/player
 execute if data storage senba.damage {real_damage:0b} as @s[type=!player] at @s run function senba.damage:damage/other
 execute unless data storage senba.damage {real_damage:0b} as @s[type=!player] at @s run function senba.damage:damage/real

 #どのくらいのダメージを与えてるかを調べるもの。通常では動作しない
 #tellraw @a [{"text":"与えたダメージ:"},{"score":{"name":"@s","objective":"senbaD.damage"},"color":"gold"}]

# ダメージパーティクルを表示
 execute if data storage senba.damage {real_damage:0b} unless data storage senba.damage {hurt_particle:0b,blood_particle:0b} run function senba.damage:particle/main
 execute unless data storage senba.damage {real_damage:0b} as @s[type=!#senba.damage:ng_type,type=!ender_dragon] unless data storage senba.damage {hurt_particle:0b,blood_particle:0b} run function senba.damage:particle/main

# お片付け
 #ストレージ回収
  data remove storage senba.damage damage
  data remove storage senba.damage armor_rate
  data remove storage senba.damage effect_rate
  data remove storage senba.damage player_motion
  data remove storage senba.damage real_damage
  data remove storage senba.damage motion
  data remove storage senba.damage kill
  data remove storage senba.damage blood_particle
  data remove storage senba.damage hurt_particle
 #スコアボード回収
  scoreboard objectives remove senbaD.particle
  scoreboard objectives remove senbaD.damage
  scoreboard objectives remove senbaD.score
 #タグ回収
 tag @s[tag=senba.damage-totem] remove senba.damage-totem
