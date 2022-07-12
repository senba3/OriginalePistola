
#実績解除  また頼むよ
advancement revoke @s only sen.guns:hand

#祝初  初めての方にはもれなくアイテムモディファイアを実行!!
execute unless entity @s[nbt={SelectedItem:{tag:{SenPistol:{}}}}] run item modify entity @s weapon sen.guns:count


#タイマー  タイマー部分に異常がないか検知
execute unless entity @s[nbt={SelectedItem:{tag:{SenPistol:{Load:0,Charge:0}}}}] run function sen.guns:gun/timer

