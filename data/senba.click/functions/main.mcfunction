#キル
kill @e[type=armor_stand,tag=senba.click]

#持ち物チェック
execute as @a[nbt={SelectedItem:{tag:{sen.clicks:1b}}}] at @s anchored eyes positioned ^ ^ ^0.1 positioned ~ ~-0.8 ~ run summon armor_stand ^ ^ ^ {DisabledSlots:2031614,Invisible:1b,NoGravity:0b,ShowArms:1b,Small:1b,Tags:[senba.click]}
