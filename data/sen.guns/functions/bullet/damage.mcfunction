

#ダメージを与える準備と実行  ダメージの設計図は発射時にマーカーに託してある
data modify storage senba.damage {} merge from entity @e[type=marker,tag=sen.guns-bullet,limit=1,sort=nearest] data.SenGuns.Damage
function senba.damage:main


#kill  当たった銃弾は消す
kill @e[type=marker,tag=sen.guns-bullet,limit=1,sort=nearest]
