title @s times 0t 2t 0t
scoreboard players set @s stdTemp3 360
scoreboard players operation @s stdTemp3 -= @s stdTemp2
title @s subtitle [{text:"<--- ",color:"#464fc4",bold:true,shadow_color:0},{score:{name:"@s",objective:"stdTemp3"},color:"#464fc4",bold:true,shadow_color:0},{text:"       ",color:"#a8fffb",bold:true},{score:{name:"@s",objective:"stdTemp2"},color:"#a8fffb",bold:true,shadow_color:0},{text:" --->",color:"#a8fffb",bold:true,shadow_color:0}]
title @s title {text:""}