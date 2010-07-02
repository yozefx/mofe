Function getmenufighters()

tempdir=ReadDir(startdir$+"\"+"Fighters\")
fightnum = 0
Repeat
tempfile$=NextFile$(tempdir)

If FileType(startdir$+"\"+"Fighters\"+tempfile$) = 2 And tempfile$ <> "." And tempfile$ <> ".." Then
d:fighter = New fighter
fightnum = fightnum + 1
d.fighternum = fightnum
tempshitass = tempshitass + 1
d.fname$ = tempfile$
d.fid$ = tempfile$
d.fanim$ = "intro"
tempdir2=ReadDir(startdir$+"\"+"Fighters\"+tempfile$)
tempfile2$ = "p"
While tempfile2$ <> ""
tempfile2$=NextFile$(tempdir2)
tempfile2$ = Lower(tempfile2$)
If Instr(tempfile2$,".mfe",1) <> 0 Or Instr(tempfile2$,".MFE",1) <> 0 Then
d.dfile$ = startdir$+"\"+"Fighters\"+tempfile$+"\"+tempfile2$
If d.dfile$ <> "" Then
d.Stream = OpenFile(d.dfile$)
'Print "datafile "+p\datafile$
turd = ReadInt(d.Stream)
d.charid$ = ReadString(d.Stream,turd)
d.vit = ReadInt(d.Stream)
d.spd = ReadInt(d.Stream)
d.def = ReadInt(d.Stream)
d.pow = ReadInt(d.Stream)
d.spr = ReadInt(d.Stream)
d.will = ReadInt(d.Stream)
CloseFile( d.Stream ) 
EndIf

EndIf
If Instr(tempfile2$,".png",1) <> 0 Or Instr(tempfile2$,".PNG",1) <> 0 Then
If Instr(tempfile2$,"selb",1) <> 0 Then
d.selb = LoadImage(startdir$+"\"+"Fighters\"+tempfile$+"\"+tempfile2$)
'MaskImage d.selb,255,0,255
EndIf
If Instr(tempfile2$,"sels",1) <> 0 Then
d.sels = LoadImage(startdir$+"\"+"Fighters\"+tempfile$+"\"+tempfile2$)
'MaskImage d.sels,255,0,255
EndIf

EndIf
Cls
SetScale( 2,2 )
DrawImage mainload,0,0
'Color Rnd(1,255),Rnd(1,255),Rnd(1,255)

DrawText "Loading: Fighters "+tempfile$+" "+tempfile2$,0,0
'a debug code
'If maindebug = True Then 

Flip 'nbg 'flipCanvas nbg 'FlipCanvas nbg 'flipCanvas nbg 'FlipCanvas nbg 'Flip
SetScale( 1,1 )

Wend
EndIf
If Trim(tempfile$)="" Then
DebugLog "elvis has left the building"
Return 
EndIf
Forever

End Function








Function getimpacts()


' i broke this down into three types For impacts And some other things like fballs
' this Type is just To store the main types of impacts And some Default properties For them
i:impact = New impact
i.iid$ = "bimpact"
i:impact = New impact
i.iid$ = "simpact"
i:impact = New impact
i.iid$ = "wimpact"
i:impact = New impact
i.iid$ = "charge"
Print "created impact types"

'Right here im checking the sprites directory For any image files To load all the impact frames
tempdir=ReadDir(startdir$+"\sprites\")
tempfile$ = "poop"
Repeat
tempfile$=NextFile$(tempdir)
Print "tempfile: "+tempfile$+ startdir$+"\sprites\" 
'If tempdir finds a png file it will load it.. otherwise its skipped
If Instr(Lower(tempfile$),".png",1) <> 0 Then
'im only gonna allow 20 frames in an animation.. mainly because the loading time will take For ever To load
'more than 20 frames on each animation
For tempnum = 1 To 20
'checking To see what frame number the image is
If Instr(tempfile$,tempnum,1) <> 0 Then
'grabbing the name of the animation.. this way If the file matches up To an impact Type it will play.. 
'otherwise the image wont be used
animtemp2$ = Lower(Replace(tempfile$,tempnum,""))

For i:impact = EachIn impact_list
If Instr(animtemp2$,i.iid$,1) <> 0 Then
'here we create an animation Type For the animation it matches with
u:impctframe = New impctframe
'now we actually load that frame into the memory as an animation frames
u.fframe = LoadImage(startdir$+"\sprites\"+tempfile$)
'MaskImage u\fframe,255,0,255
'masking the image


' here what im doing is taking that same image And FlipCanvas nbg 'flipCanvas nbg 'FlipCanvas nbg 'flipCanvas nbg 'FlipCanvas nbg 'flipCanvas nbg 'FlipCanvas nbg 'flipping it so it can be displayed If the impact is facing
'the other direction
'u.fframe2 = CopyImage(u\fframe)
'MaskImage u\fframe2,255,0,255
'resizextemp1 = 0 - ImageWidth(u\fframe)
'ResizeImage u\fframe2,resizextemp1,ImageHeight(u\fframe)
'here im adding this in as a loop To display a loading screen While im grabbing all those images
Cls
SetScale( 2,2 )
DrawImage mainload,0,0
'Color Rnd(1,255),Rnd(1,255),Rnd(1,255)
DrawText "Loading: Impact GFX "+startdir$+"\sprites\"+tempfile$,0,0
'a debug code
'If maindebug = True Then 
Print startdir$+"\sprites\"+tempfile$
Flip 'nbg 'flipCanvas nbg 'FlipCanvas nbg 'flipCanvas nbg 'FlipCanvas nbg 'Flip
SetScale( 1,1 )
u.iid$ = i.iid$
u.fnum = tempnum
'just making sure that when the last frame loads.. that IS the last frame used
If tempnum > i.nof Then i.nof = tempnum
EndIf

Next
EndIf
Next
EndIf
If tempfile$="" Then 
Print "all done exiting function"
Return

EndIf
'exits the main loading loop once we run out of files To load 
Forever

End Function


Function geteditorfighters()
SetGraphics(CanvasGraphics(canvas))
SetBlend(ALPHABLEND)
'Print CurrentDir$()
Local file$,file2$
Local thedir2,thedir3
Local thedir=ReadDir(CurrentDir$()+"\Fighters\")
Local fightnum
'Print CurrentDir$()
Repeat
file$=NextFile$(thedir)

'Print file$

If FileType(CurrentDir$()+"\Fighters\"+file$) = 2 And file$ <> "." And file$ <> ".." Then
f:fighter = New fighter
fightnum = fightnum + 1
f.fighternum = fightnum
tempshitass = tempshitass + 1
f.fname$ = Lower(file$)
Print "Grabbing "+file$
f.spoints = 20
f.fid$ = Lower(file$)
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ = "stand"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="walk"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="crouch"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="jump"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="block"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="cblock"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="hurt"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="churt"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="intro"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="lose"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="outro"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="taunt"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="pthrow"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="kthrow"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="wpunch"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="spunch"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="wkick"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="skick"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="apunch"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="cpunch"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="akick"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="ckick"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="fireb"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="fball"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="firebx"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="fballx"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="dash"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="dashx"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="special"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="specialx"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="fatal"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="powerup"
a:animdata  =  New animdata
a.fid$ = f.fid$
a.fighternum = f.fighternum
a.fanim$ ="maxpow"
		tempshit = 1
		thedir3=ReadDir(CurrentDir$()+"\Fighters\"+file$)
		file3$="l"
		While file3$ <> ""
		file3$ = NextFile$(thedir3)
		tempshit = tempshit + 1
		Wend 
		tempshit2# = 1
		'Print Str(tempshit)
thedir2=ReadDir(CurrentDir$()+"\Fighters\"+file$)
file2$ = "p"
While file2$ <> ""
file2$=NextFile$(thedir2)
file2$ = Lower(file2$)
If Instr(file2$,".png",1) <> 0 Or Instr(file2$,".PNG",1) <> 0 Then
animtemp1$ = Replace(file2$,".png","")
tempshit3# = tempshit2# / tempshit

		'Print Str(tempshit3#)
		Cls
		'DrawBlock image,0,0
DrawImage Splash,0,0
SetColor 0,0,0
DrawText "Loading Char: "+file$+" "+file2$,176,1
SetColor 255,255,255
DrawText "Loading Char: "+file$+" "+file2$,175,0

		UpdateProgBar Progress,tempshit3#
		Flip
		tempshit2# = tempshit2# + 1
For tempnum = 1 To 20
'If Instr(animtemp1$,tempnum,1) <> 0 Then
If Instr(animtemp1$,tempnum,1) <> 0 And Instr(animtemp1$,tempnum+10,1) = 0 Then

animtemp2$ = Replace(animtemp1$,tempnum,"")
g:frame = New frame
'Print file2$
SetMaskColor(255,0,255)
g.fframe = LoadImage(CurrentDir$()+"\Fighters\"+file$+"\"+file2$,MASKEDIMAGE|FILTEREDIMAGE)

'MaskImage g\fframe,255,0,255
g.fid$ = f.fid$
g.fighternum = f.fighternum
g.fanim$ = Lower$(animtemp2$)
g.fnum = tempnum
EndIf
Next
EndIf
Wend
EndIf
If file$="" Then 
FreeGadget window
Return 
EndIf
Forever

End Function