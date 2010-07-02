Import "bin\bbtype.bmx"
Import "bin\bbvkey.bmx"
Graphics 640,480,0,60
'Global mywin = CreateWindow("M.O.F.E. v1.72b",GadgetWidth(Desktop())/4,GadgetHeight(Desktop())/4,640,500,Desktop(),WINDOW_TITLEBAR|WINDOW_RESIZABLE )
'Global mypan = CreatePanel(0,0,640,480,mywin,PANEL_BORDER|PANEL_ACTIVE,"")
'Global nbg = CreateCanvas( 0,0,640,480,mypan,2 )
'ActivateGadget(mypan)
'SetGadgetLayout( nbg,EDGE_ALIGNED,EDGE_ALIGNED,EDGE_ALIGNED,EDGE_ALIGNED)
'SetGadgetShape nbg,0,0,640,480
'VWait = 1
'SetGraphics CanvasGraphics(nbg)

Include "bin\globals.bmx"
Include "bin\menufunctions.bmx"
'Include "bin\functions.bmx"
Include "bin\types.bmx"
Include "bin\loadmenus.bmx"
Include "bin\menu1.bmx"
Include "bin\lightning.bmx"

getselectionfighters()
p:player = New player
p.playernum = 1
p.playertype$ = P1TYPE$
p.fid$ = P1TYPE$+Rnd(1,1000)
p.char:fight = New fight
p.char.fighternum = 1
p.char.fname$ = "Evil Ryu"
p:player = New player
p.playernum = 2
p.playertype$ = P2TYPE$
p.fid$ = P2TYPE$+Rnd(1,1000)
p.char:fight = New fight
p.char.fighternum = 2
p.char.fname$ = "Evil Ryu"

loadfight()


Function loadfight()


Local lodps = 0
Local loadingadd = 0
Local loadingnum = 660
Local elfighto = -1

For p:player = EachIn player_list
If p.fid$ <> "" Then
lodps = lodps + 1
EndIf
Next

loadingnum = loadingnum * lodps
'go through all the players To find the first one
For p:player = EachIn player_list
'make sure its Not a blank player
If p.playertype$ <> "" Then
elfighto = elfighto + 1
loadingadd = 660 * elfighto
'another debug thing..
'If maindebug = True Then Print p.playertype$
'go through all the fight types To find the one that matches the one we selected in the menu


'now we got the fighter name lets open the fighters folder
tempdir=ReadDir(startdir$+"\Fighters\"+p.char.fname$)
'now we are gonna load the animations For the fighter
loadanimdata(p:player)
'i havent ran the NextFile command yet so this Var is blank.. so just For now we will add a filler
tempfile00$ = "12345"


While tempfile00$ <> ""
tempfile00$=NextFile$(tempdir)
tempfile00$=Lower(tempfile00$)
'make it Lower Case To prevent Case sensitive skipping of files
'If the file is a mfe file Then we are gonna load the data out of it
If Instr(tempfile00$,".mfe",1) <> 0 Then
'we will set this as the data file To load when we are done getting the animations
p.datafile$ = startdir$+"\"+"Fighters\"+p.char.fname$+"\"+tempfile00$
'i had problems before getting it To find the mfe file so i put this in To see what the prob was
'If maindebug = True Then Print datafile1+"+p.datafile$
EndIf
'If the file is an image Then we want To load it And find out what animation And frame it is
If Instr(tempfile00$,".png",1) <> 0 Then
'lets take out the .png extension from the name"
animtemp1$ = Replace(tempfile00$,".png","")

For tempnum = 1 To 20

'lets get the frame of this image so we are checking each number 1 -20 To find which frame number
'the file is like walk1 walk2 walk3 etc. etc.
If Instr(animtemp1$,tempnum,1) <> 0 And Instr(animtemp1$,tempnum+10,1) = 0 Then

'If it equals the number we are on Then we know what frame it is.. now lets chop out the number And
'get the animation name.
animtemp2$ = Replace(animtemp1$,tempnum,"")
'now that we know what anim it is And what frame lets make a frame Type To store the info
g:frame = New frame
'Right here im drawing a loading screen While this Function is running.
loadingadd = loadingadd + 1
loadamt# = Float(loadingadd) / Float(loadingnum)
Cls
DrawImage fload,0,0
'Color 0,0,0
'Text 1,1,"Loading: "+startdir$+"\"+"Fighters\"+p.char.fname$+"\"+tempfile00$
'Color 255,255,255
'Text 0,0,"Loading: "+startdir$+"\"+"Fighters\"+p.char.fname$+"\"+tempfile00$
'Text 0,30,"loadingnum:"+Str(loadingnum)+" loadingadd:"+Str(loadingadd)+" loadamt:"+Str(loadamt#)
'DrawImageRect floadb,60,180,0,0,Int(loadamt#*100)*2+11,17
DrawImage floadbar,60,180

Flip'Flip
'lets load the frame And stick it on the frame Type
'If maindebug = True Then Print tempfile00$
SetMaskColor(255,0,255)
g.fframe = LoadImage(startdir$+"\"+"Fighters\"+p.char.fname$+"\"+tempfile00$)
'MaskImage g.fframe,255,0,255
'g.fframe2 = CopyImage(g.fframe)
'MaskImage g.fframe2,255,0,255
' we need To Flip the image in Case the fighter is facing the other Direction
'resizextemp1 = 0 - ImageWidth(g.fframe)

'TFormImage g.fframe2,-1,0,0,1
'ResizeImage g.fframe2,resizextemp1,ImageHeight(g.fframe)

'MaskImage g.fframe,255,0,255
'lets assign this frame To the Right fighter
g.fid$ = p.char.fid$
g.fighternum = p.char.fighternum
g.fanim$ = Lower$(animtemp2$)
g.fnum = tempnum
EndIf
Next
EndIf
Wend
'now lets open that datafile we found
loadcharfight(p:player)
p.char.mlife = p.char.vit * 40
p.char.tmlife = p.char.mlife
p.char.plife# = p.char.tmlife / p.char.mlife * 270


'p.Stream = OpenFile("xo.xca")
'CloseFile( p.Stream ) 
tempdir=ReadDir(startdir$+"\")




EndIf
Next


End Function




Function loadanimdata(p:player)

a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ = "stand"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="walk"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="crouch"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="jump"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="block"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="cblock"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="hurt"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="churt"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="intro"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="lose"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="outro"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="taunt"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="pthrow"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="kthrow"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="wpunch"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="spunch"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="wkick"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="skick"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="apunch"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="cpunch"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="akick"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="ckick"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="fireb"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="fball"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="firebx"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="fballx"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="dash"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="dashx"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="special"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="specialx"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="fatal"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="powerup"
a:animdata  =  New animdata
a.fid$ = p.char.fid$
a.fighternum = p.char.fighternum
a.fanim$ ="maxpow"

End Function


Function loadcharfight(p:player)


'load fighter data

'first lets make sure they have their fighter in the correct folder

'tempfexists = False




p.Stream = ReadFile(p.datafile$)
ttint = ReadInt(p.Stream)
tempid$ = ReadString(p.Stream,ttint)

p.char.vit = ReadInt(p.Stream)
p.char.spd = ReadInt(p.Stream)
p.char.def = ReadInt(p.Stream)
p.char.pow = ReadInt(p.Stream)
p.char.spr = ReadInt(p.Stream)
p.char.will = ReadInt(p.Stream)
p.char.expts = ReadInt(p.Stream)
ttint = ReadInt(p.Stream)
p.char.password$ = ReadString(p.Stream,ttint)
temppass$ = p.char.password$
ttint = ReadInt(p.Stream)
p.char.fname$ = ReadString(p.Stream,ttint)
ttint = ReadInt(p.Stream)
p.char.ftname$ = ReadString(p.Stream,ttint)
p.char.spoints = ReadInt(p.Stream)
nulla2 = ReadInt(p.Stream)
ttint1 = ReadInt(p.Stream)
ttint2 = ReadInt(p.Stream)
ttint3 = ReadInt(p.Stream)
ttint4 = ReadInt(p.Stream)
ttint5 = ReadInt(p.Stream)
ttint6 = ReadInt(p.Stream)
ttint7 = ReadInt(p.Stream)

p.char.fireb$ = ReadString(p.Stream,ttint1)
p.char.firebx$ = ReadString(p.Stream,ttint2)
p.char.dash$ = ReadString(p.Stream,ttint3)
p.char.dashx$ = ReadString(p.Stream,ttint4)
p.char.spec$ = ReadString(p.Stream,ttint5)
p.char.specx$ = ReadString(p.Stream,ttint6)
p.char.fatal$ = ReadString(p.Stream,ttint7)
'tempfexists = True
'Else
'tempfexists = False



For ass = 0 To 32
For a:animdata = EachIn animdata_list
If a.fid$ = p.char.fid$ Then
If a.fanim$ = animations$[ass] Then
ttint = ReadInt(p.Stream)
Nulla$ = ReadString(p.Stream,ttint)
a.nof = ReadInt(p.Stream)
ttint = ReadInt(p.Stream)
Nulla$ = ReadString(p.Stream,ttint)
a.fhitf = ReadInt(p.Stream)
a.fhcolx = ReadInt(p.Stream)
a.fhcoly = ReadInt(p.Stream)
a.fdcolx = ReadInt(p.Stream)
a.fdcoly = ReadInt(p.Stream)
nulla2 = ReadInt(p.Stream)
a.frate = ReadInt(p.Stream)
a.halign = ReadInt(p.Stream)
tempfexists = True 
EndIf
EndIf
Next
Next
CloseFile p.Stream


End Function


