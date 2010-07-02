Function checkkeydowntype(player,key$)

Select player


Case 1
If P1INPUTDEV = 0 Then
Select key$

Case "up"
Return KeyDown(P1KEYUP) 

Case "down"
Return KeyDown(P1KEYDN) 

Case "left"
Return KeyDown(P1KEYLF) 

Case "right"
Return KeyDown(P1KEYRT) 

Case "wp"
Return KeyDown(P1KEYWP) 

Case "sp"
Return KeyDown(P1KEYSP) 

Case "wk"
Return KeyDown(P1KEYWK) 

Case "sk"
Return KeyDown(P1KEYSK) 

Case "start"
Return KeyDown(P1KEYST)

End Select
Else If P1INPUTDEV > 0
'DebugLog "X: "+JoyX(P1INPUTDEV)+" Y:"+JoyY(P1INPUTDEV)
Select key$



Case "up"
If JoyY(P1INPUTDEV) = -1.0 Then
Return True 

EndIf

Case "down"
If JoyY(P1INPUTDEV) = 1.0 Then

Return True

EndIf

Case "left"
If JoyX(P1INPUTDEV) = -1.0 Then

Return True

EndIf

Case "right"
If JoyX(P1INPUTDEV) = 1.0 Then

Return True

EndIf

Case "wp"
Return JoyDown(P1KEYWP,P1INPUTDEV) 

Case "sp"
Return JoyDown(P1KEYSP,P1INPUTDEV) 

Case "wk"
Return JoyDown(P1KEYWK,P1INPUTDEV) 

Case "sk"
Return JoyDown(P1KEYSK,P1INPUTDEV) 

Case "start"
Return JoyDown(P1KEYST,P1INPUTDEV)
End Select

EndIf

Case 2
If P2INPUTDEV = 0 Then
Select key$

Case "up"
Return KeyDown(P2KEYUP) 

Case "down"
Return KeyDown(P2KEYDN) 

Case "left"
Return KeyDown(P2KEYLF) 

Case "right"
Return KeyDown(P2KEYRT) 

Case "wp"
Return KeyDown(P2KEYWP) 

Case "sp"
Return KeyDown(P2KEYSP) 

Case "wk"
Return KeyDown(P2KEYWK) 

Case "sk"
Return KeyDown(P2KEYSK) 

Case "start"
Return KeyDown(P2KEYST)

End Select
Else If P2INPUTDEV > 0
Select key$



Case "up"
If JoyY(P2INPUTDEV) = -1.0 Then

Return True 

EndIf

Case "down"
If JoyY(P2INPUTDEV) = 1.0 Then

Return True

EndIf

Case "left"
If JoyX(P2INPUTDEV) = -1.0 Then

Return True

EndIf

Case "right"
If JoyX(P2INPUTDEV) = 1.0 Then

Return True

EndIf

Case "wp"
Return JoyDown(P2KEYWP,P2INPUTDEV) 

Case "sp"
Return JoyDown(P2KEYSP,P2INPUTDEV) 

Case "wk"
Return JoyDown(P2KEYWK,P2INPUTDEV) 

Case "sk"
Return JoyDown(P2KEYSK,P2INPUTDEV) 

Case "start"
Return JoyDown(P2KEYST,P2INPUTDEV)

End Select

EndIf


End Select

End Function




Function fightingengine()

SetOrigin(ENGINEOFFSET,0)
drawbg()
controlfighters()
SetOrigin(ENGINEOFFSET,0)
controlimpacts()
SetOrigin(0,0)
enginemode()



End Function



Function drawbg()
If CURRENTSTAGE <> 0 Then
If ENGINESTATUS$ = "SPECIAL" Then
SetColor(150,150,150)
Else
SetColor(255,255,255)
EndIf
DrawImage CURRENTSTAGE,0-((ImageWidth(CURRENTSTAGE)/2)*ENGINESCALE#),0
SetColor(255,255,255)
EndIf
End Function



Function controlfighters()

For p:player = EachIn player_list

If p.playertype$ <> "" Then
controloffset()
SetOrigin(ENGINEOFFSET#,0)
If ENGINESTATUS$ <> "NETWAIT" Then
fightingmode(p:player)
drawfighter(p:player)
controlfballs(p:player)
EndIf
SetOrigin(0,0)
drawlifebars(p:player)
drawebars(p:player)
drawvics()
EndIf

Next


End Function


Function enginemode()

Select ENGINESTATUS$

Case "NETWAIT"
If checkstartnetfight() = True Then
ENGINESTATUS$ = "INIT"
Else
Cls
DrawImage mainload,0,0

DrawText "Waiting for other players....",0,0


Flip

EndIf

Case "INIT"
'start music playback
MUSICCHANNEL = PlaySound(BGMUSIC)
ENGINESTATUS$ = "RESET"

Case "RESET"
ENGINESCALE# = 2
OLDMAXL = 0
OLDMAXR = 640
ENGINESTATUS$ = "INTRO"


Case "INTRO"
splashround(CURRENTRND)

Case "OUTRO"
splashend()

Case "FIGHT"

Case "SPECIAL"
'drawspecial()

Case "ENDGAME"
splashfinal()
StopChannel MUSICCHANNEL
End Select

End Function


Function fightingmode(p:player)

Select ENGINESTATUS$

Case "RESET"
'ENGINESCALE# = 2

	Select p.team
	
	
	Case 1
	p.x = GraphicsWidth()/6
	'p.y = (GraphicsHeight()/8)*7
	p.lost = False
	p.fmode$ = "fintro"
	p.char.fanim$ = "intro"
	Case 2
	p.x = (GraphicsWidth()/6)*5
	'p.y = (GraphicsHeight()/8)*7
	p.lost = False
	p.fmode$ = "fintro"
	p.char.fanim$ = "intro"	
	Default
	p.x = Rnd(GraphicsWidth()/6,(GraphicsWidth()/6)*5)
	p.lost = False
	p.fmode$ = "fintro"
	p.char.fanim$ = "intro"	
	End Select
	ENGINEOFFSET# = 0




	
'ENGINESTATUS$ = "INTRO"

Case "INTRO"
	
	If p.introfin = 1 Then
	p.fmode$ = "fight"
	p.char.fanim$ = "stand"
	EndIf
	turnfighter(p:player)


Case "OUTRO"
Select p.playertype$

Case "HUMAN"
playercontrol(p:player)

Case "COMP"
fighterai(p:player)

Case "NET"
netplayercontrol(p:player)

End Select
turnfighter(p:player)

Case "FIGHT"
Select p.playertype$

Case "HUMAN"
playercontrol(p:player)

Case "COMP"
fighterai(p:player)

Case "NET"
netplayercontrol(p:player)
End Select

turnfighter(p:player)


Case "SPECIAL"
Select p.playertype$

Case "HUMAN"
playercontrol(p:player)

Case "COMP"
fighterai(p:player)

Case "NET"
netplayercontrol(p:player)
End Select

turnfighter(p:player)


Case "PAUSE"

Case "ENDGAME"

Case "NETWAIT"

End Select


End Function


Function turnfighter(p:player)
'we are gonna find our fighters opponent
Select GAMEENGINETYPE$

Case "Arcade"
For opponent:player = EachIn player_list
	If opponent.team <> p.team Then
	'lets get our opponents position
	p.oppx = opponent.x
	
	
	
	'now we see what direction from our fighter is the opponent
	'Then we will turn the fighter To face the correct direction
	
	If opponent.x > p.x Then
	p.direction = 0
	Else
	p.direction = 1
	EndIf
	
	
	EndIf
Next

Case "Brawl"
ppppp = 0

End Select


End Function



Function drawfighter(p:player)
For a:animdata = EachIn animdata_list
	If a.fanim$ = p.char.fanim$ And a.fid$ = p.char.fid$ Then
	'If ENGINESTATUS$ = "OUTRO" Then
	'If p.lost = False Then
	'p.char.fstatus$ = "outro"
	'p.char.fanim$ = "outro"
	'EndIf
	'EndIf
	If ENGINESTATUS$ <> "SPECIAL" Then
	a.tfrate = a.tfrate + 1
	SLOMO = 0
	Else
	SLOMO = SLOMO + 1
	If SLOMO >= 3 Then
	a.tfrate = a.tfrate + 1
	SLOMO = 0
	
	EndIf
	EndIf
	
	
	
	If a.tfrate >= a.frate Then
	a.tframe = a.tframe + 1
	a.tfrate = 0
	EndIf
	
	If a.tframe = a.fhitf Then
	'run hit frame function here
	hitf(p:player,a:animdata)
	EndIf
	
	
	If a.tframe > a.nof Then
		If p.lost = True Or p.char.fstatus$ = "outro" Then
		ENGINESTATUS$ = "OUTRO"
		pframe = a.tframe-1
		EndIf
	a.tframe = 1
	If ENGINESTATUS$ = "OUTRO" Then a.tframe = pframe
	'If the animation was an intro Then finish the intro
		If p.fmode$ = "fintro" Then
		p.introfin = 1
		p.fmode$ = "fight"
		EndIf

		
	p.char.fanimating = False
	p.char.dashing = False
	p.spectag = False
	p.char.spectag = False
	'If the player lost. play the outro after his KO frames are done

	p.char.hurt = False
	EndIf
	
	displayfighterframe(p:player,a:animdata)
	If p.fmode$ = "special" Then
	drawspecialstart(p:player,a:animdata)
	EndIf
	
	EndIf
Next

End Function


Function drawspecialstart(p:player,a:animdata)
If ENGINESTATUS$ <> "SPECIAL" Then p.fmode$ = ""
If p.getbgs = True Then
For i:impact = EachIn impact_list
If i.iid$ = "charge" Then
impacto:tempimpact = New tempimpact
impacto.charframe = SPECIALFRAME
impacto.charx = SPECFX
impacto.chary = SPECFY
Select p.direction


					Case 0
					impacto.x = p.x
					impacto.y = p.ty + (a.fhcoly*ENGINESCALE#)
					impacto.direction = p.direction
					'p.x = p.x - 5
					Case 1
					impacto.x = p.x
					impacto.y = p.ty + (a.fhcoly*ENGINESCALE#)
					impacto.direction = p.direction
					'p.x = p.x + 5



End Select
impacto.fanimating = True
impacto.fnum = 1
impacto.nof = i.nof
impacto.iid$ = i.iid$
impacto.frate = 5
EndIf
Next

p.getbgs = False
EndIf
'If p.fmode$ = "special" Then
'TileImage overlay,0,0
'EndIf

End Function

Function drawspecial()
Rem
For p:player = EachIn player_list

If p.fmode$ = "special" Then
If p.getbgs = True Then
SetImageHandle(sparkle[0],(ImageWidth(sparkle[0])/2)+40,(ImageHeight(sparkle[0])/2)+200)
SetImageHandle(sparkle[1],(ImageWidth(sparkle[0])/2)+120,(ImageHeight(sparkle[0])/2)+120)
SetImageHandle(sparkle[2],(ImageWidth(sparkle[0])/2)+200,(ImageHeight(sparkle[0])/2)+40)
SetImageHandle(sparkle[3],(ImageWidth(sparkle[0])/2)+120,(ImageHeight(sparkle[0])/2)+-40)
SetImageHandle(sparkle[4],(ImageWidth(sparkle[0])/2)+40,(ImageHeight(sparkle[0])/2)+-120)
SetImageHandle(sparkle[5],(ImageWidth(sparkle[0])/2)-40,(ImageHeight(sparkle[0])/2)+-200)
SetImageHandle(sparkle[6],(ImageWidth(sparkle[0])/2)-120,(ImageHeight(sparkle[0])/2)+-120)
SetImageHandle(sparkle[7],(ImageWidth(sparkle[0])/2)-200,(ImageHeight(sparkle[0])/2)+-40)
SetImageHandle(sparkle[8],(ImageWidth(sparkle[0])/2)-120,(ImageHeight(sparkle[0])/2)+40)
SetImageHandle(sparkle[9],(ImageWidth(sparkle[0])/2)-40,(ImageHeight(sparkle[0])/2)+120)
TEMPSCALE# = ENGINESCALE#
p.getbgs = False
EndIf

SetBlend(LIGHTBLEND)

ENGINEROTATION = ENGINEROTATION + 10
If ENGINEROTATION >= 360 Then ENGINEROTATION = 0
SetRotation ENGINEROTATION

For poooo = 0 To 20
SetColor(200,200,Rnd(210,255))



DrawLine(p.tx,p.ty,ptx+Rnd(0,640),p.ty+Rnd(0,480))


Next
SetScale(TEMPSCALE#,TEMPSCALE#)

For pooppppp = 0 To 9
DrawImage sparkle[pooppppp],p.tx,p.ty
Next

TEMPSCALE# = TEMPSCALE# - 0.10


If TEMPSCALE# <= 0 Then ENGINESTATUS$ = "FIGHT"

SetRotation 0
SetBlend(ALPHABLEND)
EndIf

Next
End Rem
End Function


Function controlimpacts()

For impacto:tempimpact = EachIn tempimpact_list


If impacto.fanimating = True Then
If impacto.frate <= 0 Then
impacto.frate = 3
EndIf
impacto.shiste = impacto.shiste + 1
If impacto.shiste > impacto.frate Then
impacto.fnum = impacto.fnum + 1
impacto.shiste = 0
EndIf
If impacto.fnum > impacto.nof Then
impacto.fanimating = False
If impacto.iid$ = "charge" Then
ENGINESTATUS$ = "FIGHT"

EndIf
EndIf

For u:impctframe = EachIn impctframe_list
If u.fnum = impacto.fnum And u.iid$ = impacto.iid$ Then
SetBlend(LIGHTBLEND)
Select impacto.direction

Case 0
'If impacto.iid$ = "charge" Then
'DrawImage impacto.charframe,impacto.charx,impacto.chary
'EndIf

SetScale(-ENGINESCALE#,ENGINESCALE#)
DrawImage u.fframe,impacto.x+ImageWidth(u.fframe),impacto.y
SetScale(ENGINESCALE#,ENGINESCALE#)
Case 1
'If impacto.iid$ = "charge" Then
'DrawImage impacto.charframe,impacto.charx,impacto.chary
'EndIf
DrawImage u.fframe,impacto.x-ImageWidth(u.fframe),impacto.y

End Select
EndIf
Next

Else

';FreeImage u\fframe
';FreeImage u\fframe2
impacto.Remove
';Delete u
EndIf



Next
SetBlend(ALPHABLEND)
End Function

Function controlfballs(p:player)
	For x:fballa = EachIn fballa_list
		If x.fid$ = p.char.fid$ Then
			If p.char.spectag = False Then
			Select x.direction
			
			Case 0
			x.x = x.x + (p.char.spd*ENGINESCALE#)
			
			Case 1
			x.x = x.x - (p.char.spd*ENGINESCALE#)
			
			End Select
			x.life = x.life - 1
			EndIf
			x.antime = x.antime + 1
			If x.antime >= x.frate Then
			x.antime = 0
			x.framenum = x.framenum + 1
			EndIf
			'If x\framenum = x\hitf Then
			
			'Color 255,0,0
			';;
			coll:collbox = New collbox
			coll.x = x.x
			coll.y = x.y
			coll.colx = (x.colx*ENGINESCALE#)
			coll.coly = (x.coly*ENGINESCALE#)
			coll.life = 2
			coll.team = x.team
			coll.damage = x.pow
			coll.fid$ = x.fid$

			'EndIf
			
			
			If x.framenum >= x.nof Then x.framenum = 1
			
			For q:fbframe = EachIn fbframe_list
			
			If q.id = x.id And q.fnum = x.framenum Then
			Select x.direction
			
			Case 0
			SetBlend(LIGHTBLEND)
			
			SetAlpha(0.25)
			
			DrawImage q.fball,x.x-15,x.y
			SetAlpha(0.5)
			
			DrawImage q.fball,x.x-10,x.y
			SetAlpha(0.75)
			
			DrawImage q.fball,x.x-5,x.y
			SetAlpha(0.90)
			DrawImage q.fball,x.x,x.y
			SetBlend(ALPHABLEND)
			SetAlpha(1)
			SetColor(255,0,0)
			DrawRect coll.x,coll.y,coll.colx,coll.coly
			SetColor(255,255,255)
			
			Case 1
			SetScale(-ENGINESCALE#,ENGINESCALE#)
			SetBlend(LIGHTBLEND)
			SetAlpha(0.25)
			DrawImage q.fball,x.x+15,x.y
			SetAlpha(0.5)			
			DrawImage q.fball,x.x+10,x.y
			SetAlpha(0.75)

			DrawImage q.fball,x.x+5,x.y

			SetAlpha(0.90)
			DrawImage q.fball,x.x,x.y
			SetBlend(ALPHABLEND)
			SetAlpha(1)
			SetScale(ENGINESCALE#,ENGINESCALE#)
			SetColor(255,0,0)
			DrawRect coll.x,coll.y,coll.colx,coll.coly
			SetColor(255,255,255)
			
			End Select

			EndIf
			If q.id = x.id Then
			If x.life <= 0 Then 
'			FreeImage q\fball'
'			FreeImage q\fball2
			q.Remove()
			EndIf
			EndIf
			Next
			
			
			If x.life <= 0 Then 
			x.Remove
			EndIf


		EndIf
	Next

End Function

Function displayfighterframe(p:player,a:animdata)
For g:frame = EachIn frame_list
	If g.fid$ = p.char.fid$ And g.fanim$ = a.fanim$ Then
	
	
		If g.fnum = a.tframe Then
		
		
			If Not p.fmode$ = "fintro" And p.lost = False Then
			'control fighter ai here??
			
			EndIf
		
		
		For coll:collbox = EachIn collbox_list
		'check for hit collisions at frame point
		hitcollbox(coll:collbox,p:player,a:animdata)
		Next
		
		fighterdir(p:player,g:frame,a:animdata)
		
		EndIf
	
	EndIf
Next
End Function



Function fighterdir(p:player,g:frame,a:animdata)
a.fwidth = ImageWidth(g.fframe)
a.fheight = ImageHeight(g.fframe)
p.halign = a.halign

If p.fmode$ = "special" Then SPECIALFRAME = g.fframe
If p.direction = 0 Then
p.tx = p.x-(a.halign*ENGINESCALE#)
p.ty = (ImageHeight(CURRENTSTAGE)*ENGINESCALE#)-(ImageHeight(g.fframe)*ENGINESCALE#)+p.y
'DrawImage pshadows,p.x,240-ImageHeight(pshadows)/4

SetScale(ENGINESCALE#,-(ENGINESCALE#/4))
SetColor(0,0,0)
SetAlpha(0.5)
DrawImage g.fframe,p.tx,((ImageHeight(CURRENTSTAGE)*ENGINESCALE#)-25)+((ImageHeight(g.fframe)*ENGINESCALE#)/4)
SetScale(ENGINESCALE#,ENGINESCALE#)
SetColor(255,255,255)
SetAlpha(1)
DrawImage g.fframe,p.tx,p.ty
SPECFX = p.tx
SPECFY = p.ty


'DrawRect p.tx,0,5,480
EndIf

If p.direction = 1 Then
p.tx = p.x+a.halign*ENGINESCALE#
p.ty = (ImageHeight(CURRENTSTAGE)*ENGINESCALE#)-(ImageHeight(g.fframe)*ENGINESCALE#)+p.y
'DrawImage pshadows,p.x,240-ImageHeight(pshadows)/4
SetScale(-ENGINESCALE#,-(ENGINESCALE#/4))
SetColor(0,0,0)
SetAlpha(0.5)
DrawImage g.fframe,p.tx,((ImageHeight(CURRENTSTAGE)*ENGINESCALE#)-25)+((ImageHeight(g.fframe)*ENGINESCALE#)/4)
SetScale(ENGINESCALE#,ENGINESCALE#)
SetColor(255,255,255)
SetAlpha(1)


SetScale(-ENGINESCALE#,ENGINESCALE#)
DrawImage g.fframe,p.tx,p.ty
SetScale(ENGINESCALE#,ENGINESCALE#)
SPECFX = p.tx
SPECFY = p.ty
'DrawRect p.tx,0,5,480
EndIf



									
End Function



Function playercontrol(p:player)
p.oldpx = p.x

Select GAMEENGINETYPE$

Case "Brawl"
Select p.direction
Case 0
If p.x <= 0-(ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2 Then p.x = 0-(ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2
If p.x >= 0-((ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2)+(ImageWidth(CURRENTSTAGE)*ENGINESCALE#) Then p.x = 0-((ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2)+(ImageWidth(CURRENTSTAGE)*ENGINESCALE#)

Case 1
If p.x >= 0-((ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2)+(ImageWidth(CURRENTSTAGE)*ENGINESCALE#) Then p.x = 0-((ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2)+(ImageWidth(CURRENTSTAGE)*ENGINESCALE#)
If p.x <= 0-(ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2 Then p.x = 0-(ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2


End Select

Case "Arcade"
Select p.direction
Case 0
If p.x <= 0-(ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2 Then p.x = 0-(ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2

Case 1
If p.x >= 0-((ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2)+(ImageWidth(CURRENTSTAGE)*ENGINESCALE#) Then p.x = 0-((ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2)+(ImageWidth(CURRENTSTAGE)*ENGINESCALE#)


End Select

End Select


If p.char.tmlife <= 0 Then
p.fmode$ = "lose"
p.char.fanim$ = "lose"
'ENGINESTATUS$ = "OUTRO"
p.char.fanimating = True
p.lost = True

EndIf


If p.char.fstatus$ <> "jump"  Or p.char.jup = False Then
p.y = p.y + ((p.char.spd * 3)*ENGINESCALE#)
If p.y > 0 Then
p.y = 0
EndIf
EndIf


If p.char.hurt = True Then
Select p.direction

Case 0
p.x = p.x - 1
If p.x+p.halign*ENGINESCALE# <= 0-((ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2) Then p.x = 0-((ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2)
Case 1
p.x = p.x + 1
If p.x-p.halign*ENGINESCALE# >= 0-((ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2)+(ImageWidth(CURRENTSTAGE)*ENGINESCALE#) Then p.x = 0-((ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2)+(ImageWidth(CURRENTSTAGE)*ENGINESCALE#)

End Select
EndIf

If checkkeytype(p.team,"up") <> 0 Then
If p.char.fstatus$ <> "jump" Then

p.char.jtype$ = "up"
p.movestring$ = p.movestring$ + "+%u"
p.char.fstatus$ = "jump"
p.char.fanim$ = "jump"
p.bkeydwn = True
p.bmtimer = True
p.char.jumpheight = 0
p.char.jup = True
p.char.fanimating = True


If checkkeydowntype(p.team,"right") = True Then

p.char.jtype$ = "rup"
p.char.fstatus$ = "jump"
p.char.fanim$ = "jump"
p.bkeydwn = True
p.bmtimer = True
p.char.jumpheight = 0
p.char.jup = True
p.char.fanimating = True


EndIf


If checkkeydowntype(p.team,"left") = True Then



p.char.jtype$ = "lup"
p.char.fstatus$ = "jump"
p.char.fanim$ = "jump"
p.bkeydwn = True
p.bmtimer = True
p.char.jumpheight = 0
p.char.jup = True
p.char.fanimating = True


EndIf

EndIf

EndIf


If p.char.fstatus$ = "jump" Then
jumpup(p:player)
EndIf





If checkkeytype(p.team,"wk") <> 0 Then
If p.etype = 2 Then
p.char.energy = p.char.energy + 1
If p.char.energy >= 175 Then p.char.energy = 175
EndIf
p.movestring$ = p.movestring$ + "+%wk"
p.bkeydwn = True
p.bmtimer = True
Select p.char.fstatus$

Case "crouch"
p.char.fanim$ = "ckick"

Case "walk"
p.char.fanim$ = "wkick"

Case "jump"
p.char.fanim$ = "akick"


Default
p.char.fanim$ = "wkick"

End Select

If checkkeydowntype(p.team,"down") = True Then
p.char.fanim$ = "ckick"
EndIf
p.char.fanimating = True


EndIf



If checkkeytype(p.team,"sk") <> 0 Then
If p.etype = 2 Then
p.char.energy = p.char.energy + 2
If p.char.energy >= 175 Then p.char.energy = 175
EndIf
p.movestring$ = p.movestring$ + "+%sk"
p.bkeydwn = True
p.bmtimer = True
Select p.char.fstatus$

Case "crouch"
p.char.fanim$ = "ckick"

Case "walk"
p.char.fanim$ = "skick"

Case "jump"
p.char.fanim$ = "akick"

Default
p.char.fanim$ = "skick"

End Select
If checkkeydowntype(p.team,"down") = True Then
p.char.fanim$ = "ckick"
EndIf
p.char.fanimating = True

EndIf




If checkkeytype(p.team,"sp") <> 0 Then
If p.etype = 2 Then
p.char.energy = p.char.energy + 2
If p.char.energy >= 175 Then p.char.energy = 175
EndIf
p.movestring$ = p.movestring$ + "+%sp"
p.bkeydwn = True
p.bmtimer = True
Select p.char.fstatus$

Case "crouch"
p.char.fanim$ = "cpunch"

Case "walk"
p.char.fanim$ = "spunch"

Case "jump"
p.char.fanim$ = "apunch"

Default
p.char.fanim$ = "spunch"

End Select
If checkkeydowntype(p.team,"down") = True Then
p.char.fanim$ = "cpunch"
EndIf
p.char.fanimating = True

EndIf



If checkkeytype(p.team,"wp") <> 0 Then
If p.etype = 2 Then
p.char.energy = p.char.energy + 1
If p.char.energy >= 175 Then p.char.energy = 175
EndIf
p.movestring$ = p.movestring$ + "+%wp"
p.bkeydwn = True
p.bmtimer = True

Select p.char.fstatus$

Case "crouch"
p.char.fanim$ = "cpunch"

Case "walk"
p.char.fanim$ = "wpunch"

Case "jump"
p.char.fanim$ = "apunch"

Default
p.char.fanim$ = "wpunch"

End Select
If checkkeydowntype(p.team,"down") = True Then
p.char.fanim$ = "cpunch"
EndIf
p.char.fanimating = True
EndIf



If checkkeydowntype(p.team,"down") = True Then
If p.bkeydwn = False Then
p.movestring$ = p.movestring$ + "+%d"
p.bkeydwn = True
p.bmtimer = True
p.char.fanim$ = "crouch"
p.char.fstatus$ = "crouch"
EndIf
If p.char.fanimating = False Then
p.char.fanim$ = "crouch"
EndIf
EndIf



If checkkeydowntype(p.team,"left") = True And p.char.fstatus$ <> "block" Then


Select p.direction

Case 0
If p.bkeydwn = False Then
p.movestring$ = p.movestring$ + "+%b"
p.bkeydwn = True
p.bmtimer = True
p.char.fanim$ = "walk"
p.char.fstatus$ = "walk"
EndIf

Case 1
If p.bkeydwn = False Then
p.movestring$ = p.movestring$ + "+%f"
p.bkeydwn = True
p.bmtimer = True
p.char.fstatus$ = "walk"
p.char.fanim$ = "walk"
EndIf

End Select
Select GAMEENGINETYPE$

Case "Arcade"
pppppp = 0

Case "Brawl"
p.direction = 1

End Select
If p.char.fanimating = False Then
p.char.fanim$ = "walk"
'If p.x > 0 Then
p.x = p.x - ((p.char.spd/2)*ENGINESCALE#)
'If p.x <= 0 Then p.x = 0
'Else
'scrollitx = scrollitx + f\spd/2
'EndIf
EndIf
EndIf


If checkkeydowntype(p.team,"right") = True And p.char.fstatus$ <> "block" Then
Select p.direction

Case 0
If p.bkeydwn = False Then
p.movestring$ = p.movestring$ + "+%f"
p.bkeydwn = True
p.bmtimer = True
p.char.fstatus$ = "walk"
p.char.fanim$ = "walk"
EndIf

Case 1
If p.bkeydwn = False Then
p.movestring$ = p.movestring$ + "+%b"
p.bkeydwn = True
p.bmtimer = True
p.char.fstatus$ = "walk"
p.char.fanim$ = "walk"
EndIf

End Select
Select GAMEENGINETYPE$

Case "Arcade"
pppppp = 0

Case "Brawl"
p.direction = 0

End Select

If p.char.fanimating = False Then
p.char.fanim$ = "walk"
'If p.x < 640 Then
p.x = p.x + ((p.char.spd/2)*ENGINESCALE#)
'If p.x >= 640 Then p.x = 640
'Else
'scrollitx = scrollitx - f\spd/2
'EndIf

EndIf
EndIf



If checkkeydowntype(p.team,"down") = True And checkkeydowntype(p.team,"wp") = True And checkkeydowntype(p.team,"wk") = True And p.etype = 0 And p.char.hurt = False And p.char.fstatus$ <> "jump" Then
'If p.bkeydwn = False Then
'p.movestring$ = p.movestring$ + "+%d"
p.char.ctime = p.char.ctime + p.char.spd
If p.char.ctime >= 50 Then
p.char.energy = p.char.energy + p.char.spr
p.char.ctime = 0
EndIf
If p.char.energy >= 175 Then p.char.energy = 175
p.bkeydwn = True
p.bmtimer = True
p.char.fanim$ = "powerup"
p.char.fstatus$ = "powerup"
'EndIf
If p.char.fanimating = False Then
p.char.fanim$ = "powerup"
EndIf
EndIf



If Instr(p.movestring$,p.char.fireb$,1) <> 0 And p.char.fireb$ <> "" Then
If p.etype = 2 Then
p.char.energy = p.char.energy + 20
If p.char.energy >= 175 Then p.char.energy = 175
EndIf
p.movestring$ = ""
p.char.fstatus$ = "fireb"
p.char.fanim$ = "fireb"
p.bkeydwn = True
p.bmtimer = True
p.char.fanimating = True
p.char.bfball = True
EndIf

If Instr(p.movestring$,p.char.firebx$,1) <> 0 And p.char.energy >= 25 And p.char.firebx$ <> "" Then
p.char.energy = p.char.energy - 25
p.movestring$ = ""
p.char.fstatus$ = "firebx"
p.char.fanim$ = "firebx"
p.bkeydwn = True
p.bmtimer = True
p.char.fanimating = True
p.char.bfball = True
p.fmode$ = "special"
ENGINESTATUS$ = "SPECIAL"
p.getbgs = True
EndIf


If Instr(p.movestring$,p.char.dash$,1) <> 0 And p.char.dash$ <> "" Then
If p.etype = 2 Then
p.char.energy = p.char.energy + 20
If p.char.energy >= 175 Then p.char.energy = 175
EndIf
p.movestring$ = ""
p.char.fstatus$ = "dash"
p.char.fanim$ = "dash"
p.char.dashing = True
p.bkeydwn = True
p.bmtimer = True
p.char.fanimating = True
EndIf


If Instr(p.movestring$,p.char.dashx$,1) <> 0 And p.char.energy >= 25 And p.char.dashx$ <> "" Then
p.char.energy = p.char.energy - 25
p.movestring$ = ""
p.char.fstatus$ = "dashx"
p.char.fanim$ = "dashx"
p.char.dashing = True
p.bkeydwn = True
p.bmtimer = True
p.char.fanimating = True
p.fmode$ = "special"
ENGINESTATUS$ = "SPECIAL"
p.getbgs = True
EndIf


If Instr(p.movestring$,p.char.spec$,1) <> 0 And p.char.spec$ <> "" Then
If p.etype = 2 Then
p.char.energy = p.char.energy + 20
If p.char.energy >= 175 Then p.char.energy = 175
EndIf
p.movestring$ = ""
p.char.fstatus$ = "special"
p.char.fanim$ = "special"
p.bkeydwn = True
p.bmtimer = True
p.char.fanimating = True
EndIf

If Instr(p.movestring$,p.char.specx$,1) <> 0 And p.char.energy >= 25 And p.char.specx$ <> "" Then
p.char.energy = p.char.energy - 25
p.movestring$ = ""
p.char.fstatus$ = "specialx"
p.char.fanim$ = "specialx"
p.bkeydwn = True
p.bmtimer = True
p.char.fanimating = True
p.fmode$ = "special"
ENGINESTATUS$ = "SPECIAL"
p.getbgs = True
EndIf


If Instr(p.movestring$,p.char.specx$,1) <> 0 And p.char.plife <= 50 And p.char.fatal$ <> "" Then
'p.char.energy = p.char.energy - 25
p.movestring$ = ""
p.char.fstatus$ = "fatal"
p.char.fanim$ = "fatal"
p.bkeydwn = True
p.bmtimer = True
p.char.fanimating = True
p.fmode$ = "special"
ENGINESTATUS$ = "SPECIAL"
p.getbgs = True
EndIf


If p.char.dashing = True And p.char.fanimating = True Then
Select p.direction

Case 0
p.x = p.x + (p.char.spd*ENGINESCALE#)

Case 1
p.x = p.x - (p.char.spd*ENGINESCALE#)

End Select
EndIf




If checkkeydowntype(p.team,"right") <> True Then
If checkkeydowntype(p.team,"left") <> True Then
If checkkeydowntype(p.team,"up") <> True Then
If checkkeydowntype(p.team,"down") <> True Then


If p.char.fstatus$ <> "jump" Then
p.char.fstatus$ = ""
p.bkeydwn = False
EndIf
If p.char.fanimating = False And p.char.fstatus$ <> "jump" Then
p.char.dashing = False
p.char.fanim$ = "stand"
EndIf



EndIf
EndIf
EndIf	
EndIf


If p.char.tmlife > 0 And ENGINESTATUS$ = "OUTRO" Then
p.char.fstatus$ = "outro"
p.char.fanim$ = "outro"
p.char.fanimating = True
EndIf

If p.bmtimer = True
p.mtimer = p.mtimer + 1
If p.mtimer > 75 Then
p.bmtimer = False
p.mtimer = 0
p.movestring$ = ""
EndIf
EndIf



If GAMEENGINETYPE$="Arcade" Then
Select p.direction
Case 0
If p.char.fstatus$ <> "jump" Then
If p.x >= p.oppx Then p.x = p.oldpx
EndIf
If p.oppx-p.x > 640 Then p.x = p.oldpx

Case 1
If p.char.fstatus$ <> "jump" Then
If p.x <= p.oppx Then p.x = p.oldpx
EndIf
If p.oppx-p.x < -640 Then p.x = p.oldpx



End Select
EndIf

If GNETSUCCESS <> 0 Then
transmitplayer(p:player)
EndIf


End Function



Function controloffset()
ISOFFSET = False

If GAMEENGINETYPE$="Arcade" Then
For p:player = EachIn player_list
If p.x < PXMAXXL Then PXMAXXL = p.x
If p.x > PXMAXXR Then PXMAXXR = p.x

Next
If PXMAXXL < OLDMAXL Then
ENGINEOFFSET# = Float(0 - PXMAXXL)
OLDMAXL = PXMAXXL
OLDMAXR = PXMAXXR
EndIf
If PXMAXXR > OLDMAXR Then
ENGINEOFFSET# = Float(640 - PXMAXXR)
OLDMAXL = PXMAXXL
OLDMAXR = PXMAXXR
EndIf
EndIf
If GAMEENGINETYPE$="Brawl" Then
For p:player = EachIn player_list
If p.team = 1 Then
If p.x < PXMAXXL Then PXMAXXL = p.x
If p.x > PXMAXXR Then PXMAXXR = p.x



EndIf
Next
If PXMAXXL < OLDMAXL Then
ENGINEOFFSET# = Float(0 - PXMAXXL)
OLDMAXL = PXMAXXL
OLDMAXR = PXMAXXR
EndIf
If PXMAXXR > OLDMAXR Then
ENGINEOFFSET# = Float(640 - PXMAXXR)
OLDMAXL = PXMAXXL
OLDMAXR = PXMAXXR
EndIf

EndIf

'If p.x > 0 And p.x < 640 And ISOFFSET = False Then
'ENGINEOFFSET# = 0
'EndIf

'Next
End Function


Function jumpup(p:player)

Select p.char.jtype$

Case "up"
If p.char.jup = True Then
p.char.jumpheight = p.char.jumpheight + ((p.char.spd * 2)*ENGINESCALE#)
p.y = p.y - ((p.char.spd)*ENGINESCALE#)
If p.char.jumpheight > (p.char.will * 40)*ENGINESCALE# Then p.char.jup = False
Else
p.y = p.y + ((p.char.spd * 2)*ENGINESCALE#)
If p.y > 0 Then
p.y = 0
p.char.fstatus$ = ""
EndIf
EndIf

Case "rup"
If p.char.jup = True Then
p.char.jumpheight = p.char.jumpheight + ((p.char.spd * 2)*ENGINESCALE#)
p.y = p.y - ((p.char.spd)*ENGINESCALE#)
p.x = p.x + ((p.char.spd)*ENGINESCALE#)
If p.char.jumpheight > (p.char.will * 40)*ENGINESCALE# Then p.char.jup = False
Else
p.y = p.y + ((p.char.spd * 2)*ENGINESCALE#)
p.x = p.x + ((p.char.spd)*ENGINESCALE#)
If p.y > 0 Then
p.y = 0
p.char.fstatus$ = ""
EndIf
EndIf

Case "lup"
If p.char.jup = True Then
p.char.jumpheight = p.char.jumpheight + ((p.char.spd * 2)*ENGINESCALE#)
p.y = p.y - ((p.char.spd)*ENGINESCALE#)
p.x = p.x - ((p.char.spd)*ENGINESCALE#)
If p.char.jumpheight > (p.char.will * 40)*ENGINESCALE# Then p.char.jup = False
Else
p.y = p.y + ((p.char.spd * 2)*ENGINESCALE#)
p.x = p.x - ((p.char.spd)*ENGINESCALE#)
If p.y > 0 Then
p.y = 0
p.char.fstatus$ = ""
EndIf
EndIf

End Select
End Function


Function hitcollbox(coll:collbox,p:player,a:animdata)

If coll.fid$ <> "" Then
If coll.team <> p.team Then
Select p.direction
	
	Case 0
	
		If RectsOverlap(p.tx,p.ty+(a.fdcoly*ENGINESCALE#),(a.fdcolx*ENGINESCALE#),(a.fheight*ENGINESCALE#)-(a.fdcoly*ENGINESCALE#),coll.x,coll.y,coll.colx,coll.coly) Then
			If p.char.hurt = False Then
				If checkkeydowntype(p.team,"left") = False Then
					p.bmtimer = True
					Select p.char.fstatus$
					
					Case "jump"
					p.char.fanim$ = "lose"
					
					Case "crouch"
					p.char.fanim$ = "churt"
					
					Default
					p.char.fanim$ = "hurt"
					
					End Select
				p.char.hurt = True
				p.char.jup = False
				PlaySound whitsnd
				'f\fstatus$ = "hurt"
				p.char.dashing = False
				p.char.fanimating = True

					If p.etype = 1 Then
					p.char.energy = p.char.energy + 15
					If p.char.energy >= 175 Then p.char.energy = 175
					EndIf
				p.char.tmlife = p.char.tmlife - coll.damage / 2
				p.char.dtaken = p.char.dtaken + coll.damage / 2
				p.char.tftaken# = Float(p.char.dtaken) / Float(p.char.mlife) * 236
				If p.char.tftaken# >= 236 Then p.char.tftaken# = 236
				p.char.plife# = Float(p.char.tmlife) / Float(p.char.mlife) * 236

					For i:impact = EachIn impact_list
					If i.iid$ = "simpact" Then
					impacto:tempimpact = New tempimpact
					Select p.direction
					Case 0
					impacto.x = p.x
					impacto.y = p.ty + (a.fhcoly*ENGINESCALE#)
					impacto.direction = p.direction
					p.x = p.x - 5
					Case 1
					impacto.x = p.x
					impacto.y = p.ty + (a.fhcoly*ENGINESCALE#)
					impacto.direction = p.direction
					p.x = p.x + 5
					End Select
					impacto.fanimating = True
					impacto.fnum = 1
					impacto.nof = i.nof
					impacto.iid$ = i.iid$
					EndIf
					Next
				Else

				PlaySound blocksnd
				p.char.fanim$ = "block"
				p.char.fstatus$ = "block"
				p.char.fanimating = True


					For i:impact = EachIn impact_list
					If i.iid$ = "bimpact" Then
					impacto:tempimpact = New tempimpact
					Select p.direction
					Case 0
					impacto.x = p.x
					impacto.y = p.ty + (a.fhcoly*ENGINESCALE#)
					impacto.direction = p.direction
					p.x = p.x - 5
					Case 1
					impacto.x = p.x
					impacto.y = p.ty + (a.fhcoly*ENGINESCALE#)
					impacto.direction = p.direction
					p.x = p.x + 5
					End Select
					impacto.fanimating = True
					impacto.fnum = 1
					impacto.nof = i.nof
					impacto.iid$ = i.iid$
					EndIf
					Next
					
					If p.etype = 1 Then
					p.char.energy = p.char.energy + 1
					If p.char.energy >= 175 Then p.char.energy = 175
					EndIf

				EndIf

			EndIf

		EndIf
		
		
	Case 1
		If RectsOverlap(p.tx-(a.fdcolx*ENGINESCALE#),p.ty+(a.fdcoly*ENGINESCALE#),(a.fdcolx*ENGINESCALE#),(a.fheight*ENGINESCALE#)-(a.fdcoly*ENGINESCALE#),coll.x,coll.y,coll.colx,coll.coly) Then
			If p.char.hurt = False Then
				If checkkeydowntype(p.team,"right") = False Then
			
				p.bmtimer = True

					Select p.char.fstatus$
					
					Case "jump"
					p.char.fanim$ = "churt"
					
					Case "crouch"
					p.char.fanim$ = "churt"
					
					
					Default
					p.char.fanim$ = "hurt"
					
					End Select
					
					p.char.hurt = True
					PlaySound whitsnd
					'f\fstatus$ = "hurt"
					p.char.dashing = False
					p.char.jup = False
						If p.etype = 1 Then
						p.char.energy = p.char.energy + 15
						If p.char.energy >= 175 Then p.char.energy = 175
						EndIf
					p.char.fanimating = True
					p.char.tmlife = p.char.tmlife - coll.damage / 2
					p.char.plife# = Float(p.char.tmlife) / Float(p.char.mlife) * 236
					p.char.dtaken = p.char.dtaken + coll.damage / 2
					p.char.tftaken# = Float(p.char.dtaken) / Float(p.char.mlife) * 236

					If p.char.tftaken# >= 236 Then p.char.tftaken# = 236
						For i:impact = EachIn impact_list
						If i.iid$ = "simpact" Then
						impacto:tempimpact = New tempimpact
						Select p.direction
						Case 0
						impacto.x = p.x + (a.fhcolx*ENGINESCALE#)
						impacto.y = p.ty + (a.fhcoly*ENGINESCALE#)
						impacto.direction = p.direction
						
						Case 1
						impacto.x = p.x - (a.fhcolx*ENGINESCALE#)
						impacto.y = p.ty + (a.fhcoly*ENGINESCALE#)
						impacto.direction = p.direction
						
						End Select
						impacto.fanimating = True
						impacto.fnum = 1
						impacto.nof = i.nof
						impacto.iid$ = i.iid$
						EndIf
						Next


				Else
							
						For i:impact = EachIn impact_list
						If i.iid$ = "bimpact" Then
						impacto:tempimpact = New tempimpact
						Select p.direction
						Case 0
						impacto.x = p.x + (a.fhcolx*ENGINESCALE#)
						impacto.y = p.ty + (a.fhcoly*ENGINESCALE#)
						impacto.direction = p.direction
						
						Case 1
						impacto.x = p.x - (a.fhcolx*ENGINESCALE#)
						impacto.y = p.ty + (a.fhcoly*ENGINESCALE#)
						impacto.direction = p.direction
						
						End Select
						impacto.fanimating = True
						impacto.fnum = 1
						impacto.nof = i.nof
						impacto.iid$ = i.iid$
						EndIf
						Next
					PlaySound blocksnd
					p.char.fanim$ = "block"
					p.char.fstatus$ = "block"
					p.char.fanimating = True
						If p.etype = 1 Then
						p.char.energy = p.char.energy + 1
						If p.char.energy >= 175 Then p.char.energy = 175
						EndIf
		
										
				
				EndIf
			EndIf
		EndIf
	End Select
EndIf
SetColor 0,0,255
'DrawRect coll.x,coll.y,coll.colx,coll.coly
SetColor 255,255,255
coll.life = coll.life - 1
If coll.life <= 0 Then coll.Remove()

EndIf			


End Function


Function hitf(p:player,a:animdata)

If a.fanim$ = "fireb" And p.char.bfball = True Then
x:fballa = New fballa
x.fid$ = p.char.fid$
x.life = 1000
Select p.direction
'depending on what direction the fighter is facing is what direction we shoot the fball
Case 0
x.x = p.x - (p.halign*ENGINESCALE#) + (a.fhcolx*ENGINESCALE#)
x.y = p.ty + (a.fhcoly*ENGINESCALE#)
x.direction = p.direction

Case 1
x.x = p.x + (p.halign*ENGINESCALE#) - (a.fhcolx*ENGINESCALE#)
x.y = p.ty + (a.fhcoly*ENGINESCALE#)
x.direction = p.direction

End Select


x.id = Rnd(1,10000)
p.char.bfball = False
x.nof = a.nof
x.frate = a.frate / 2
x.hitf = a.fhitf
x.team = p.team
x.pow = p.char.pow * 2

For q:frame = EachIn frame_list
For pooptemp = 0 To 20
If q.fanim$ = "fball" And q.fid$ = p.char.fid$ And q.fnum = pooptemp Then
v:fbframe = New fbframe
v.id = x.id
v.fnum = pooptemp
v.fball = q.fframe
'v.fball2 = CopyImage(q\fframe2)
'MaskImage v\fball,255,0,255
'MaskImage v\fball2,255,0,255
SetImageHandle(v.fball,ImageWidth(v.fball)/2,ImageHeight(v.fball)/2)
'MidHandle v\fball2
EndIf
Next
Next
EndIf




If a.fanim$ = "firebx" And p.char.bfball = True Then
x:fballa = New fballa
x.fid$ = p.char.fid$
x.life = 1000
Select p.direction

Case 0
x.x = p.x - (p.halign*ENGINESCALE#) + (a.fhcolx*ENGINESCALE#)
x.y = p.ty + (a.fhcoly*ENGINESCALE#)
x.direction = p.direction

Case 1
x.x = p.x + (p.halign*ENGINESCALE#) - (a.fhcolx*ENGINESCALE#)
x.y = p.ty + (a.fhcoly*ENGINESCALE#)
x.direction = p.direction

End Select

x.id = Rnd(1,10000)
p.char.bfball = False
x.nof = a.nof
x.frate = a.frate / 2
x.hitf = a.fhitf
x.pow = p.char.pow * 4
For q:frame = EachIn frame_list
For pooptemp = 0 To 20
If q.fanim$ = "fballx" And q.fid$ = p.char.fid$ And q.fnum = pooptemp Then
v:fbframe = New fbframe
v.id = x.id
v.fnum = pooptemp
v.fball = q.fframe
'v\fball2 = CopyImage(q\fframe2)
SetImageHandle(v.fball,ImageWidth(v.fball)/2,ImageHeight(v.fball)/2)

'MaskImage v\fball,255,0,255
'MaskImage v\fball2,255,0,255
'MidHandle v\fball
'MidHandle v\fball2
EndIf
Next
Next
EndIf


If a.fanim$ = "wpunch" Then
Select p.direction
Case 0
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow
coll.fid$ = p.fid$

Case 1
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx-(a.fhcolx*ENGINESCALE#)
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow
coll.fid$ = p.fid$

End Select
EndIf


If a.fanim$ = "spunch" Then
Select p.direction
Case 0
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow * 2
coll.fid$ = p.fid$

Case 1
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx-(a.fhcolx*ENGINESCALE#)
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow * 2
coll.fid$ = p.fid$

End Select
EndIf

If a.fanim$ = "apunch" Then
Select p.direction
Case 0
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow
coll.fid$ = p.fid$

Case 1
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx-(a.fhcolx*ENGINESCALE#)
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow
coll.fid$ = p.fid$

End Select
EndIf

If a.fanim$ = "cpunch" Then
Select p.direction
Case 0
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow
coll.fid$ = p.fid$

Case 1
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx-(a.fhcolx*ENGINESCALE#)
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow
coll.fid$ = p.fid$

End Select
EndIf

If a.fanim$ = "wkick" Then
Select p.direction
Case 0
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow
coll.fid$ = p.fid$

Case 1
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx-(a.fhcolx*ENGINESCALE#)
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow
coll.fid$ = p.fid$

End Select
EndIf


If a.fanim$ = "akick" Then
Select p.direction
Case 0
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow
coll.fid$ = p.fid$

Case 1
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx-(a.fhcolx*ENGINESCALE#)
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow
coll.fid$ = p.fid$

End Select
EndIf


If a.fanim$ = "ckick" Then
Select p.direction
Case 0
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow
coll.fid$ = p.fid$

Case 1
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx-(a.fhcolx*ENGINESCALE#)
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow
coll.fid$ = p.fid$

End Select
EndIf


If a.fanim$ = "skick" Then
Select p.direction
Case 0
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow * 2
coll.fid$ = p.fid$

Case 1
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx-(a.fhcolx*ENGINESCALE#)
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow * 2
coll.fid$ = p.fid$

End Select
EndIf


If a.fanim$ = "dash" Then
Select p.direction
Case 0
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow * 3
coll.fid$ = p.fid$

Case 1
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx-(a.fhcolx*ENGINESCALE#)
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow * 3
coll.fid$ = p.fid$

End Select
EndIf


If a.fanim$ = "dashx" Then
Select p.direction
Case 0
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow * 4
coll.fid$ = p.fid$

Case 1
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx-(a.fhcolx*ENGINESCALE#)
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow * 4
coll.fid$ = p.fid$

End Select
EndIf


If a.fanim$ = "special" Then
Select p.direction
Case 0
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow * 3
coll.fid$ = p.fid$

Case 1
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx-(a.fhcolx*ENGINESCALE#)
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow * 3
coll.fid$ = p.fid$

End Select
EndIf


If a.fanim$ = "specialx" Then
Select p.direction
Case 0
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow * 4
coll.fid$ = p.fid$

Case 1
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx-(a.fhcolx*ENGINESCALE#)
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow * 4
coll.fid$ = p.fid$

End Select
EndIf


If a.fanim$ = "fatal" Then
Select p.direction
Case 0
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow * 6
coll.fid$ = p.fid$

Case 1
'Color 255,0,0
coll:collbox = New collbox
coll.x = p.tx-(a.fhcolx*ENGINESCALE#)
coll.y = p.ty+(a.fhcoly*ENGINESCALE#)
coll.colx = (a.fhcolx*ENGINESCALE#)
coll.coly = (a.fheight*ENGINESCALE#)-(a.fhcoly*ENGINESCALE#)
coll.life = 2
coll.team = p.team
coll.damage = p.char.pow * 6
coll.fid$ = p.fid$

End Select
EndIf


End Function


Function splashfinal()
If SPLSHRNDSTART = False Then
SPLSHRNDSTART = True
SPLSHTIME = 80
SPLSHCURTIME = 0
SLPSHSCALE# = 0
SPLSHRNDPHASE = 0
clearevents()
PlaySound victsnd
Else
mevent = PollEvent()
If mevent = EVENT_TIMERTICK And EventSource() = INOUTRND Then

SPLSHCURTIME = SPLSHCURTIME + 1


EndIf
Select SPLSHRNDPHASE

Case 0
'SLPSHSCALE# = ((Float(SPLSHCURTIME)/Float(SPLSHTIME))*4)
Cls
'SLPSHSCALE# = SLPSHSCALE# + 0.001
'If SLPSHSCALE# >= 2 Then SLPSHSCALE# = 2
'SetScale(SLPSHSCALE#,SLPSHSCALE#)
'DrawImage koim,GraphicsWidth()/2,GraphicsHeight()/2
'SetScale(ENGINESCALE#,ENGINESCALE#)
DrawText WINNER.char.fname$+" Wins",100,100 
Flip

If SPLSHCURTIME >= SPLSHTIME Then 
SPLSHRNDPHASE = 1
SPLSHCURTIME = 0
SPLSHTIME = 30
'WINNER.char.selb = LoadImage()
'PlaySound fightsnd
EndIf


Case 1
For a:animdata = EachIn animdata_list
a.Remove()
Next
For g:frame = EachIn frame_list
g.Remove()
Next
For p:player = EachIn player_list
p.char.Remove()
p.Remove()
Next
For vic:victory = EachIn victory_list
vic.Remove()
Next
OLDMAXL = 0
OLDMAXR = 640
ENGINESTATUS$ = ""
If GNETSUCCESS = 0 Then
fighterselmenu = createselectionscreen()
allowp2menu(fighterselmenu)
setmenufx(fighterselmenu,"Lightning",20,0,20,480)
setmenufx(fighterselmenu,"Lightning",610,0,610,480)

setmenufx(fighterselmenu,"Lightning",120,0,120,480)
setmenufx(fighterselmenu,"Lightning",510,0,510,480)
Else
Select HOSTJOIN

Case 1

deleteallmenus()
chatmenu = createhostchatmenu()
chatsayer = createchatsaymenu()
chatmesslist = createchatlistmenu()

Case 2
deleteallmenus()
chatmenu = createclientchatmenu()
chatsayer = createchatsaymenu()
chatmesslist = createchatlistmenu()

Default
fighterselmenu = createselectionscreen()
allowp2menu(fighterselmenu)
setmenufx(fighterselmenu,"Lightning",20,0,20,480)
setmenufx(fighterselmenu,"Lightning",610,0,610,480)

setmenufx(fighterselmenu,"Lightning",120,0,120,480)
setmenufx(fighterselmenu,"Lightning",510,0,510,480)


End Select




EndIf



End Select


EndIf

End Function

Function splashend()
If SPLSHRNDSTART = False Then
SPLSHRNDSTART = True
SPLSHTIME = 50
SPLSHCURTIME = 0
SLPSHSCALE# = 0
SPLSHRNDPHASE = 0
clearevents()
PlaySound victsnd
DebugLog "Play KO" 
Else
mevent = PollEvent()
If mevent = EVENT_TIMERTICK And EventSource() = INOUTRND Then

SPLSHCURTIME = SPLSHCURTIME + 1


EndIf
Select SPLSHRNDPHASE

Case 0
SLPSHSCALE# = ((Float(SPLSHCURTIME)/Float(SPLSHTIME))*4)
'SLPSHSCALE# = SLPSHSCALE# + 0.001
'If SLPSHSCALE# >= 2 Then SLPSHSCALE# = 2
SetScale(SLPSHSCALE#,SLPSHSCALE#)
DrawImage koim,GraphicsWidth()/2,GraphicsHeight()/2
SetScale(ENGINESCALE#,ENGINESCALE#)
If SPLSHCURTIME >= SPLSHTIME Then 
SPLSHRNDPHASE = 1
SPLSHCURTIME = 0
SPLSHTIME = 40
DebugLog "Played KO going to stat reset and victorys"
'PlaySound fightsnd
EndIf




Case 1
MOSTVICS = 0
PERFECT = False
For p:player = EachIn player_list

'For f.fight = Each fight
If p.lost = False And p.char.fid$ = p.fid$ Then
Print "Character "+p.char.fid$+" cHP: "+p.char.tmlife+" mhp: "+p.char.mlife
If p.char.tmlife = p.char.mlife Then 
PERFECT = True
Print "Character "+p.char.fid$+" cHP: "+p.char.tmlife+" mhp: "+p.char.mlife
Print "PERFECT?"
DebugLog "Got a perfect"
EndIf
p.vic = p.vic + 1
If p.vic > MOSTVICS Then WINNER:player = p:player
vic:victory = New victory

Select p.team

Case 1
vic.y = 40*ENGINESCALE#
vic.vicnum = p.vic
vic.fid$ = p.fid$
SetMaskColor(255,0,255)
vic.vicim = LoadImage("menu\vic.png")
vic.x = ImageWidth(vic.vicim) * p.vic
'MaskImage vic\vicim,255,0,255

Case 2
vic.y = 40*ENGINESCALE#
vic.vicnum = p.vic
vic.fid$ = p.fid$
SetMaskColor(255,0,255)
vic.vicim = LoadImage("menu\vic.png")
vic.x = 640-(ImageWidth(vic.vicim)*ENGINESCALE#) * p.vic
'MaskImage vic\vicim,255,0,255

End Select

EndIf

'For f.fight = Each fight
DebugLog "RESETING STATS"

'Next

Next
p1vicss=0
p2vicss=0
For p:player = EachIn player_list
If p.team = 1 Then
p1vicss = p.vic
EndIf
If p.team = 2 Then
p2vicss = p.vic
EndIf

Next

If PERFECT = False Then
DebugLog "NO PERFECT"

SPLSHRNDPHASE = 3
SPLSHCURTIME = 0
SLPSHSCALE# = 0
SPLSHTIME = 40
clearevents()
Else
DebugLog "YES PERFECT"
SPLSHRNDPHASE = 2
SPLSHCURTIME = 0
SLPSHSCALE# = 0
SPLSHTIME = 40
clearevents()
PlaySound perfectsnd
PERFECT = False
DebugLog "GOING TO PERFECT DISPLAY"
EndIf

Case 2
SLPSHSCALE# = ((Float(SPLSHCURTIME)/Float(SPLSHTIME))*4)
'SLPSHSCALE# = SLPSHSCALE# + 0.001
'If SLPSHSCALE# >= 2 Then SLPSHSCALE# = 2
SetScale(SLPSHSCALE#,SLPSHSCALE#)
DrawImage perfectim,GraphicsWidth()/2,GraphicsHeight()/2
SetScale(ENGINESCALE#,ENGINESCALE#)
If SPLSHCURTIME >= SPLSHTIME Then 
DebugLog "Done Drawing Perfect go to End Splash"
SPLSHRNDPHASE = 3
SPLSHCURTIME = 0
SPLSHTIME = 30
PERFECT = False
'PlaySound fightsnd
EndIf


Case 3


If CURRENTRND >= MAINGAMEROUNDS-1 And p1vicss <> p2vicss Then
DebugLog "End Game"
SPLSHRNDSTART = False
ENGINESTATUS$ = "ENDGAME"
For p:player = EachIn player_list
	p.char.tmlife = p.char.mlife
	p.char.dtaken = 0
	p.char.plife# = Float(p.char.tmlife) / Float(p.char.mlife) * 236
	p.char.tftaken# = 0
	p.lost = False
	p.char.fstatus$ = ""
Next
SPLSHRNDPHASE = 0
Else
DebugLog "GO TO NEXT ROUND "+CURRENTRND+1
CURRENTRND = CURRENTRND + 1
SPLSHRNDSTART = False
For p:player = EachIn player_list
	p.char.tmlife = p.char.mlife
	p.char.dtaken = 0
	p.char.plife# = Float(p.char.tmlife) / Float(p.char.mlife) * 236
	p.char.tftaken# = 0
	p.lost = False
	p.char.fstatus$ = ""
Next
ENGINESTATUS$ = "RESET"
SPLSHRNDPHASE = 0

DebugLog "set status to reset"
EndIf

End Select
EndIf

End Function

Function splashround(roundnum)

If SPLSHRNDSTART = False Then
SPLSHRNDSTART = True
SPLSHTIME = 50
SPLSHCURTIME = 0
SLPSHSCALE# = 0
SPLSHRNDPHASE = 0
clearevents()
PlaySound rndsound[roundnum]
Else
mevent = PollEvent()
If mevent = EVENT_TIMERTICK And EventSource() = INOUTRND Then

SPLSHCURTIME = SPLSHCURTIME + 1


EndIf

Select SPLSHRNDPHASE

Case 0

SLPSHSCALE# = ((Float(SPLSHCURTIME)/Float(SPLSHTIME))*4)
'SLPSHSCALE# = SLPSHSCALE# + 0.001
'If SLPSHSCALE# >= 2 Then SLPSHSCALE# = 2
SetScale(SLPSHSCALE#,SLPSHSCALE#)
DrawImage Rounda[roundnum],GraphicsWidth()/2,GraphicsHeight()/2
SetScale(ENGINESCALE#,ENGINESCALE#)
If SPLSHCURTIME >= SPLSHTIME Then 
SPLSHRNDPHASE = 1
SPLSHCURTIME = 0
SPLSHTIME = 30
PlaySound fightsnd
EndIf


Case 1
SLPSHSCALE# = ((Float(SPLSHCURTIME)/Float(SPLSHTIME))*4)
'SLPSHSCALE# = SLPSHSCALE# + 0.001
'If SLPSHSCALE# >= 2 Then SLPSHSCALE# = 2
SetScale(SLPSHSCALE#,SLPSHSCALE#)
DrawImage fightim,GraphicsWidth()/2,GraphicsHeight()/2
SetScale(ENGINESCALE#,ENGINESCALE#)
If SPLSHCURTIME >= SPLSHTIME Then 
SPLSHRNDPHASE = 2
SPLSHCURTIME = 0
EndIf

Case 2
SPLSHRNDSTART = False
ENGINESTATUS$ = "FIGHT"
SPLSHRNDPHASE = 0
End Select

EndIf

End Function



Function RectsOverlap(x1,y1,w1,h1,x2,y2,w2,h2)



If x1+w1 >= x2 And x1 <= x2+w2 And y1+h1 >= y2 And y1 <= y2+h2 Then
Return True
Else
Return False
EndIf

End Function




Function drawlifebars(p:player)
Select p.team
Case 1
'If p.char.plife# >= 236 Then
'SetColor 0,255,0
'Else
SetColor p.char.tftaken#,p.char.plife#,0
'EndIf
DrawRect 14,32,p.char.plife#/2,5
SetColor 255,255,255
DrawImage lifebarim,0,30




'270x13
SetImageFont fntArialA
SetColor 0,0,0
DrawText "Pts:"+p.spoints,1,1
'SetFont fntArialB
DrawText p.char.fname$,3,64
SetColor 255,255,255
'SetFont fntArialD
DrawText "Pts:"+p.spoints,0,0
'SetFont fntArialB
DrawText p.char.fname$,0,62
SetImageFont fntArialD

Case 2
'If p.char.plife# >= 236 Then
'SetColor 0,255,0
'Else
SetColor p.char.tftaken#,p.char.plife#,0
'EndIf
SetScale -ENGINESCALE#,ENGINESCALE#

DrawRect 626,32,p.char.plife#/2,5
SetColor 255,255,255

DrawImage lifebarim,640,30
SetScale ENGINESCALE#,ENGINESCALE#

SetColor 0,0,0
SetImageFont fntArialA
DrawText "Pts:"+p.spoints,640-(TextWidth("Pts:"+p.spoints)*ENGINESCALE#)+1,1
'SetFont fntArialB
DrawText p.char.fname$,640-(TextWidth(p.char.fname$)*ENGINESCALE#)+3,64
SetColor 255,255,255
'SetFont fntArialD

DrawText "Pts:"+p.spoints,640-(TextWidth("Pts:"+p.spoints)*ENGINESCALE#),0
'SetFont fntArialB

DrawText p.char.fname$,640-(TextWidth(p.char.fname$)*ENGINESCALE#),62
SetImageFont fntArialD

End Select

End Function


Function drawebars(p:player)
Select p.team



Case 1

Select p.etype

Case 0
SetColor p.char.energy,p.char.energy,255
DrawRect 18,480-14,Float(Float(p.char.energy)/Float(175))*Float(82),4
Case 1
SetColor 255,p.char.energy,p.char.energy
DrawRect 18,480-14,Float(Float(p.char.energy)/Float(175))*Float(82),4

Case 2
SetColor 255,p.char.energy,0
DrawRect 18,480-14,Float(Float(p.char.energy)/Float(175))*Float(82),4

Case 3
If p.char.plife# >= 60 Then
SetColor 155,155,155
DrawRect 18,480-14,Float(Float(p.char.energy)/Float(175))*Float(82),4
p.char.energy = 0
Else
SetColor Rnd(1,255),Rnd(1,255),Rnd(1,255)
DrawRect 18,480-14,Float(Float(p.char.energy)/Float(175))*Float(82),4
p.char.energy = 175
EndIf


Case 4
SetColor 255,p.char.energy,0
DrawRect 18,480-14,Float(Float(p.char.energy)/Float(175))*Float(82),4


End Select
SetColor(255,255,255)
DrawImage ebar[p.etype],0,480-22
If p.char.energy = 175 Then blitzmalen(18,480-14,Float(18)+((Float(Float(p.char.energy)/Float(175))*Float(82))*2),480-14)


Case 2
SetScale(-ENGINESCALE#,ENGINESCALE#)
Select p.etype

Case 0
SetColor p.char.energy,p.char.energy,255
DrawRect 622,480-14,Float(Float(p.char.energy)/Float(175))*Float(82),4

Case 1
'DrawImage ebaro,320-ImageWidth(ebaro),240-22
SetColor 255,p.char.energy,p.char.energy
DrawRect 622,480-14,Float(Float(p.char.energy)/Float(175))*Float(82),4


Case 2
SetColor 255,p.char.energy,0
DrawRect 622,480-14,Float(Float(p.char.energy)/Float(175))*Float(82),4

Case 3
If p.char.plife# >= 60 Then
SetColor 155,155,155
DrawRect 622,480-14,Float(Float(p.char.energy)/Float(175))*Float(82),4
p.char.energy = 0
Else
SetColor Rnd(1,255),Rnd(1,255),Rnd(1,255)
DrawRect 622,480-14,Float(Float(p.char.energy)/Float(175))*Float(82),4
p.char.energy = 175
EndIf

Case 4
SetColor 255,p.char.energy,0
DrawRect 622,480-14,Float(Float(p.char.energy)/Float(175))*Float(82),4


End Select
SetColor(255,255,255)
DrawImage ebar[p.etype],640,480-22
SetScale(ENGINESCALE#,ENGINESCALE#)
If p.char.energy = 175 Then blitzmalen(Float(622)-((Float(Float(p.char.energy)/Float(175))*Float(82))*2),480-14,Float(622),480-14)

End Select

End Function







Function drawvics()
For vic:victory = EachIn victory_list
If vic.fid$ <> "" Then
DrawImage vic.vicim,vic.x,vic.y
EndIf
Next
End Function
















Function fighterai(p:player)

p.oldpx = p.x
Select p.direction
Case 0
If p.x <= 0-(ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2 Then p.x = 0-(ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2
Case 1
If p.x >= 0-((ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2)+(ImageWidth(CURRENTSTAGE)*ENGINESCALE#) Then p.x = 0-((ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2)+(ImageWidth(CURRENTSTAGE)*ENGINESCALE#)


End Select

'If p\x <= 0 Then p\x = 0
'If p\x >= 320 Then p\x = 320


If p.char.tmlife <= 0 Then
p.fmode$ = "lose"
p.char.fanim$ = "lose"
'ENGINESTATUS$ = "OUTRO"
p.char.fanimating = True
p.lost = True
EndIf


If p.char.fstatus$ <> "jump" Then
p.y = p.y + ((p.char.spd * 3)*ENGINESCALE#)
If p.y > 0 Then
p.y = 0
EndIf
EndIf


If p.char.hurt = True Then
Select p.direction

Case 0
p.x = p.x - 1
If p.x+p.halign*ENGINESCALE# <= 0-((ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2) Then p.x = 0-((ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2)
Case 1
p.x = p.x + 1
If p.x-p.halign*ENGINESCALE# >= 0-((ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2)+(ImageWidth(CURRENTSTAGE)*ENGINESCALE#) Then p.x = 0-((ImageWidth(CURRENTSTAGE)*ENGINESCALE#)/2)+(ImageWidth(CURRENTSTAGE)*ENGINESCALE#)

End Select
EndIf


If p.char.jup = False Then
p.y = p.y + ((p.char.spd * 3)*ENGINESCALE#)
If p.y > 0 Then
p.y = 0
EndIf
EndIf




If p.desctime > 0 Then 
p.desctime = p.desctime - 1
EndIf

If p.desctime <= 0 And p.char.fanimating = False Then

If p.closeup = False Then
p.descrnd = Rand(1,7)
Else
p.descrnd = Rand(7,14)
EndIf


Select p.descrnd

Case 1
p.bmtimer = True
p.char.fstatus$ = "walk"
p.char.fanim$ = "walk"
p.char.fanimating = True
p.desctime = Rand(20,120)
p.descdir = Rand(0,1)
If p.tx >= 640 Then 
p.descdir = 0
If GAMEENGINETYPE$="Brawl" Then
p.direction = 1
EndIf
EndIf
If p.tx <= 0 Then
p.descdir = 1
If GAMEENGINETYPE$="Brawl" Then
p.direction = 0
EndIf

EndIf
Case 2
p.bmtimer = True
p.char.fstatus$ = "stand"
p.char.fanim$ = "stand"
p.char.fanimating = True
p.desctime = Rand(10,20)

Case 3
p.bmtimer = True
p.char.fanim$ = "crouch"
p.char.fstatus$ = "crouch"
p.char.fanimating = True
p.desctime = Rand(20,60)

Case 4
p.descdir = Rand(0,2)

p.char.fstatus$ = "jump"
p.char.fanim$ = "jump"

p.bmtimer = True
p.char.jumpheight = 0
p.char.jup = True
p.char.fanimating = True

Case 5
If p.char.fstatus$ <> "jump" Then
If p.etype = 0 Then
p.desctime = Rand(5,60)
p.char.fanimating = True
p.bmtimer = True
p.char.fanim$ = "powerup"
p.char.fstatus$ = "powerup"
EndIf
EndIf 

Select p.descdir
Case 0
p.char.jtype$ = "up"
Case 1
If p.tx >= 640 Then 
p.char.jtype$ = "lup"
Else
p.char.jtype$ = "rup"
EndIf
Case 2
If p.tx <= 0 Then 
p.char.jtype$ = "rup"
Else
p.char.jtype$ = "lup"
EndIf
End Select


Case 6

If p.etype = 2 Then
p.char.energy = p.char.energy + 20
If p.char.energy >= 175 Then p.char.energy = 175
EndIf
If p.char.energy >= 45 Then
If p.char.firebx$ <> "" Then
p.char.fstatus$ = "firebx"
p.char.fanim$ = "firebx"
p.fmode$ = "special"
ENGINESTATUS$ = "SPECIAL"
p.getbgs = True
p.char.energy = p.char.energy - 45
EndIf
Else
If p.char.fireb$ <> "" Then
p.char.fstatus$ = "fireb"
p.char.fanim$ = "fireb"
EndIf
EndIf
p.bmtimer = True
p.char.fanimating = True
p.char.bfball = True


Case 7

If p.etype = 2 Then
p.char.energy = p.char.energy + 20
If p.char.energy >= 175 Then p.char.energy = 175
EndIf
If p.char.energy >= 45 Then
If p.char.dashx$ <> "" Then
p.char.fstatus$ = "dashx"
p.char.fanim$ = "dashx"
p.fmode$ = "special"
ENGINESTATUS$ = "SPECIAL"
p.getbgs = True
p.char.energy = p.char.energy - 45
EndIf
Else
If p.char.dash$ <> "" Then
p.char.fstatus$ = "dash"
p.char.fanim$ = "dash"
EndIf
EndIf
p.char.dashing = True
p.bmtimer = True
p.char.fanimating = True


Case 8

If p.etype = 2 Then
p.char.energy = p.char.energy + 20
If p.char.energy >= 175 Then p.char.energy = 175
EndIf
If p.char.energy >= 45 Then
If p.char.specx$ <> "" Then
p.char.fstatus$ = "specialx"
p.char.fanim$ = "specialx"
p.fmode$ = "special"
ENGINESTATUS$ = "SPECIAL"
p.getbgs = True
p.char.energy = p.char.energy - 45
EndIf
Else
If p.char.spec$ <> "" Then
p.char.fstatus$ = "special"
p.char.fanim$ = "special"
EndIf
EndIf
p.char.dashing = True
p.bmtimer = True
p.char.fanimating = True


Case 9
p.bmtimer = True
If p.char.fstatus$ = "jump" Then
p.char.fstatus$ = "apunch"
p.char.fanim$ = "apunch"
Else
p.char.fstatus$ = "wpunch"
p.char.fanim$ = "wpunch"
EndIf
p.char.fanimating = True
p.closeup = False
Case 10
p.bmtimer = True
If p.char.fstatus$ = "jump" Then
p.char.fstatus$ = "apunch"
p.char.fanim$ = "apunch"
Else
p.char.fstatus$ = "spunch"
p.char.fanim$ = "spunch"
EndIf
p.char.fanimating = True
p.closeup = False
Case 11
p.bmtimer = True
If p.char.fstatus$ = "jump" Then
p.char.fstatus$ = "akick"
p.char.fanim$ = "akick"
Else
p.char.fstatus$ = "wkick"
p.char.fanim$ = "wkick"
EndIf
p.char.fanimating = True
p.closeup = False
Case 12
p.bmtimer = True
If p.char.fstatus$ = "jump" Then
p.char.fstatus$ = "akick"
p.char.fanim$ = "akick"
Else
p.char.fstatus$ = "skick"
p.char.fanim$ = "skick"
EndIf
p.char.fanimating = True
p.closeup = False
Case 13
p.bmtimer = True
p.char.fstatus$ = "ckick"
p.char.fanim$ = "ckick"
p.char.fanimating = True
p.closeup = False
Case 14
p.bmtimer = True
p.char.fstatus$ = "cpunch"
p.char.fanim$ = "cpunch"
p.char.fanimating = True
p.closeup = False
End Select

EndIf


Select p.char.fstatus$

Case "jump"
If p.char.jup = True Then
jumpup(p:player)
EndIf


Case "powerup"
p.char.ctime = p.char.ctime + p.char.spd
If p.char.ctime >= 50 Then
p.char.energy = p.char.energy + p.char.spr
p.char.ctime = 0
EndIf
If p.char.energy >= 175 Then p.char.energy = 175

Case "walk"
Select p.direction

Case 0
p.char.fanim$ = "walk"

If p.descdir = 0 Then

If Not p.tx >= 640 Then p.x = p.x + p.char.spd/2
If p.tx >= p.oppx - 160 Then 
p.char.fanimating = False 
p.desctime = 0

p.closeup = True
Else
p.closeup = False
EndIf
Else
If Not p.tx <= 0 Then p.x = p.x - p.char.spd/2
If p.tx <= 0 Then 
p.desctime = 0

EndIf
EndIf
Case 1
p.char.fanim$ = "walk"
If p.descdir = 0 Then
If Not p.tx <= 0 Then p.x = p.x - p.char.spd/2
If p.tx <= p.oppx + 160 Then 
p.char.fanimating = False 
p.desctime = 0

p.closeup = True
Else
p.closeup = False
EndIf

Else
If Not p.tx >= 640 Then p.x = p.x + p.char.spd/2
If p.tx >= 640 Then 
p.char.fanimating = False 
p.desctime = 0

EndIf
EndIf
End Select


End Select


Select p.direction

Case 0
If p.tx >= p.oppx - 160 Then 
p.closeup = True
Else
p.closeup = False
EndIf
Case 1
If p.tx <= p.oppx + 160 Then 
p.closeup = True
Else
p.closeup = False
EndIf
End Select

If p.char.dashing = True And p.char.fanimating = True Then
Select p.direction

Case 0
p.x = p.x + p.char.spd

Case 1
p.x = p.x - p.char.spd

End Select
EndIf

If p.char.tmlife > 0 And plose = True Then
p.char.fstatus$ = "outro"
p.char.fanim$ = "outro"
p.char.fanimating = True
EndIf

If GAMEENGINETYPE$="Arcade" Then
Select p.direction
Case 0
If p.char.fstatus$ <> "jump" Then
If p.x >= p.oppx Then p.x = p.oldpx
EndIf

Case 1
If p.char.fstatus$ <> "jump" Then
If p.x <= p.oppx Then p.x = p.oldpx
EndIf

End Select
EndIf
End Function



Function netplayercontrol(p:player)

p.x = GetGNetInt( p.playerObj,NETPX )
p.y = GetGNetInt( p.playerObj,NETPY )
p.team = GetGNetInt( p.playerObj,NETPTEAM )
p.playertype$ = "NET"
p.char.tmlife = GetGNetInt( p.playerObj,NETTLIFE )
p.char.plife# = GetGNetFloat( p.playerObj,NETPLIFE )
p.char.mlife = GetGNetInt( p.playerObj,NETMLIFE )
p.char.tmlife = GetGNetInt( p.playerObj,NETTMLIFE )
p.char.fanimating = GetGNetInt( p.playerObj,NETPANIMB )
p.char.energy =  GetGNetInt( p.playerObj,NETENERGY )
p.fid$ = GetGNetString( p.playerObj,NETFID )
p.char.fighternum =  GetGNetInt( p.playerObj,NETFITNUM )
p.char.fname$ = GetGNetString( p.playerObj,NETFNAME )
p.char.fanim$ = GetGNetString( p.playerObj,NETFANIM )
p.direction = GetGNetInt( p.playerObj,NETDIR )
p.char.fstatus$ = GetGNetString( p.playerObj,NETFSTATUS )
p.char.jtype$ = GetGNetString( p.playerObj,NETJTYPE )
p.char.hurt = GetGNetInt( p.playerObj,NETHURT )
p.char.dtaken = GetGNetInt( p.playerObj,NETDTAKEN )
p.char.tftaken# = GetGNetFloat( p.playerObj,NETFTAKEN )
p.char.jumpheight = GetGNetInt( p.playerObj,NETJHEIGHT)
p.char.jup = GetGNetInt( p.playerObj,NETJUP)
p.char.dashing = GetGNetInt( p.playerObj,NETDASH)
p.getbgs = GetGNetInt( p.playerObj,NETGETBGS)
p.lost = GetGNetInt( p.playerObj,NETLOST)
p.fmode$ = GetGNetString( p.playerObj,NETFMODE)

p.char.jtype$ = GetGNetString( p.playerObj,NETJTYPE )
p.etype = GetGNetInt( p.playerObj,NETETYPE)
P1FSELREADY = GetGNetInt( p.playerObj,NETPREADY)
p.netname$ = GetGNetString( p.playerObj,NETNAME )
p.fightloaded = GetGNetInt( p.playerObj,NETFIGHTLOADED)


End Function

Function transmitplayer(p:player)
  SetGNetInt( p.playerObj,NETPX,p.x )
  SetGNetInt( p.playerObj,NETPY,p.y )
  SetGNetInt( p.playerObj,NETPTEAM,p.team )

  SetGNetInt( p.playerObj,NETTLIFE,p.char.tmlife )
  SetGNetFloat( p.playerObj,NETPLIFE,p.char.plife# )
  SetGNetInt( p.playerObj,NETMLIFE,p.char.mlife )
 SetGNetInt( p.playerObj,NETTMLIFE,p.char.tmlife  )
  SetGNetInt( p.playerObj,NETPANIMB,p.char.fanimating )
   SetGNetInt( p.playerObj,NETENERGY,p.char.energy )
  SetGNetString( p.playerObj,NETFID,p.fid$ )
   SetGNetInt( p.playerObj,NETFITNUM,p.char.fighternum )
  SetGNetString( p.playerObj,NETFNAME,p.char.fname$ )
  SetGNetString( p.playerObj,NETFANIM,p.char.fanim$ )
  SetGNetInt( p.playerObj,NETDIR,p.direction )
  SetGNetString( p.playerObj,NETFSTATUS,p.char.fstatus$ )
 SetGNetString( p.playerObj,NETJTYPE,p.char.jtype$  )
  SetGNetInt( p.playerObj,NETHURT,p.char.hurt )
  SetGNetInt( p.playerObj,NETDTAKEN,p.char.dtaken )
  SetGNetFloat( p.playerObj,NETFTAKEN,p.char.tftaken# )
  SetGNetInt( p.playerObj,NETJHEIGHT,p.char.jumpheight)
  SetGNetInt( p.playerObj,NETJUP,p.char.jup)
  SetGNetInt( p.playerObj,NETDASH,p.char.dashing)
  SetGNetInt( p.playerObj,NETGETBGS,p.getbgs)
  SetGNetString( p.playerObj,NETFMODE,p.fmode$)
  SetGNetInt( p.playerObj,NETLOST,p.lost)

  SetGNetString( p.playerObj,NETJTYPE,p.char.jtype$ )
  SetGNetInt( p.playerObj,NETETYPE,p.etype)
  'SetGNetInt( p.playerObj,NETPREADY,P1FSELREADY)
  SetGNetString( p.playerObj,NETNAME,p.netname$ )
  SetGNetInt( p.playerObj,NETFIGHTLOADED,1)
End Function
