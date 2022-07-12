
#進む
execute as @e[type=marker,tag=sen.guns-bullet] run data modify entity @s Air set from entity @s data.SenGuns.gun.Speed
execute as @e[type=marker,tag=sen.guns-bullet] store result entity @s PortalCooldown short 0.999999 run data get entity @s PortalCooldown
execute as @e[type=marker,tag=sen.guns-bullet] at @s run function sen.guns:bullet/go


#時効
kill @e[type=marker,tag=sen.guns-bullet,nbt={PortalCooldown:0}]

