Function drawmenus()
SetColor(255,255,255)
For men:menu = EachIn menu_list
	If men.bhidden = False Then
		If men.bgpath$ <> "" Then 

		DrawImage men.bg,0,0
		EndIf
		
		For mfx:menufxa = EachIn menufx_list
		If mfx.parent = men Then
		Select mfx.menufx$
		
		Case "Lightning"
		blitzmalen(mfx.fxx,mfx.fxy,mfx.fxw,mfx.fxh)
		
		
		End Select
		EndIf
		Next
		tmcol = 0
		For itm:menuitem = EachIn menuitem_list
			If itm.mparent = men.mhandle Then

				If itm.imagepath$ <> "" Then
					'Select men.listt

					'Case 0
						If men.y+(itm.index*men.bim) < men.y+men.h Then
							If itm.index = men.currentind And men.denyp1 = False Then
											If itm.selbgimgpath$ <> "" Then
											If itm.itembgscale = True Then
											SetScale(itm.sscale#,itm.sscale#)
											EndIf
											DrawImage itm.selbgimg,0,0
											If itm.itembgscale = True Then
											SetScale(2,2)
											EndIf
											EndIf
							If men.selimgpath$ <> "" Then 
							glow#=Cos(MilliSecs()/4)
							lum#=(Abs(glow#*Sin(glow#))*100)
							SetAlpha(lum#)
							DrawImage men.selimg,men.x+(tmcol*(men.bim2*2))-5,men.y+((itm.index/men.col)*(men.bim*2))
							SetAlpha(1)
							
							EndIf
							EndIf
							If itm.index = men.currentind2 And men.bp2active = True Then
											If itm.selbgimgpath$ <> "" Then
											
											If itm.itembgscale = True Then
											SetScale(itm.sscale#,itm.sscale#)
											EndIf
											DrawImage itm.selbgimg,640-(ImageWidth(itm.selbgimg)*2),0
											If itm.itembgscale = True Then
											SetScale(2,2)
											EndIf

											
											EndIf
							If men.selimgpath$ <> "" Then 
							glow#=Cos(MilliSecs()/4)
							lum#=(Abs(glow#*Sin(glow#))*100)
							SetAlpha(lum#)
							DrawImage men.selimg,men.x+(tmcol*(men.bim2*2))-5,men.y+((itm.index/men.col)*(men.bim*2))
							SetAlpha(1)
							
							EndIf
							EndIf

							'DebugLog "x pos: "+men.x'men.col'*(men.bim2*2))
							
							DrawImage itm.image,men.x+(tmcol*(men.bim2*2)),men.y+((itm.index/men.col)*(men.bim*2))
						EndIf



					'End Select

				Else

				'Select men.listt

				'Case 0
					If men.y+(itm.index*TextHeight(itm.ttext$)) < men.y+men.h Then
						If itm.index = men.currentind And men.denyp1 = False Then
											If itm.selbgimgpath$ <> "" Then
											If itm.itembgscale = True Then
											SetScale(itm.sscale#,itm.sscale#)
											EndIf
											DrawImage itm.selbgimg,0,0
											If itm.itembgscale = True Then
											SetScale(2,2)
											EndIf

											EndIf
						If men.selimgpath$ <> "" Then 

							glow#=Cos(MilliSecs()/4)
							lum#=(Abs(glow#*Sin(glow#))*100)
							SetAlpha(lum#)
							tempx = men.x+((itm.index/men.col)*(TextWidth(itm.ttext$)*2))
							tempy = men.y+((itm.index/men.col)*(TextHeight(itm.ttext$)*2))-5
						'DrawImage men.selimg,men.x+(itm.index/men.col)/itm.index,men.y+((itm.index/men.col)*(men.bim*2))
						DrawImage men.selimg,men.x,men.y+((itm.index/men.col)*(TextHeight(itm.ttext$)*2))-5

						'(itm.index/men.col)/itm.index
						SetAlpha(1)
						EndIf
						EndIf
						If itm.index = men.currentind2 And men.bp2active = True Then
											If itm.selbgimgpath$ <> "" Then
											
											If itm.itembgscale = True Then
											SetScale(itm.sscale#,itm.sscale#)
											EndIf
											DrawImage itm.selbgimg,640-(ImageWidth(itm.selbgimg)*2),0
											If itm.itembgscale = True Then
											SetScale(2,2)
											EndIf

											EndIf
						If men.selimgpath$ <> "" Then 

							glow#=Cos(MilliSecs()/4)
							lum#=(Abs(glow#*Sin(glow#))*100)
							SetAlpha(lum#)
							tempx = men.x+((itm.index/men.col)*(TextWidth(itm.ttext$)*2))
							tempy = men.y+((itm.index/men.col)*(TextHeight(itm.ttext$)*2))-5
						'DrawImage men.selimg,men.x+(itm.index/men.col)/itm.index,men.y+((itm.index/men.col)*(men.bim*2))
						DrawImage men.selimg,men.x,men.y+((itm.index/men.col)*(TextHeight(itm.ttext$)*2))-5

						'(itm.index/men.col)/itm.index
						SetAlpha(1)
						EndIf
						EndIf
						If men.menufont <> Null Then 
						SetImageFont men.menufont
						Else
						SetImageFont fntArialD
						EndIf
						SetColor 0,0,0
						DrawText itm.ttext$,men.x,men.y+((itm.index/men.col)*(TextHeight(itm.ttext$)*2))+1
						SetColor 255,255,255
						DrawText itm.ttext$,men.x,men.y+((itm.index/men.col)*(TextHeight(itm.ttext$)*2))
					SetImageFont fntArialD
					EndIf

				'End Select


				EndIf
				tmcol = tmcol + 1
				If tmcol >= men.col Then tmcol = 0
			EndIf

		Next

EndIf
Next

Rem
DrawImage logo,0,0
glow#=Cos(MilliSecs()/4)
lum#=(Abs(glow#*Sin(glow#))*100)
SetAlpha(lum#)

DrawImage barim,180,240+offsety
SetAlpha(1)
DrawImage arcadem,180,240
DrawImage multiplay,180,300
DrawImage optionim,180,360
DrawImage exitim,180,420
'drawing the menu
'SetColor 255,0,0
'SetImageFont fntArialA
'SetColor 0,0,0
'Text 1,1,"Version 1.72b Freeware not to be sold!"
'SetColor 255,255,255
'Text 0,0,"Version 1.72b Freeware not to be sold!"
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




'here by pressign up or down you can scroll through the menu commands.

'when the user presses enter it executes the menu option they had selected
If KeyHit(28) Then

PlaySound menuentsnd
SetImageFont fntArialB 
arcadeplayer = 1
p:bbplayer = New bbplayer
p.playernum = 1
p.selectedfighter = 1
p.team = 1

p.colred = Rnd(20,255)
p.colgreen = Rnd(20,255)
p.colblue = Rnd(20,255)
p.playertype$ = "human"
p.direction= 0
tempfamnt = 0
Include "getfighters2.bmx"

'you probably didnt see it but this var right below tells menufunctons where to go next
menuselect = selection+1
EndIf
' if user hits ESC then we'll exit the game
'If KeyHit(1) Then End
'this offsets the highlight image to line up to the menu option you have selected.
Select selection

Case 0
offsety = 0

Case 1
offsety = 60

Case 2
offsety = 120

Case 3
offsety = 180

End Select
End Rem
End Function