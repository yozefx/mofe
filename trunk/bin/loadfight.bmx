Function loadnetfight()

p:player = New player
p.playernum = 1
p.team = NETTEAM
p.playertype$ = P1TYPE$
p.fid$ = NETWID$
p.etype = P1ETYPE
p.char:fight = New fight
p.char.fighternum = 1
p.char.fname$ = P1FNAME$
p.char.fid$ = p.fid$
p.playerObj = localObj
transmitplayer(p:player)
GNetSync HOSTX
objList = GNetObjects( HOSTX )
For remoteObj = EachIn objList
If GNetObjectRemote( remoteObj ) = True And GNetObjectState( remoteObj ) <> GNET_MESSAGE Then
If GetGNetString( remoteObj,NETID ) <> NETWID$ Then
p:player = New player
p.playertype$ = "NET"
p.playerObj = remoteObj
p.char:fight = New fight
p.char.fname$ = GetGNetString( p.playerObj,NETFNAME )
p.fid$ = GetGNetString( p.playerObj,NETID )
'netplayercontrol(p:player)
EndIf
EndIf
Next




loadfight()
ENGINESTATUS$ = "NETWAIT"
SetGNetInt( localObj,NETFIGHTLOADED,1)

End Function

Function loadfight()
	Local bgsnd = LoadSound("music/loading.ogg",True)
	Local bgchannel = PlaySound(bgsnd)
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
			
			p.datafile$ = startdir$+"\Fighters\"+p.char.fname$+"\"+p.char.fname$+".mfe"
			'now we got the fighter name lets open the fighters folder
			'tempdir=ReadDir(startdir$+"\Fighters\"+p.char.fname$)
			'now we are gonna load the animations For the fighter
			'DebugLog "Loading Anim Data"
			loadanimdata(p:player)
			'i havent ran the NextFile command yet so this Var is blank.. so just For now we will add a filler
			'tempfile00$ = "12345"
	
			Rem
			While tempfile00$ <> ""
				tempfile00$=NextFile$(tempdir)
				tempfile00$=Lower(tempfile00$)
				'make it Lower Case To prevent Case sensitive skipping of files
				'If the file is a mfe file Then we are gonna load the data out of it
				If Instr(tempfile00$,".mfe",1) <> 0 Then
					'we will set this as the data file To load when we are done getting the animations
					DebugLog "found data "+tempfile00$
					p.datafile$ = startdir$+"\"+"Fighters\"+p.char.fname$+"\"+tempfile00$
					'i had problems before getting it To find the mfe file so i put this in To see what the prob was
					'If maindebug = True Then Print datafile1+"+p.datafile$
				EndIf
				'If the file is an image Then we want To load it And find out what animation And frame it is
				If Instr(tempfile00$,".png",1) <> 0 Then
					'lets take out the .png extension from the name"
					animtemp1$ = Replace(tempfile00$,".png","")
	
	
					'removing this for loop, there is a better way to do this.
					
					'For tempnum = 1 To 20
	
						'lets get the frame of this image so we are checking each number 1 -20 To find which frame number
						'the file is like walk1 walk2 walk3 etc. etc.
						'If Int(Right$(animtemp1$,2 )) > 0 And Int(Right$(animtemp1$,2 )) < 21 Then'Instr(animtemp1$,tempnum,1) <> 0 And Instr(animtemp1$,tempnum+10,1) = 0 Then
							
							If Int(Right$(animtemp1$,2 )) = 0 Then
								tempnum = Int(Right$(animtemp1$,1 ))
								
							Else
								tempnum = Int(Right$(animtemp1$,2 ))
								
							EndIf
							
							'tempnum = Int(Right$(animtemp1$,2 ))
							'If it equals the number we are on Then we know what frame it is.. now lets chop out the number And
							'get the animation name.
							animtemp2$ = Replace(animtemp1$,tempnum,"")
							'now that we know what anim it is And what frame lets make a frame Type To store the info
							g:frame = New frame
							'Right here im drawing a loading screen While this Function is running.
							loadingadd = loadingadd + 1
							loadamt# = Float(loadingadd) / Float(loadingnum)
							Cls
							glow#=Cos(MilliSecs()/4)
							lum#=(Abs(glow#*Sin(glow#))*100)
							
							SetColor(255-(255.0*lum#),0,255.0*lum#)
							DrawRect 0,0,640,480
							SetColor(255,255,255)
							DrawImage fload,0,0
							blitzmalen(0,200,640,200)
							If GNETSUCCESS <> True Then
								For d:fighter = EachIn fighter_list
	
									If d.fname$ = P1FNAME$ Then DrawImage d.selb,0,350-(ImageHeight(d.selb)*2)
									If d.fname$ = P2FNAME$ Then DrawImage d.selb,640-(ImageWidth(d.selb)*2),350-(ImageHeight(d.selb)*2)
	
	
								Next
	
								DrawText "VS",310,190
							EndIf
							'Color 0,0,0
							'Text 1,1,"Loading: "+startdir$+"\"+"Fighters\"+p.char.fname$+"\"+tempfile00$
							'Color 255,255,255
							'Text 0,0,"Loading: "+startdir$+"\"+"Fighters\"+p.char.fname$+"\"+tempfile00$
							'Text 0,30,"loadingnum:"+Str(loadingnum)+" loadingadd:"+Str(loadingadd)+" loadamt:"+Str(loadamt#)
							SetColor(255-Int(loadamt#*255),0,Int(loadamt#*255))
							DrawRect 126,460,Int(loadamt#*205),11
							SetColor(255,255,255)
							DrawImage floadbar,120,450
	
							Flip'Flip
							'lets load the frame And stick it on the frame Type
							'If maindebug = True Then Print tempfile00$
							SetMaskColor(255,0,255)
							DebugLog "loading image "+p.char.fname$+"\"+tempfile00$
							g.fframe = LoadImage(startdir$+"\"+"Fighters\"+p.char.fname$+"\"+tempfile00$,MASKEDIMAGE|FILTEREDIMAGE)
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
						'EndIf
					'Next
				EndIf
			Wend
			End Rem
			
			'now lets open that datafile we found
			DebugLog "Accessing Datafile"
			loadcharfight(p:player)
			DebugLog "Loaded Datafile"
			DebugLog "Loading Fighter Images"
			loadcharimages(p:player)
			
			p.char.mlife = p.char.vit * 40
			p.char.tmlife = p.char.mlife
			p.char.plife# = p.char.tmlife / p.char.mlife * 236
			
			
			'p.Stream = OpenFile("xo.xca")
			'CloseFile( p.Stream ) 
			'tempdir=ReadDir(startdir$+"\")
	
	
	
	
		EndIf
	Next

StopChannel bgchannel
End Function




Function loadanimdata(p:player)

a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ = "stand"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="walk"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="crouch"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="jump"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="block"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="cblock"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="hurt"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="churt"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="intro"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="lose"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="outro"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="taunt"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="pthrow"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="kthrow"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="wpunch"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="spunch"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="wkick"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="skick"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="apunch"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="cpunch"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="akick"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="ckick"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="fireb"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="fball"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="firebx"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="fballx"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="dash"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="dashx"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="special"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="specialx"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="fatal"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="powerup"
a:animdata  =  New animdata
ListAddLast(p.char.anim_list,a)
a.fanim$ ="maxpow"

End Function


Function loadcharimages(p:player)

	For a:animdata = EachIn p.char.anim_list
	
		For i = 1 To a.nof
		
			DebugLog "loading: "+startdir$+"\Fighters\"+p.char.fname$+"\"+a.fanim$+i+".png"
			a.frames[i-1] = LoadImage(startdir$+"\Fighters\"+p.char.fname$+"\"+a.fanim$+i+".png")
		
		
		Next
	
	Next

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
		For a:animdata = EachIn p.char.anim_list
			'If a.fid$ = p.char.fid$ Then
				If a.fanim$ = animations$[ass] Then
					ttint = ReadInt(p.Stream)
					Nulla$ = ReadString(p.Stream,ttint)
					a.nof = ReadInt(p.Stream)
					a.Setframes(a.nof)
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
			'EndIf
		Next
	Next
	CloseFile p.Stream


End Function


