
# プレイヤーが右クリックした事を折込ライブラリが検知したらこのファンクションが実行される。
#
#    右クリック検地ライブラリ： [ https://github.com/senba3/All-Clicks ]
#

execute as @s[nbt={SelectedItem:{tag:{SenPistol:{Load:0,Charge:0}}}}] run function sen.guns:gun/shot
