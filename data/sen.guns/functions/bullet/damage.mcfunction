

#
data modify storage senba.damage {} merge from entity @e[type=marker,tag=sen.guns-bullet,limit=1,sort=nearest] data.SenGuns.Damage
function senba.damage:main


#kill
kill @e[type=marker,tag=sen.guns-bullet,limit=1,sort=nearest]
