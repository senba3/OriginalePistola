
#実績解除
advancement revoke @s only sen.guns:hand

#祝初
execute unless entity @s[nbt={SelectedItem:{tag:{SenPistol:{}}}}] run item modify entity @s weapon sen.guns:bigin


#タイマー
execute unless entity @s[nbt={SelectedItem:{tag:{SenPistol:{Load:0,Charge:0}}}}] run function sen.guns:gun/timer

