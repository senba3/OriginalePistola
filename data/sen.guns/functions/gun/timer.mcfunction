
# このファンクションでは、アイテムのクールタイムを計り、時間が0になることを目的とする。


#スコアやアイテム変換の準備   (プレイヤーから"data get"するのは重いらしいので、いっそのことアイテム変更用のストレージを先に移す。)
scoreboard objectives add sen.dummy dummy
data modify storage senba tag set from entity @s SelectedItem.tag


#クールタイム値  弾の補充とリチャージはめんどいので同時進行で行う
execute store result score #Charge sen.dummy run data get storage senba tag.SenPistol.Charge
execute store result score #Load sen.dummy run data get storage senba tag.SenPistol.Load

#引き算 思い切って両方引いてみる
scoreboard players remove #Charge sen.dummy 1
scoreboard players remove #Load sen.dummy 1


#代入
execute store result storage senba tag.SenPistol.Charge int 1 run scoreboard players get #Charge sen.dummy
execute store result storage senba tag.SenPistol.Load int 1 run scoreboard players get #Load sen.dummy
item modify entity @s weapon senba:modify

#比較
execute if score #Load sen.dummy matches ..0 if score #Charge sen.dummy matches ..0 if data storage senba {tag:{SenPistol:{Count:0b}}} run item modify entity @s weapon sen.guns:count
execute if score #Load sen.dummy matches ..0 if score #Charge sen.dummy matches ..0 run item modify entity @s weapon sen.guns:bigin


#かたずけ
scoreboard objectives remove sen.dummy
data remove storage senba tag

