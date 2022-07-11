

#銃弾発射
execute anchored eyes run summon marker ^ ^-0.1 ^ {Tags:[sen.guns-bullet,sen.born]}

#アイテムの設計図を元に銃弾を演じる
data modify entity @e[type=marker,distance=..5,tag=sen.guns-bullet,limit=1,sort=nearest] data.SenGuns set from entity @s SelectedItem.tag.SenGuns
execute as @e[type=marker,distance=..5,tag=sen.guns-bullet,limit=1,sort=nearest] run data modify entity @s PortalCooldown set from entity @s data.SenGuns.gun.Move
data modify entity @e[type=marker,distance=..5,tag=sen.guns-bullet,limit=1,sort=nearest] Rotation set from entity @s Rotation
data modify entity @e[type=marker,distance=..5,tag=sen.guns-bullet,limit=1,sort=nearest] data.SenGuns.Damage.owner set from entity @s UUID


#次tickのファンクション読み込み
schedule function sen.guns:bullet/ 1t
schedule function sen.guns:tag 4t


# タグとか音とか
tag @s add sen.guns-shotted
tag @e[type=marker,tag=sen.born,tag=sen.guns-bullet] remove sen.born
playsound minecraft:entity.firework_rocket.blast master @a ~ ~ ~ 1 1.2
item modify entity @s weapon sen.guns:charge


#残弾数を1減らす
data modify storage senba tag set from entity @s SelectedItem.tag
execute store result storage senba tag.SenPistol.Count byte 0.999999 run data get storage senba tag.SenPistol.Count
item modify entity @s weapon senba:modify
execute if data storage senba {tag:{SenPistol:{Count:0b}}} run item modify entity @s weapon sen.guns:load
data remove storage senba tag
