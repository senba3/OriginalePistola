# >main

#スコア生成
 scoreboard objectives add senbaD.kyoudo dummy
 scoreboard objectives add senbaD.bougyo dummy
 scoreboard objectives add senbaD.keigen dummy

#計算に必要な物を作る
 scoreboard players set $-1 senbaD.score -1
 scoreboard players set $25 senbaD.score 25
 scoreboard players set @s senbaD.score 100
 scoreboard players set $200 senbaD.score 200
 scoreboard players set $10000 senbaD.score 10000
 #防御率カット
  execute store result score #senba.damage-armor senbaD.score run data get storage senba.damage armor_rate
  scoreboard players operation #senba.damage-armor senbaD.score *= $-1 senbaD.score
  scoreboard players operation #senba.damage-armor senbaD.score += $100 senbaD.score
  #値が異常だった場合に適当な値に引き戻す
  execute if score #senba.damage-armor senbaD.score matches ..-1 run scoreboard players set #senba.damage-armor senbaD.score 0
  execute if score #senba.damage-armor senbaD.score matches 100.. run scoreboard players set #senba.damage-armor senbaD.score 100
  execute if score #senba.damage-armor senbaD.score matches 101 run scoreboard players set #senba.damage-armor senbaD.score 100

#　防具チェック
 #ダメージ軽減
  #計算
   execute if entity @s[type=player,nbt={Inventory:[{tag:{Enchantments:[{id:"minecraft:protection"}]}}]}] run function senba.damage:armor/plyer
   execute if entity @s[type=!player,nbt={ArmorItems:[{tag:{Enchantments:[{id:"minecraft:protection"}]}}]}] run function senba.damage:armor/other
  #計算
   scoreboard players set @s senbaD.keigen 100
   scoreboard players operation @s senbaD.keigen -= #senba.damage-armorH senbaD.score
 #防御力
  execute store result score @s senbaD.bougyo run attribute @s minecraft:generic.armor get 1000
 #防具耐久
  execute store result score @s senbaD.kyoudo run attribute @s minecraft:generic.armor_toughness get 25
 #カットを適用
  scoreboard players operation @s senbaD.bougyo *= #senba.damage-armor senbaD.score
  scoreboard players operation @s senbaD.bougyo /= $100 senbaD.score
  scoreboard players operation @s senbaD.kyoudo *= #senba.damage-armor senbaD.score
  scoreboard players operation @s senbaD.kyoudo /= $100 senbaD.score
  

#計算に必要な物を作る
 scoreboard players set $25 senbaD.score 25
 scoreboard players set $10 senbaD.score 10
 scoreboard players set @s senbaD.score 100
 scoreboard players set $200 senbaD.score 200
 scoreboard players set $10000 senbaD.score 10000


#　計算
 #(2 + 防具強度 ÷ 4)
 scoreboard players operation @s senbaD.kyoudo += $200 senbaD.score
 #(ダメージ ÷ ())
 scoreboard players operation @s senbaD.damage /= @s senbaD.kyoudo
 #(防御力 – ())
 scoreboard players operation @s senbaD.bougyo -= @s senbaD.damage
 #() ÷ 25
 scoreboard players operation @s senbaD.bougyo /= $25 senbaD.score
 #後仕上げ
  scoreboard players operation @s senbaD.bougyo /= $10 senbaD.score
 scoreboard players operation @s senbaD.score -= @s senbaD.bougyo
 execute store result score @s senbaD.damage run scoreboard players get @s senba.damage
 scoreboard players operation @s senbaD.damage *= @s senbaD.score
 #エンチャのダメージ軽減
  scoreboard players operation @s senbaD.damage *= @s senbaD.keigen
  scoreboard players operation @s senbaD.damage /= $10000 senbaD.score

#スコア削除
  scoreboard objectives remove senbaD.keigen
  scoreboard objectives remove senbaD.kyoudo
  scoreboard objectives remove senbaD.bougyo