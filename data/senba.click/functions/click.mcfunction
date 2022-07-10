#進捗ロック 検知狩野永徳にする
advancement revoke @s only senba.click:click

#アイテムを復元 アマスタにアイテムが持って行かれた
scoreboard objectives add senba.damage dummy
execute anchored eyes positioned ^ ^ ^0.1 positioned ~ ~-0.8 ~ as @e[type=armor_stand,tag=senba.click] store result score @s senba.damage run data get entity @p SelectedItem.Count
execute anchored eyes positioned ^ ^ ^0.1 positioned ~ ~-0.8 ~ run scoreboard players add @e[type=armor_stand,tag=senba.click] senba.damage 1
execute anchored eyes positioned ^ ^ ^0.1 positioned ~ ~-0.8 ~ as @e[type=armor_stand,tag=senba.click] store result entity @s HandItems[0].Count float 1 run scoreboard players get @s senba.damage
execute anchored eyes positioned ^ ^ ^0.1 positioned ~ ~-0.8 ~ run item replace entity @s[gamemode=!creative] weapon.mainhand from entity @e[type=armor_stand,tag=senba.click,limit=1,sort=nearest] weapon.mainhand
scoreboard objectives remove senba.damage

#ファンクション実行 まとめて実行！
function #senba.click:click

#処理
execute positioned ~ ~0.35 ~ run kill @e[type=armor_stand,tag=senba.click,limit=1,sort=nearest]