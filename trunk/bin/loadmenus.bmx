' like i said loading main menu images and some loading screens
SetBlend(ALPHABLEND)

SetAlpha(1)
SetMaskColor(255,0,255)
'Global logo = LoadImage("logo.png",MASKEDIMAGE)
'Global arcadem = LoadImage("menu\arcade.png",MASKEDIMAGE|DYNAMICIMAGE)
'Global multiplay = LoadImage("menu\multi.png",MASKEDIMAGE|DYNAMICIMAGE)
'Global optionim = LoadImage("menu\options.png",MASKEDIMAGE)
'Global exitim = LoadImage("menu\exit.png",MASKEDIMAGE)
Global hgameim = LoadImage("menu\hgame.png",MASKEDIMAGE|FILTEREDIMAGE)
Global jgameim = LoadImage("menu\jgame.png",MASKEDIMAGE|FILTEREDIMAGE)
Global mpmenuim = LoadImage("menu\mpmenu.png",MASKEDIMAGE|FILTEREDIMAGE)
Global sparkle[10]
sparkle[0] = LoadImage("menu\sparkle.png",MASKEDIMAGE|FILTEREDIMAGE)
sparkle[1] = LoadImage("menu\sparkle.png",MASKEDIMAGE|FILTEREDIMAGE)
sparkle[2] = LoadImage("menu\sparkle.png",MASKEDIMAGE|FILTEREDIMAGE)
sparkle[3] = LoadImage("menu\sparkle.png",MASKEDIMAGE|FILTEREDIMAGE)
sparkle[4] = LoadImage("menu\sparkle.png",MASKEDIMAGE|FILTEREDIMAGE)
sparkle[5] = LoadImage("menu\sparkle.png",MASKEDIMAGE|FILTEREDIMAGE)
sparkle[6] = LoadImage("menu\sparkle.png",MASKEDIMAGE|FILTEREDIMAGE)
sparkle[7] = LoadImage("menu\sparkle.png",MASKEDIMAGE|FILTEREDIMAGE)
sparkle[8] = LoadImage("menu\sparkle.png",MASKEDIMAGE|FILTEREDIMAGE)
sparkle[9] = LoadImage("menu\sparkle.png",MASKEDIMAGE|FILTEREDIMAGE)

Global barim = LoadImage("menu\bar.png",MASKEDIMAGE|FILTEREDIMAGE)
Global bgtile = LoadImage("menu\bgtile.png",MASKEDIMAGE|FILTEREDIMAGE)
Global noimage = LoadImage("menu\noim.png",MASKEDIMAGE|FILTEREDIMAGE)
Global pshadows = LoadImage("menu\shadow.png",MASKEDIMAGE|FILTEREDIMAGE)
'MidHandle pshadows
Global Rounda[8]
Rounda[0] = LoadImage("menu\round1.png",MASKEDIMAGE|FILTEREDIMAGE)
SetImageHandle( Rounda[0],ImageWidth(Rounda[0])/2,ImageHeight(Rounda[0])/2 )
Rounda[1] = LoadImage("menu\round2.png",MASKEDIMAGE|FILTEREDIMAGE)
SetImageHandle( Rounda[1],ImageWidth(Rounda[1])/2,ImageHeight(Rounda[1])/2 )
Rounda[2] = LoadImage("menu\round3.png",MASKEDIMAGE|FILTEREDIMAGE)
SetImageHandle( Rounda[2],ImageWidth(Rounda[2])/2,ImageHeight(Rounda[2])/2 )
Global fightim = LoadImage("menu\fight.png",MASKEDIMAGE|FILTEREDIMAGE)
SetImageHandle( fightim,ImageWidth(fightim)/2,ImageHeight(fightim)/2 )

Global lifebarim = LoadImage("menu\lifebar.png",MASKEDIMAGE|FILTEREDIMAGE)
Global koim = LoadImage("menu\ko.png",MASKEDIMAGE|FILTEREDIMAGE)
SetImageHandle( koim,ImageWidth(koim)/2,ImageHeight(koim)/2 )
Global perfectim = LoadImage("menu\perfect.png",MASKEDIMAGE|FILTEREDIMAGE)
SetImageHandle( perfectim,ImageWidth(perfectim)/2,ImageHeight(perfectim)/2 )

Global etype0 = LoadImage("menu\typem.png",MASKEDIMAGE|FILTEREDIMAGE)
Global etype1 = LoadImage("menu\typeo.png",MASKEDIMAGE|FILTEREDIMAGE)
Global etype2 = LoadImage("menu\typef.png",MASKEDIMAGE|FILTEREDIMAGE)
Global etype3 = LoadImage("menu\typee.png",MASKEDIMAGE|FILTEREDIMAGE)

Global ebar[5]
ebar[0] = LoadImage("menu\ebarm.png",MASKEDIMAGE|FILTEREDIMAGE)
ebar[1] = LoadImage("menu\ebaro.png",MASKEDIMAGE|FILTEREDIMAGE)
ebar[2] = LoadImage("menu\ebarf.png",MASKEDIMAGE|FILTEREDIMAGE)
ebar[3] = LoadImage("menu\ebare.png",MASKEDIMAGE|FILTEREDIMAGE)
ebar[4] = LoadImage("menu\ebarx.png",MASKEDIMAGE|FILTEREDIMAGE)

Global fload = LoadImage("menu\fload.png",MASKEDIMAGE|FILTEREDIMAGE)
Global overlay = LoadImage("menu\overlay.png",MASKEDIMAGE|FILTEREDIMAGE)
Global mainload = LoadImage("menu\mainload.png",MASKEDIMAGE|FILTEREDIMAGE)
Global floadbar = LoadImage("menu\loadbar.png",MASKEDIMAGE|FILTEREDIMAGE)
Global floadb = LoadImage("menu\loadb.png",MASKEDIMAGE|FILTEREDIMAGE)



Global sttvit = LoadImage("menu\vit.png",MASKEDIMAGE|FILTEREDIMAGE)
Global sttspd = LoadImage("menu\spd.png",MASKEDIMAGE|FILTEREDIMAGE)
Global sttdef = LoadImage("menu\def.png",MASKEDIMAGE|FILTEREDIMAGE)
Global sttpow = LoadImage("menu\pow.png",MASKEDIMAGE|FILTEREDIMAGE)
Global sttspr = LoadImage("menu\spr.png",MASKEDIMAGE|FILTEREDIMAGE)
Global sttwill = LoadImage("menu\will.png",MASKEDIMAGE|FILTEREDIMAGE)
Global flare = LoadImage("sun.png",MASKEDIMAGE)
SetImageHandle( flare,ImageWidth(flare)/2,ImageHeight(flare)/2 )
'MaskImage sttvit,255,0,255
'MaskImage sttspd,255,0,255
'MaskImage sttdef,255,0,255
'MaskImage sttpow,255,0,255
'MaskImage sttspr,255,0,255
'MaskImage sttwill,255,0,255




'giving all those menus that require transparency
'MaskImage floadbar,255,0,255
'MaskImage floadb,255,0,255

'MaskImage mainload,255,0,255
'MaskImage overlay,255,0,255
'MaskImage mpmenuim,255,0,255

'MaskImage hgameim,255,0,255
'MaskImage jgameim,255,0,255

'MaskImage ebarm,255,0,255
'MaskImage ebaro,255,0,255
'MaskImage ebarf,255,0,255
'MaskImage ebare,255,0,255
'MaskImage koim,255,0,255

'MaskImage etype0,255,0,255
'MaskImage etype1,255,0,255
'MaskImage etype2,255,0,255
'MaskImage etype3,255,0,255

'MaskImage lifebarim,255,0,255
'MaskImage fightim,255,0,255
'MaskImage rnd1,255,0,255
'MaskImage rnd2,255,0,255
'MaskImage rnd3,255,0,255

'MaskImage pshadows,255,0,255
'MaskImage arcadem,255,0,255
'MaskImage multiplay,255,0,255
'MaskImage optionim,255,0,255
'MaskImage exitim,255,0,255
'making some different preset font sizes for the game
Global fntArialB=LoadImageFont("sandoval.ttf",24,SMOOTHFONT) 
Global fntArialA=LoadImageFont("sandoval.ttf",11,SMOOTHFONT) 
Global fntArialC=LoadImageFont("sandoval.ttf",32,SMOOTHFONT)
Global fntArialD = LoadImageFont("sandoval.ttf",18,SMOOTHFONT)
DebugLog fntArialD
SetImageFont fntArialD
'making sure that the first fighter goes first in the selection screen
Global selectedfighter = 1
'loading all the default sounds for the game
Global menuselsnd = LoadSound("wav\menu.wav")
Global menuentsnd = LoadSound("wav\select.wav")
Global rndsound[9]
rndsound[0] = LoadSound("wav\rd1.wav")
rndsound[1] = LoadSound("wav\rd2.wav")
rndsound[2] = LoadSound("wav\rd3.wav")
Global fightsnd = LoadSound("wav\fight.wav")
Global blocksnd = LoadSound("wav\block.wav")
Global shitsnd = LoadSound("wav\hit2.wav")
Global whitsnd = LoadSound("wav\hit1.wav")
Global victsnd = LoadSound("wav\ko.wav")
Global perfectsnd = LoadSound("wav\perfect.wav")
Global donewithit = False

'lets  get all the impact gfx

'Include "getimpacts.bmx"
