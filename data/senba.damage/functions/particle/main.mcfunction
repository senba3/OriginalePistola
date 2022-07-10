#与えるダメージか体力が無くなるまでパーティクルを表示しながらループ
scoreboard players remove @s senbaD.particle 1
scoreboard players remove @s senbaD.damage 100
execute as @s[scores={senbaD.particle=1..,senbaD.damage=99..}] at @s anchored eyes positioned ^ ^ ^ if data storage senba.damage {hurt_particle:1b} run particle damage_indicator ~ ~-0.6 ~ 0.2 0.2 0.2 0 1
execute as @s[scores={senbaD.particle=1..,senbaD.damage=99..}] at @s anchored eyes positioned ^ ^ ^ if data storage senba.damage {blood_particle:1b} run particle block red_wool ~ ~-0.6 ~ 0.05 0.05 0.05 0 3
execute as @s[scores={senbaD.particle=1..,senbaD.damage=100..}] at @s run function senba.damage:particle/main
