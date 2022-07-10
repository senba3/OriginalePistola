

# Damage
execute as @e[dy=0,type=!#senba_damage:ng_damage,tag=!sen.guns-shotted,tag=!senba.click] at @s run function sen.guns:bullet/damage

# GO!
tp @s ^ ^ ^1
execute unless block ^ ^ ^ #senba:air4 run kill @s[type=marker]
execute store result entity @s Air short 0.999999 run data get entity @s Air 1
particle dust 0.471 0.471 0.471 0.8 ~ ~ ~ 0.01 0.01 0.01 0 1 force @a

# Re.
execute as @s[nbt=!{Air:0s}] if block ^ ^ ^ #senba:air4 positioned ^ ^ ^1 run function sen.guns:bullet/go

#次tickのファンクション読み込み
schedule function sen.guns:bullet/ 1t
