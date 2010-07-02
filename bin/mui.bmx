Function drawmainmenu()



'Color 255,255,255
'DrawText 0,0,"Version 1.72b Freeware not to be sold!"
'Text 0,0,"Freeware not to be Sold! Created by: Landon Ritchie"
'Text 0,10,"Music by: Bjorn Lynne http://www.shockwave-sound.com"
'totalDrivers=CountGfxDrivers() 

'For t = 1 To totalDrivers 
'Color 0,0,0
'Text 1,10*totalDrivers+1,Str(t)+".) " + GfxDriverName(t)+" Avail mem: "+AvailVidMem()
'Color 255,255,255
'Text 0,10*totalDrivers,Str(t)+".) " + GfxDriverName(t)+" Avail mem: "+AvailVidMem()
'Next
'Text 0,10,GfxDriverName(1)




'here by pressign up Or down you can scroll through the menu commands.
If kkeyhit = KEY_UP Then
	PlaySound menuselsnd
	selection = selection - 1
	If selection < 0 Then selection = 3
EndIf

If kkeyhit = KEY_DOWN Then
	PlaySound menuselsnd
	selection = selection + 1
	If selection > 3 Then selection = 0
EndIf

'when the user presses enter it executes the menu option they had selected
If kkeyhit = KEY_ENTER Then

	PlaySound menuentsnd
		If selection = 0 Then
		SetImageFont(fntArialB) 
		arcadeplayer = 1
		p:player = New player
		p.playernum = 1
		p.selectedfighter = 1
		p.team = 1
		
		p.colred = Rnd(20,255)
		p.colgreen = Rnd(20,255)
		p.colblue = Rnd(20,255)
		p.playertype$ = "human"
		p.direction= 0
		tempfamnt = 0
		'Include "bin\getfighters2.bb"
		
		'you probably didnt see it but this Var Right below tells menufunctons where To go Next
		EndIf
	menuselect = selection+1

EndIf
' If user hits ESC Then we'll exit the game
If kkeyhit = KEY_ESCAPE Then End
'this offsets the highlight image To line up To the menu option you have selected.
Select selection

Case 0
offsety = 0

Case 1
offsety = 30

Case 2
offsety = 60

Case 3
offsety = 90

End Select



'SetColor(100,0,0)
'SetAlpha(0.3)
DrawImage logo,0,0
SetAlpha(0.5)
DrawImage barim,90*Gscale,(120*Gscale)+(offsety*Gscale)
SetAlpha(1)
DrawImage arcadem,90*Gscale,120*Gscale
DrawImage multiplay,90*Gscale,150*Gscale
DrawImage optionim,90*Gscale,180*Gscale
DrawImage exitim,90*Gscale,210*Gscale

'drawing the menu
'Color 255,0,0
SetImageFont(fntArialA)
'Color 0,0,0
'DrawText "Version 1.72b Freeware not to be sold!",1,1

End Function



Function fighterselect()



'this lil Function makes the bg scroll
'stuffx = stuffx + 2
'stuffy = stuffy + 2
TileImage bgtile,stuffx,stuffy
'dont want To let stuffx And stuffy get To high
'If stuffx >= 20000 Then stuffx = 0
'If stuffy >= 20000 Then stuffy = 0

'a selection For the energy Type M,O,F & E
Select etype

Case 0
DrawImage etype0,10*Gscale,187*Gscale

Case 1
DrawImage etype1,10*Gscale,187*Gscale

Case 2
DrawImage etype2,10*Gscale,187*Gscale

Case 3
DrawImage etype3,10*Gscale,187*Gscale


End Select


'display a different font
SetImageFont fntArialA
'i set these back in the globals area To show the info on each energy Type
SetColor 0,0,0
'DrawText 320/2-25+1,240/2+71,etypes$(etype,0)
SetColor 255,255,255
'Text 320/2-25,240/2+70,etypes$(etype,0)
SetColor 0,0,0
'Text 320/2-25+1,240/2+80+1,etypes$(etype,1)
SetColor 255,255,255
'Text 320/2-25,240/2+80,etypes$(etype,1)
SetColor 0,0,0
'Text 320/2-25+1,240/2+90+1,etypes$(etype,2)
SetColor 255,255,255
'Text 320/2-25,240/2+90,etypes$(etype,2)
SetColor 0,0,0
'Text 320/2-25+1,240/2+100+1,etypes$(etype,3)
SetColor 255,255,255
'Text 320/2-25,240/2+100,etypes$(etype,3)
'change the font again
SetImageFont fntArialB

'going through each player To find the Right one
For p:player = EachIn player_list
'If the player equals the one that is selecting a fighter.. Then Continue
If p.playernum = arcadeplayer Then
'go through each fighter To find the one selected
For d:fighter = EachIn fighter_list
'make sure the fighter isnt an accidental blank one
	If d.fid$ <> "" Then
	'matching up the fighter here To the one selected
		If d.sels <> 0 Then
			If p.selectedfighter = d.fighternum Then
			'Color p.colred,p.colgreen,p.colblue
			DrawRect 0*Gscale,25*Gscale,40*Gscale,65*Gscale
			'Color p.colblue,p.colred,p.colgreen
			SetImageFont fntArialA
			'Text 0,25+35,"P"+Str(p.playernum)'+": "+d.fname$
			'Text 0,25+35+8,p.playertype$
			SetImageFont fntArialB 
			'Color 255,0,0
		EndIf
'im using this funny Var To draw some extra copies of the same 
'fighter To make the selection screen look bigger
shmoox = d.fighternum+fightnum
stempx = fightnum*2
shmoox2 = d.fighternum+stempx

		DrawImage d.sels,(d.fighternum*35-p.selectedfighter*35)*Gscale,25*Gscale
		
		
		DrawImage d.sels,(shmoox*35-p.selectedfighter*35)*Gscale,25*Gscale
		DrawImage d.sels,(shmoox2*35-p.selectedfighter*35)*Gscale,25*Gscale
'If the game couldnt find an image For the fighter Then we will draw a no image..image!		
			If p.selectedfighter = d.fighternum Then
				If d.selb <> 0 Then 
				DrawImage d.selb,10*Gscale,80*Gscale
				DrawImage sttvit,123*Gscale,80*Gscale
				DrawImage sttspd,123*Gscale,98*Gscale
				DrawImage sttdef,123*Gscale,116*Gscale
				DrawImage sttpow,123*Gscale,134*Gscale
				DrawImage sttspr,123*Gscale,152*Gscale
				DrawImage sttwill,123*Gscale,170*Gscale
				SetColor 0,0,0
				DrawRect (145+1)*Gscale,(80+1)*Gscale,(d.vit*1)*Gscale,15*Gscale
				DrawRect (145+1)*Gscale,(98+1)*Gscale,(d.spd*1)*Gscale,15*Gscale
				DrawRect (145+1)*Gscale,(116+1)*Gscale,(d.def*1)*Gscale,15*Gscale
				DrawRect (145+1)*Gscale,(134+1)*Gscale,(d.pow*1)*Gscale,15*Gscale
				DrawRect (145+1)*Gscale,(152+1)*Gscale,(d.spr*1)*Gscale,15*Gscale
				DrawRect (145+1)*Gscale,(170+1)*Gscale,(d.will*1)*Gscale,15*Gscale
				SetColor 255,0,0
				DrawRect 145*Gscale,80*Gscale,(d.vit*1)*Gscale,15*Gscale
				DrawRect 145*Gscale,98*Gscale,(d.spd*1)*Gscale,15*Gscale
				DrawRect 145*Gscale,116*Gscale,(d.def*1)*Gscale,15*Gscale
				DrawRect 145*Gscale,134*Gscale,(d.pow*1)*Gscale,15*Gscale
				DrawRect 145*Gscale,152*Gscale,(d.spr*1)*Gscale,15*Gscale
				DrawRect 145*Gscale,170*Gscale,(d.will*1)*Gscale,15*Gscale
				SetColor 255,255,255
				Else
				DrawImage noimage,10*Gscale,80*Gscale
				EndIf

			EndIf
	Else
	DrawImage noimage,(d.fighternum*35-p.selectedfighter*35)*Gscale,25*Gscale

	EndIf
EndIf

Next
'some text...
'Color 0,0,0
'Text 92,2,"Fighter Select"
'Color 255,0,0
'Text 90,0,"Fighter Select"


'here by hitting Left Or Right you can change fighters
If kkeyhit = KEY_RIGHT Then
PlaySound menuselsnd
	tempoint = 0
	p.vic = 0
	p.selectedfighter = p.selectedfighter + 1
		For d:fighter = EachIn fighter_list
			If d.fname$ <> "" Then
			tempoint = tempoint + 1
			EndIf
		Next
	If p.selectedfighter > tempoint Then p.selectedfighter = 1
EndIf

If kkeyhit = KEY_LEFT Then
PlaySound menuselsnd
	tempoint = 0
	p.vic = 0
	p.selectedfighter = p.selectedfighter - 1
		For d:fighter = EachIn fighter_list
			If d.fname$ <> "" Then
			tempoint = tempoint + 1
			EndIf
		Next
	If p.selectedfighter < 1 Then p.selectedfighter = tempoint
EndIf
'when you press enter this will Select that fighter For that player And move
'To the Next player.. If there are no more players Then it will go To the Next menu screen
If KeyHit(28) Then
PlaySound menuentsnd
'Right now the amount of players is only set To 2.. at some point ill Replace the 2 with a Var
'For team modes
If arcadeplayer < 2 Then
arcadeplayer = arcadeplayer + 1
		For d:fighter = EachIn fighter_list
			If d.fighternum = p.selectedfighter Then
			f:fight = New fight
			f.fighternum = d.fighternum
			f.fname$ = d.fname$
			f.fid$ = d.fid$+Rand(1,100000)
			p.fid$ = f.fid$
			f.fanim$ = d.fanim$
			f.team = p.team
			'f.selb = CopyImage(d.selb)
			'f.sels = CopyImage(d.sels)
			p.etype = etype
			p.fightername$  = d.fname$
			p.selectedfighter = d.fighternum
			
			p.fmode$ = "fstart"
			EndIf
		Next
p:player = New player
p.playernum = arcadeplayer
p.selectedfighter = 1
p.team = 2
p.direction = 1
p.colred = Rnd(1,255)
p.colgreen = Rnd(1,255)
p.colblue = Rnd(1,255)
p.playertype$ = "computer"
Else

		For d:fighter = EachIn fighter_list
			If d.fighternum = p.selectedfighter Then
			f:fight = New fight
			f.fighternum = d.fighternum
			f.fname$ = d.fname$
			f.fid$ = d.fid$+Rand(1,100000)
			p.fid$ = f.fid$
			f.fanim$ = d.fanim$
			f.team = p.team
			'f.selb = CopyImage(d.selb)
			'f.sels = CopyImage(d.sels)
			p.fightername$  = d.fname$
			p.selectedfighter = d.fighternum
			p.etype = etype
			p.fmode$ = "fstart"
			EndIf
		Next
stuffx = 0
stuffy = 0
'we are gonna go To menu 10 because menu 3 is multiplayer menu
menuselect = 10
'changing menus.. but before it goes To the Next one we want To load the backgrounds For the BG Select
'screen.
'Include "bin\getbgs.bb"
currentbg = 1
EndIf
EndIf
EndIf
Next

'If KeyHit(1) Then
'For p.player = Each player
'Delete p
'Next
'For d.fighter = Each fighter
'Delete d
'Next
'For f.fight = Each fight
'Delete f
'Next

'menuselect = 0
'EndIf

If KeyHit(200) Then
PlaySound menuselsnd
etype = etype + 1
If etype > 3 Then etype = 0
EndIf

If KeyHit(208) Then
PlaySound menuselsnd
etype = etype - 1
If etype < 0 Then etype = 3
EndIf



End Function




Function menufunctions()

Select menuselect
Case 0
drawmainmenu()

Case 1
fighterselect()

End Select

End Function
