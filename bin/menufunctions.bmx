Function menufunctions(menuselect)

Select menuselect
'menuselect controls what part of the program you are at when you are playing
Case 0

'this menu is for the opening menu for selecting what game type and options
'Include "menu1.bmx"

'Case 1
'this menu is where you select your fighter
'Include "menu2.bmx"

'Case 2
'Include "menu3.bmx"

'Case 3
'Include "options.bmx"

'Case 4 
'End

'Case 10
'it may say selection screen but this is the background selection screen.. not the fighter
'selection screen
'Include "selectionscreen.bmx"
'here is where the fight actually happens
'Case 20
'Include "fightingarcade.bmx"

'Case 21
'Include "fightingnetwork.bmx"

'Case 30
'Include "gameend.bmx"

'Case 40
'Include "hostnetgame.bmx"

'Case 43
'Include "mainmmenu.bmx"

'Case 41
'Include "maincmenu.bmx"

'Case 42
'Include "joinnetgame2.bmx"

'Case 44
'Include "maincmenu.bb"

End Select


End Function

Function setitembg(mmhandle,mindex,bbgpath$)
For itm:menuitem = EachIn menuitem_list
If itm.mparent = mmhandle Then
If itm.index = mindex Then
itm.selbgimgpath$ = bbgpath$
If itm.selbgimgpath$ <> "" Then
itm.selbgimg = LoadImage(itm.selbgimgpath$,MASKEDIMAGE|FILTEREDIMAGE)
EndIf
EndIf
EndIf
Next


End Function

Function setitembgscale(mmhandle,mindex,onoff,scalee#)
For itm:menuitem = EachIn menuitem_list
If itm.mparent = mmhandle Then
If itm.index = mindex Then
itm.itembgscale = pnoff
itm.sscale# = scalee#

EndIf
EndIf
Next


End Function

Function setmenucols(mmhandle,tcols)
For men:menu = EachIn menu_list
If men.mhandle = mmhandle Then
men.col = tcols
EndIf
Next
End Function

Function deleteallmenus()
For men2:menu = EachIn menu_list
deletemenu(men2.mhandle)
Next
End Function



Function deletemenu(mmhandle)
For men:menu = EachIn menu_list
If men.mhandle = mmhandle Then
clearmenu(mmhandle)
If men.bgsndpath$ <> "" Then StopChannel men.bgchannel
For mfx:menufxa = EachIn menufx_list
If mfx.parent = men Then mfx.Remove()
Next
men.Remove()
EndIf
Next
End Function

Function clearmenu(mmhandle)
For itm:menuitem = EachIn menuitem_list
If itm.mparent = mmhandle Then
itm.Remove()
EndIf
Next
End Function

Function setmenuactive(mmhandle)
For men:menu = EachIn menu_list
If men.mhandle = mmhandle Then
men.bactive = True
EndIf
Next
End Function


Function allowp2menu(mmhandle)
For men:menu = EachIn menu_list
If men.mhandle = mmhandle Then
men.allowp2 = True
EndIf
Next
End Function

Function denyp1menu(mmhandle)
For men:menu = EachIn menu_list
If men.mhandle = mmhandle Then
men.denyp1 = True
EndIf
Next
End Function

Function setmenup2active(mmhandle)
For men:menu = EachIn menu_list
If men.mhandle = mmhandle Then
men.bp2active = True
men.bactivep2 = True
EndIf
Next
End Function


Function setmenup2unfocus(mmhandle)
For men:menu = EachIn menu_list
If men.mhandle = mmhandle Then

men.bactivep2 = False
EndIf
Next
End Function

Function setmenup2deactive(mmhandle)
For men:menu = EachIn menu_list
If men.mhandle = mmhandle Then
men.bp2active = False
EndIf
Next
End Function

Function setmenufx(mmhandle,mfxx$,xx,yy,ww,hh)
For men:menu = EachIn menu_list
If men.mhandle = mmhandle Then

mfx:menufxa = New menufxa
mfx.menufx$ = mfxx$

mfx.fxx = xx
mfx.fxy = yy
mfx.fxw = ww
mfx.fxh = hh
mfx.parent = men
EndIf
Next
End Function


Function setmenudeactive(mmhandle)
For men:menu = EachIn menu_list
If men.mhandle = mmhandle Then
men.bactive = False
EndIf
Next
End Function

Function createxmenu(x,y,w,h,bg$,sel$,selsnd$,bgsnd$,entsnd$)
men:menu = New menu
men.mhandle = Int(String(Rnd(1,999))+String(Rnd(1,999)))
men.x = x
men.y = y
men.w = w
men.h = h
men.entersndpath$ = entsnd$
If men.entersndpath$ <> "" Then men.entersnd = LoadSound(men.entersndpath$)
men.bgpath$ = bg$
If men.bgpath$ <> "" Then men.bg = LoadImage(men.bgpath$,MASKEDIMAGE|DYNAMICIMAGE|FILTEREDIMAGE)
men.selimgpath$ = sel$
If men.selimgpath$ <> "" Then men.selimg = LoadImage(men.selimgpath$,MASKEDIMAGE|DYNAMICIMAGE|FILTEREDIMAGE)
men.col = 1
men.listt = 0
men.selsndpath$ = selsnd$
If men.selsndpath$ <> "" Then men.selsnd = LoadSound(men.selsndpath$)
men.bgsndpath$ = bgsnd$
If men.bgsndpath$ <> "" Then 
men.bgsnd = LoadSound(men.bgsndpath$,True)
men.bgchannel = PlaySound(men.bgsnd)
EndIf
DebugLog "menu: "+men.mhandle
Return men.mhandle
End Function


Function updatemenuitemtext(mmhandle,index,stringy$)

For itm:menuitem = EachIn menuitem_list
If itm.mparent = mmhandle And itm.index = index Then
itm.ttext$ = stringy$
EndIf
Next


End Function


Function setmenufont(pphandle,fonttt)
For men:menu = EachIn menu_list
If men.mhandle = pphandle Then
men.menufont = fonttt
EndIf
Next

End Function

Function addmenuitem(txt$,bimage$,tfunc$,tindex,pphandle)
itm:menuitem = New menuitem
itm.ihandle = Int(String(Rnd(1,999))+String(Rnd(1,999)))
itm.ttext$ = txt$
itm.imagepath$ = bimage$
If itm.imagepath$ <> "" Then itm.image = LoadImage(itm.imagepath$,MASKEDIMAGE|DYNAMICIMAGE)
itm.index = tindex
itm.mparent = pphandle
itm.func$ = tfunc$
For men:menu = EachIn menu_list
If men.mhandle = pphandle Then
If itm.imagepath$ <> "" Then 
men.bim = ImageHeight(itm.image)
men.bim2 = ImageWidth(itm.image)
EndIf
DebugLog "menuitem: "+itm.ihandle+" parent: "+pphandle
men.maxind = tindex
EndIf
Next

Return itm.ihandle
End Function



Function createchatstring(ttext$)

Local totalchats
For chat:chatstring = EachIn chatstring_list
chat.chatid = chat.chatid + 1
If chat.chatid >= 15 Then chat.Remove()
Next

chat:chatstring = New chatstring
chat.message$ = ttext$
chat.chatid = 1



End Function


Function checkstartnetfight()
Local startitfight = True
objList = GNetObjects( HOSTX )
For remoteObj = EachIn objList
If GNetObjectRemote( remoteObj ) = True And GNetObjectState( remoteObj ) <> GNET_MESSAGE Then
crapo = GetGNetInt( remoteObj,NETFIGHTLOADED)
If crapo = 0 Then
startitfight = False

EndIf
EndIf

Next
Return startitfight

End Function




Function checkplayersready()
Local playerready = True
objList = GNetObjects( HOSTX )
For remoteObj = EachIn objList
If GNetObjectRemote( remoteObj ) = True And GNetObjectState( remoteObj ) <> GNET_MESSAGE Then
crapo = GetGNetInt( remoteObj,NETPREADY )
If crapo = 0 Then
playerready = False
createchatstring(GetGNetString$( remoteObj,NETNAME )+" is not Ready.")
createchatstring("")
EndIf
EndIf

Next
Return playerready

End Function

Function playercount()

PLAYERCOUNTER=1
objList = GNetObjects( HOSTX )
For remoteObj = EachIn objList
If GNetObjectRemote( remoteObj ) = True And GNetObjectState( remoteObj ) <> GNET_MESSAGE Then
PLAYERCOUNTER=PLAYERCOUNTER + 1
EndIf

Next
If PLAYERCOUNTER > 2 Then
GAMEENGINETYPE$="Brawl"
NETTEAM = Rnd(10,9999)
Else
GAMEENGINETYPE$="Arcade"
NETTEAM = HOSTJOIN

EndIf



End Function

Function retrievemessages()

objList = GNetObjects( HOSTX,GNET_CREATED )
For remoteObj = EachIn objList
createchatstring(GetGNetString$( remoteObj,NETNAME )+" Joined Room.")
createchatstring("")

Next


messList = GNetMessages( HOSTX )
For remotemessage = EachIn messList
DebugLog "found message from: "+GetGNetString$( remotemessage,1 )
createchatstring(GetGNetString$( remotemessage,1 )+" wrote:")
createchatstring(GetGNetString$( remotemessage,2 ))
	If GetGNetString$( remotemessage,3 ) <> "n" Then
	fartos$ = GetGNetString$( remotemessage,3 )
		If Instr(fartos,"fightersel@",1) <> 0 Then
		fartos$ = Replace(fartos$,"fightersel@","")
		havit = False
			For d:fighter = EachIn fighter_list
				If Lower(fartos$) = Lower(d.fname$) Then
				havit = True
				
				EndIf
			Next
			If havit = False Then
			sendnetmessage(NEUSER$+"DOES NOT HAVE "+fartos$+"!!!","","nohave@")
			createchatstring("YOU DO NOT HAVE "+fartos$+"!!!")
			createchatstring("")
			
			P2FSELREADY = False
			SetGNetInt( localObj,NETPREADY,False )
			Else
			P2FSELREADY = True
			SetGNetInt( localObj,NETPREADY,True )
			EndIf
			
			
			
		EndIf
		If Instr(fartos,"stagesel@",1) <> 0 Then
		fartos$ = Replace(fartos$,"stagesel@","")
		havit = False
			For b:bga = EachIn bga_list
				If Lower(b.bgname$) = Lower(fartos$) Then
				CURRENTSTAGE = b.bg
				STAGENAME$ = b.bgname$
				BGMUSIC = b.bgmusic
				havit = True
				EndIf
			Next
			If havit = False Then
			sendnetmessage(NEUSER$+"DOES NOT HAVE STAGE "+fartos$+"!!!","")
			P2FSELREADY = False
			SetGNetInt( localObj,NETPREADY,False )
			Else
			P2FSELREADY = True
			'sendnetmessage(NEUSER$+"HAS STAGE "+fartos$+"!!!","","yeshave@")
			SetGNetInt( localObj,NETPREADY,True )
			EndIf
		
		EndIf
		
		If Instr(fartos,"nohave@",1) <> 0 Then
		havit = False
		'P2FSELREADY = False
		EndIf
		
		If Instr(fartos,"startfight@",1) <> 0 Then
		'NETTEAM = Rnd(10,9999)
		DebugLog "Startnetfight!"
		deleteallmenus()
		loadnetfight()
		'P2FSELREADY = False
		EndIf
		
	EndIf
deletemenu(chatmesslist)
chatmesslist = createchatlistmenu()
Next

End Function

Function sendnetmessage(from$,ttext$,extraa$="n")
SetGNetString( messageObj,1,from$ )
SetGNetString( messageObj,2,ttext$ )
SetGNetString( messageObj,3,extraa$ )

objList = GNetObjects( HOSTX )
	For remoteObj = EachIn objList
	SendGNetMessage( messageObj,remoteObj)
	Next
SendGNetMessage( messageObj,localObj)
	
End Function

Function keyevents()

'playerone Key input
If checkkeytype(1,"sk") <> 0 Or KeyHit(KEY_ESCAPE) <> 0 Then
For men:menu = EachIn menu_list
If men.bactive = True And men.denyp1 = False Then
If men.entersndpath$ <> "" Then PlaySound men.entersnd
For itm:menuitem = EachIn menuitem_list
If itm.mparent = men.mhandle And itm.index = men.currentind Then
escfunct$ = itm.func$
EndIf
Next
EndIf
Next
EndIf

If checkkeytype(1,"wp") <> 0 Or KeyHit(KEY_ENTER) <> 0 Or checkkeytype(1,"start") <> 0 Then
For men:menu = EachIn menu_list
If men.bactive = True And men.denyp1 = False Then
If men.entersndpath$ <> "" Then PlaySound men.entersnd
For itm:menuitem = EachIn menuitem_list
If itm.mparent = men.mhandle And itm.index = men.currentind Then
menufunct$ = itm.func$
EndIf
Next
EndIf
Next
EndIf

If checkkeytype(1,"right") <> 0 Or KeyHit(KEY_RIGHT) <> 0 Then
DebugLog "menu right"
For men:menu = EachIn menu_list
If men.bactive = True And men.denyp1 = False Then
If men.selsndpath$ <> "" Then PlaySound men.selsnd

men.currentind = men.currentind + 1
If men.currentind > men.maxind Then men.currentind = 0
EndIf
Next
EndIf

If checkkeytype(1,"left") <> 0 Or KeyHit(KEY_LEFT) <> 0 Then
DebugLog "menu left"
For men:menu = EachIn menu_list
If men.bactive = True And men.denyp1 = False Then
If men.selsndpath$ <> "" Then PlaySound men.selsnd
men.currentind = men.currentind - 1
If men.currentind < 0 Then men.currentind = men.maxind
EndIf
Next
EndIf

If checkkeytype(1,"up") <> 0 Or KeyHit(KEY_UP) <> 0 Then
DebugLog "menu up"
For men:menu = EachIn menu_list
If men.bactive = True And men.denyp1 = False Then
If men.selsndpath$ <> "" Then PlaySound men.selsnd
men.currentind = men.currentind - men.col
If men.currentind < 0 Then men.currentind = men.maxind
EndIf
Next
EndIf

If checkkeytype(1,"down") <> 0 Or KeyHit(KEY_DOWN) <> 0 Then
DebugLog "menu down"
For men:menu = EachIn menu_list
If men.bactive = True And men.denyp1 = False Then
If men.selsndpath$ <> "" Then PlaySound men.selsnd

men.currentind = men.currentind + men.col
If men.currentind > men.maxind Then men.currentind = 0
EndIf
Next
EndIf





'player 2 start
If checkkeytype(2,"sk") <> 0 Then
For men:menu = EachIn menu_list
If men.bactivep2 = True And men.bp2active = True Then
If men.entersndpath$ <> "" Then PlaySound men.entersnd
For itm:menuitem = EachIn menuitem_list
If itm.mparent = men.mhandle And itm.index = men.currentind2 Then
escfunct$ = itm.func$
EndIf
Next
EndIf
Next
EndIf

If checkkeytype(2,"wp") <> 0 Or checkkeytype(2,"start") <> 0 Then
For men:menu = EachIn menu_list
If men.bactivep2 = True And men.bp2active = True Then
If men.entersndpath$ <> "" Then PlaySound men.entersnd
For itm:menuitem = EachIn menuitem_list
If itm.mparent = men.mhandle And itm.index = men.currentind2 Then
p2_menufunct$ = itm.func$
EndIf
Next

Else
If men.allowp2 = True And men.bactive = True Then 
men.bp2active = True
men.bactivep2 = True
P2TYPE$ = "HUMAN"
P2FSELREADY = False
EndIf
EndIf

Next
EndIf

If checkkeytype(2,"right") <> 0 Then
DebugLog "menu right"
For men:menu = EachIn menu_list
If men.bactivep2 = True And men.bp2active = True Then
If men.selsndpath$ <> "" Then PlaySound men.selsnd

men.currentind2 = men.currentind2 + 1
If men.currentind2 > men.maxind Then men.currentind2 = 0
EndIf
Next
EndIf

If checkkeytype(2,"left") <> 0 Then
DebugLog "menu left"
For men:menu = EachIn menu_list
If men.bactivep2 = True And men.bp2active = True Then
If men.selsndpath$ <> "" Then PlaySound men.selsnd
men.currentind2 = men.currentind2 - 1
If men.currentind2 < 0 Then men.currentind2 = men.maxind
EndIf
Next
EndIf

If checkkeytype(2,"up") <> 0 Then
DebugLog "menu up"
For men:menu = EachIn menu_list
If men.bactivep2 = True And men.bp2active = True Then
If men.selsndpath$ <> "" Then PlaySound men.selsnd
men.currentind2 = men.currentind2 - men.col
If men.currentind2 < 0 Then men.currentind2 = men.maxind
EndIf
Next
EndIf

If checkkeytype(2,"down") <> 0 Then
DebugLog "menu down"
For men:menu = EachIn menu_list
If men.bactivep2 = True And men.bp2active = True Then
If men.selsndpath$ <> "" Then PlaySound men.selsnd

men.currentind2 = men.currentind2 + men.col
If men.currentind2 > men.maxind Then men.currentind2 = 0
EndIf
Next
EndIf




End Function


Function checkkeytype(player,key$)

Select player


Case 1
If P1INPUTDEV = 0 Then
Select key$

Case "up"
Return KeyHit(P1KEYUP) 

Case "down"
Return KeyHit(P1KEYDN) 

Case "left"
Return KeyHit(P1KEYLF) 

Case "right"
Return KeyHit(P1KEYRT) 

Case "wp"
Return KeyHit(P1KEYWP) 

Case "sp"
Return KeyHit(P1KEYSP) 

Case "wk"
Return KeyHit(P1KEYWK) 

Case "sk"
Return KeyHit(P1KEYSK) 

Case "start"
Return KeyHit(P1KEYST)

End Select
Else If P1INPUTDEV > 0
'DebugLog "X: "+JoyX(P1INPUTDEV)+" Y:"+JoyY(P1INPUTDEV)
Select key$



Case "up"
If JoyY(P1INPUTDEV) = -1.0 Then
If P1UPHELD = False 
P1UPHELD = True
Return True 
EndIf
Else
P1UPHELD = False
EndIf

Case "down"
If JoyY(P1INPUTDEV) = 1.0 Then
If P1DNHELD = False
P1DNHELD = True
Return True
EndIf
Else
P1DNHELD = False
EndIf

Case "left"
If JoyX(P1INPUTDEV) = -1.0 Then
If P1LFHELD = False
P1LFHELD = True
Return True
EndIf
Else
P1LFHELD = False
EndIf

Case "right"
If JoyX(P1INPUTDEV) = 1.0 Then
If P1RTHELD = False
P1RTHELD = True
Return True
EndIf
Else
P1RTHELD = False
EndIf

Case "wp"
Return JoyHit(P1KEYWP,P1INPUTDEV) 

Case "sp"
Return JoyHit(P1KEYSP,P1INPUTDEV) 

Case "wk"
Return JoyHit(P1KEYWK,P1INPUTDEV) 

Case "sk"
Return JoyHit(P1KEYSK,P1INPUTDEV) 

Case "start"
Return JoyHit(P1KEYST,P1INPUTDEV)
End Select

EndIf

Case 2
If P2INPUTDEV = 0 Then
Select key$

Case "up"
Return KeyHit(P2KEYUP) 

Case "down"
Return KeyHit(P2KEYDN) 

Case "left"
Return KeyHit(P2KEYLF) 

Case "right"
Return KeyHit(P2KEYRT) 

Case "wp"
Return KeyHit(P2KEYWP) 

Case "sp"
Return KeyHit(P2KEYSP) 

Case "wk"
Return KeyHit(P2KEYWK) 

Case "sk"
Return KeyHit(P2KEYSK) 

Case "start"
Return KeyHit(P2KEYST)

End Select
Else If P2INPUTDEV > 0
Select key$



Case "up"
If JoyY(P2INPUTDEV) = -1.0 Then
If P2UPHELD = False
P2UPHELD = True
Return True 
EndIf
Else
P2UPHELD = False
EndIf

Case "down"
If JoyY(P2INPUTDEV) = 1.0 Then
If P2DNHELD = False 
P2DNHELD = True
Return True
EndIf
Else
P2DNHELD = False
EndIf

Case "left"
If JoyX(P2INPUTDEV) = -1.0 Then
If P2LFHELD = False 
P2LFHELD = True
Return True
EndIf
Else
P2LFHELD = False
EndIf

Case "right"
If JoyX(P2INPUTDEV) = 1.0 Then
If P2RTHELD = False 
P2RTHELD = True
Return True
EndIf
Else
P2RTHELD = False
EndIf

Case "wp"
Return JoyHit(P2KEYWP,P2INPUTDEV) 

Case "sp"
Return JoyHit(P2KEYSP,P2INPUTDEV) 

Case "wk"
Return JoyHit(P2KEYWK,P2INPUTDEV) 

Case "sk"
Return JoyHit(P2KEYSK,P2INPUTDEV) 

Case "start"
Return JoyHit(P2KEYST,P2INPUTDEV)

End Select

EndIf


End Select

End Function

Function guievents()

PollEvent
Select EventID()

Case EVENT_KEYDOWN
Select EventData()

Case KEY_ESCAPE
For men:menu = EachIn menu_list
If men.bactive = True Then
If men.entersndpath$ <> "" Then PlaySound men.entersnd
For itm:menuitem = EachIn menuitem_list
If itm.mparent = men.mhandle And itm.index = men.currentind Then
escfunct$ = itm.func$
EndIf
Next
EndIf
Next


Case KEY_ENTER
For men:menu = EachIn menu_list
If men.bactive = True Then
If men.entersndpath$ <> "" Then PlaySound men.entersnd
For itm:menuitem = EachIn menuitem_list
If itm.mparent = men.mhandle And itm.index = men.currentind Then
menufunct$ = itm.func$
EndIf
Next
EndIf
Next

Case KEY_RIGHT
DebugLog "menu right"
For men:menu = EachIn menu_list
If men.bactive = True Then
If men.selsndpath$ <> "" Then PlaySound men.selsnd

men.currentind = men.currentind + 1
If men.currentind > men.maxind Then men.currentind = 0
EndIf
Next

Case KEY_LEFT
DebugLog "menu left"
For men:menu = EachIn menu_list
If men.bactive = True Then
If men.selsndpath$ <> "" Then PlaySound men.selsnd
men.currentind = men.currentind - 1
If men.currentind < 0 Then men.currentind = men.maxind
EndIf
Next


Case KEY_UP
DebugLog "menu up"
For men:menu = EachIn menu_list
If men.bactive = True Then
If men.selsndpath$ <> "" Then PlaySound men.selsnd
men.currentind = men.currentind - men.col
If men.currentind < 0 Then men.currentind = men.maxind
EndIf
Next

Case KEY_DOWN
DebugLog "menu down"
For men:menu = EachIn menu_list
If men.bactive = True Then
If men.selsndpath$ <> "" Then PlaySound men.selsnd

men.currentind = men.currentind + men.col
If men.currentind > men.maxind Then men.currentind = 0
EndIf
Next

End Select

End Select

End Function

Function getkeycharmenu()
shit2 = GetChar()
If shit2 >= 32 And shit2 <= 125 Then


Select GETKEYCHAR$


Case "chatsay"
If getselectedmenuitem(chatmenu) = 0 And TextWidth(CHATSAYTEXT$) < 340 Then

CHATSAYTEXT$ = CHATSAYTEXT$ + Chr(shit2)
updatemenuitemtext(chatsayer,0,"> "+CHATSAYTEXT$)
EndIf

Case "multihuser"
If getselectedmenuitem(mhostmenu) = 0 Then
NETUSER$ = NETUSER$ + Chr(shit2)
updatemenuitemtext(mhostmenu,0,"Username: "+NETUSER$)
EndIf

Case "multihpass"
If getselectedmenuitem(mhostmenu) = 1 Then
NETPASS$ = NETPASS$ + Chr(shit2)
NETENCTPASS$ = ""
For poopoo = 0 To Len(NETPASS$)
If poopoo <> 0 Then
NETENCTPASS$ = NETENCTPASS$ + "*"

EndIf
Next
updatemenuitemtext(mhostmenu,1,"Password: "+NETENCTPASS$)
EndIf

Case "multihip"
If getselectedmenuitem(mhostmenu) = 2 Then
NETHOSTIP$ = NETHOSTIP$ + Chr(shit2)
updatemenuitemtext(mhostmenu,2,"IP/HostN: "+NETHOSTIP$)
EndIf

End Select

EndIf

If KeyHit(KEY_BACKSPACE) Then

Select GETKEYCHAR$

Case "chatsay"
If getselectedmenuitem(chatmenu) = 0 Then
strnum = 0
strnum = Len (CHATSAYTEXT$)
strnum = strnum - 1
CHATSAYTEXT$ = Mid (CHATSAYTEXT$, 1, strnum)

updatemenuitemtext(chatsayer,0,"> "+CHATSAYTEXT$)
EndIf

Case "multihuser"
If getselectedmenuitem(mhostmenu) = 0 Then
strnum = 0
strnum = Len (NETUSER$)
strnum = strnum - 1
NETUSER$ = Mid (NETUSER$, 1, strnum)
updatemenuitemtext(mhostmenu,0,"Username: "+NETUSER$)
EndIf

Case "multihpass"
If getselectedmenuitem(mhostmenu) = 1 Then
strnum = 0
strnum = Len (NETPASS$)
strnum = strnum - 1
NETPASS$ = Mid (NETPASS$, 1, strnum)
NETENCTPASS$ = ""
For poopoo = 0 To Len(NETPASS$)
If poopoo <> 0 Then
NETENCTPASS$ = NETENCTPASS$ + "*"

EndIf
Next
updatemenuitemtext(mhostmenu,1,"Password: "+NETENCTPASS$)

EndIf

Case "multihip"
If getselectedmenuitem(mhostmenu) = 2 Then
strnum = 0
strnum = Len (NETHOSTIP$)
strnum = strnum - 1
NETHOSTIP$ = Mid (NETHOSTIP$, 1, strnum)
updatemenuitemtext(mhostmenu,2,"IP/HostN: "+NETHOSTIP$)
EndIf

End Select

EndIf

End Function


Function menuevents$()

	Select p2_menufunct$
	
		Case "typesel"
			P2ETYPE = getselectedmenuitemp2(p2typesel)
			P2FSELREADY = True
			If P1FSELREADY = True And P2FSELREADY = True Then
			deletemenu(fighterselmenu)
			deletemenu(p1typesel)
			deletemenu(p2typesel)
			stageselmenu = createstageselectionscreen()
			stageseltext = createstageseltext()
			setmenufx(stageselmenu,"Lightning",0,20,640,20)
			EndIf
		
		Case "fightersel"
			selfight = getselectedmenuitemp2(fighterselmenu)
			For d:fighter = EachIn fighter_list
			If d.fighternum = selfight+1 Then
			P2FNAME$ = d.fname$
			EndIf
			Next
			
			p2typesel = createplayer2type()
			allowp2menu(p2typesel)
			setmenup2active(p2typesel)
			denyp1menu(p2typesel)
			setmenup2unfocus(fighterselmenu)
	
	End Select
	p2_menufunct$ = ""


	Select escfunct$
	
		Case "stagesel"
			deletemenu(stageselmenu)
			deletemenu(stageseltext)
			fighterselmenu = createselectionscreen()
			allowp2menu(fighterselmenu)
			setmenufx(fighterselmenu,"Lightning",20,0,20,480)
			setmenufx(fighterselmenu,"Lightning",610,0,610,480)
			
			setmenufx(fighterselmenu,"Lightning",120,0,120,480)
			setmenufx(fighterselmenu,"Lightning",510,0,510,480)
		
		Case "fightersel"
		
			deletemenu(fighterselmenu)
			mainmmenu = createmainmenu()
		
		Case "typesel"
			deletemenu(p1typesel)
			setmenuactive(fighterselmenu)
	
	End Select
	escfunct$ = ""
'Return escfunct$

	Select menufunct$
	
		Case "online"
			deletemenu(mainmmenu)
			multiplaymenu = createmultiplaymenu()
		
		Case "multireturn"
			deletemenu(multiplaymenu)
			mainmmenu = createmainmenu()
		
		Case "multihreturn"
			deletemenu(mhostmenu)
			multiplaymenu = createmultiplaymenu()
		
		Case "multihchat"
			deletemenu(hostmainmenu)
			chatmenu = createhostchatmenu()
			chatsayer = createchatsaymenu()
			chatmesslist = createchatlistmenu()
		
		Case "multicchat"
			deletemenu(hostmainmenu)
			chatmenu = createclientchatmenu()
			chatsayer = createchatsaymenu()
			chatmesslist = createchatlistmenu()
		
		Case "multicback"
			deletemenu(chatmenu)
			hostmainmenu = createclientmainmenu()
		
		Case "multihback"
			deletemenu(chatmenu)
			hostmainmenu = createhostmainmenu()
		
		
		Case "multihstartfight"
			If checkplayersready() = True Then
				sendnetmessage(NETUSER$,"FIGHT HAS STARTED!","startfight@")
				GNetSync HOSTX
				deleteallmenus()
				loadnetfight()
			Else
				deletemenu(hostmainmenu)
				chatmenu = createhostchatmenu()
				chatsayer = createchatsaymenu()
				chatmesslist = createchatlistmenu()
			
			EndIf
		
		Case "multihchatting"
			If CHATSAYTEXT$ = "" Then
				GETKEYCHAR$ = "chatsay"
			Else
				GETKEYCHAR$ = "chatsay"
				createchatstring(NETUSER$+"("+P1FNAME$+") wrote:")
				createchatstring(CHATSAYTEXT$)
				deletemenu(chatmesslist)
				chatmesslist = createchatlistmenu()
				sendnetmessage(NETUSER$+"("+P1FNAME$+")",CHATSAYTEXT$)
				CHATSAYTEXT$ = ""
				updatemenuitemtext(chatsayer,0,"> "+CHATSAYTEXT$)
			EndIf
		
		Case "multihost"
			deletemenu(multiplaymenu)
			mhostmenu = createhoststartmenu()
		
		Case "multijoin"
			deletemenu(multiplaymenu)
			mhostmenu = createclientstartmenu()
		
		Case "multihuser"
			GETKEYCHAR$ = "multihuser"
		
		Case "multihpass"
			GETKEYCHAR$ = "multihpass"
		
		Case "multihip"
			GETKEYCHAR$ = "multihip"
		
		
		Case "multihconnectc"
			If HOSTX = Null Then Notify "No Host object."
			
			SetGNetString( localObj,NETNAME,NETUSER$ )
			SetGNetInt( localObj,NETPREADY,0 )
				
			GNETSUCCESS = GNetConnect( HOSTX,NETHOSTIP$,PORTX, 10000 )
			NETTEAM = 2
			HOSTJOIN = 2
			NETWID$ = NETUSER$+Rnd(1,9999)
			SetGNetString( localObj,NETID,NETWID$ )
			
			DebugLog "connecting to "+NETHOSTIP$+" Port:"+PORTX
			If Not GNETSUCCESS Then 
				deletemenu(mhostmenu)
				multiplaymenu = createmultiplaymenu()
				Notify "Could not join Game"
			Else
			
				messageObj:TGNetObject = CreateGNetMessage:TGNetObject( HOSTX )
				deletemenu(mhostmenu)
				hostmainmenu = createclientmainmenu()
			EndIf
		
		Case "multihconnect"
			SetGNetString( localObj,NETNAME,NETUSER$ )
			SetGNetInt( localObj,NETPREADY,0 )
			GNETSUCCESS = GNetListen( HOSTX,PORTX )
			NETTEAM = 1
			HOSTJOIN = 1
			NETWID$ = NETUSER$+Rnd(1,9999)
			SetGNetString( localObj,NETID,NETWID$ )
		
			If HOSTX = Null Then Notify "No Host object."
			If Not GNETSUCCESS Then 
				deletemenu(mhostmenu)
				multiplaymenu = createmultiplaymenu()
				Notify "Could not host Game"
			Else
				deletemenu(mhostmenu)
				hostmainmenu = createhostmainmenu()
				'localObj:TGNetObject = CreateGNetObject:TGNetObject( HOSTX )
				messageObj:TGNetObject = CreateGNetMessage:TGNetObject( HOSTX )
			EndIf
			
		Case "multihfighter"
			deletemenu(hostmainmenu)
			hostfighterselmenu = createhostselectionscreen()
			setmenufx(hostfighterselmenu,"Lightning",20,0,20,480)
			setmenufx(hostfighterselmenu,"Lightning",610,0,610,480)
			
			setmenufx(hostfighterselmenu,"Lightning",120,0,120,480)
			setmenufx(hostfighterselmenu,"Lightning",510,0,510,480)
		
		Case "multicfighter"
			deletemenu(hostmainmenu)
			hostfighterselmenu = createclientselectionscreen()
			setmenufx(hostfighterselmenu,"Lightning",20,0,20,480)
			setmenufx(hostfighterselmenu,"Lightning",610,0,610,480)
			
			setmenufx(hostfighterselmenu,"Lightning",120,0,120,480)
			setmenufx(hostfighterselmenu,"Lightning",510,0,510,480)
		
		
		Case "multihexit"
			deletemenu(hostmainmenu)
			multiplaymenu = createmultiplaymenu()
		
		Case "stageselhost"
		
			selfight = getselectedmenuitem(stageselmenuhost)
			For b:bga = EachIn bga_list
				If b.bgnum = selfight Then
					CURRENTSTAGE = b.bg
					STAGENAME$ = b.bgname$
					BGMUSIC = b.bgmusic
					sendnetmessage(NETUSER$+" Selected stage:",STAGENAME$,"stagesel@"+STAGENAME$)
				EndIf
			Next
			deletemenu(stageselmenuhost)
			deletemenu(stageseltext)
			hostmainmenu = createhostmainmenu()
		
		Case "stagesel"
			selfight = getselectedmenuitem(stageselmenu)
			For b:bga = EachIn bga_list
				If b.bgnum = selfight Then
					If b.bg = Null Then b.bg = LoadImage(b.sbgpath$)
					CURRENTSTAGE = b.bg
					If b.bgmusic = Null Then 
						DebugLog "Loading sound: "+b.bgmusicpath$
						b.bgmusic = LoadSound(b.bgmusicpath$,True)
					EndIf
					BGMUSIC = b.bgmusic
				EndIf
			Next
			deletemenu(stageselmenu)
			deletemenu(stageseltext)
			p:player = New player
			p.playernum = 1
			p.team = 1
			p.playertype$ = P1TYPE$
			p.fid$ = P1TYPE$+Rnd(1,1000)
			p.etype = P1ETYPE
			p.char:fight = New fight
			p.char.fighternum = 1
			p.char.fname$ = P1FNAME$
			p.char.fid$ = p.fid$
			p:player = New player
			p.playernum = 2
			p.team = 2
			p.playertype$ = P2TYPE$
			p.fid$ = P2TYPE$+Rnd(1,1000)
			p.etype = P2ETYPE
			p.char:fight = New fight
			p.char.fighternum = 2
			p.char.fname$ = P2FNAME$
			p.char.fid$ = p.fid$
			loadfight()
			ENGINESTATUS$ = "INIT"
		
		Case "hosttypesel"
			P1ETYPE = getselectedmenuitem(p1hosttypesel)
			P1FSELREADY = True
			'If P1FSELREADY = True And P2FSELREADY = True Then
			deletemenu(hostfighterselmenu)
			deletemenu(p1hosttypesel)
			hostmainmenu = createhostmainmenu()
			SetGNetInt( localObj,NETPREADY,1 )
		
		Case "clienttypesel"
			P1ETYPE = getselectedmenuitem(p1hosttypesel)
			P1FSELREADY = True
			'If P1FSELREADY = True And P2FSELREADY = True Then
			deletemenu(hostfighterselmenu)
			deletemenu(p1hosttypesel)
			hostmainmenu = createclientmainmenu()
			SetGNetInt( localObj,NETPREADY,1 )
		
		Case "multihstage"
			deletemenu(hostmainmenu)
			stageselmenuhost = createstageselectionscreenhost()
			stageseltext = createstageseltext()
			setmenufx(stageselmenuhost,"Lightning",0,20,640,20)
		
		Case "typesel"
			P1ETYPE = getselectedmenuitem(p1typesel)
			P1FSELREADY = True
			If P1FSELREADY = True And P2FSELREADY = True Then
			deletemenu(fighterselmenu)
			deletemenu(p1typesel)
			deletemenu(p2typesel)
			stageselmenu = createstageselectionscreen()
			stageseltext = createstageseltext()
			setmenufx(stageselmenu,"Lightning",0,20,640,20)
			DebugLog "p1 "+P1FNAME$+" p2"+P2FNAME$
			EndIf
		
		Case "arcade"
			deletemenu(mainmmenu)
			
			fighterselmenu = createselectionscreen()
			allowp2menu(fighterselmenu)
			setmenufx(fighterselmenu,"Lightning",20,0,20,480)
			setmenufx(fighterselmenu,"Lightning",610,0,610,480)
			
			setmenufx(fighterselmenu,"Lightning",120,0,120,480)
			setmenufx(fighterselmenu,"Lightning",510,0,510,480)
		
		Case "options"
			deletemenu(mainmmenu)
			optionsmenu = createoptionsmenu()
		
		Case "gcontrols"
			deletemenu(optionsmenu)
			controlsmenu = createcontrolsmenu()
		
		
		Case "gconfig"
			deletemenu(optionsmenu)
			configmenu = creategconfigmenu()
		
		Case "gsettimer"
			timermenu = createtimermenu()
			setmenudeactive(configmenu)
		
		Case "gsetrounds"
			roundsmenu = createroundsmenu()
			setmenudeactive(configmenu)
		
		Case "gsetdiff"
			diffimenu = createdifficultmenu()
			setmenudeactive(configmenu)
		
		Case "gsetdisplay"
			displaymenu = createdisplaymenu()
			setmenudeactive(configmenu)
		
		
		Case "gkeyreturn"
			deletemenu(controlsmenu)
			optionsmenu = createoptionsmenu()
		
		Case "gsetdevice"
			pselectconfmenu = Selectconfigplayermenu()
			setmenudeactive(controlsmenu)
		
		
		Case "gplayerb"
			Select getselectedmenuitem(pselectconfmenub)
			
				Case 0
					MAINEDITPLAYER = 1
				Case 1
					MAINEDITPLAYER = 2
			End Select
			
			deletemenu(pselectconfmenub)
			keyconfigmenu = createkeyconfigMenu()
		
		
		Case "gsetkeys"
			pselectconfmenub = Selectconfigplayermenub()
			setmenudeactive(controlsmenu)
		
		Case "gsetkkeyreturn"
			deletemenu(keyconfigmenu)
			setmenuactive(controlsmenu)
		
		Case "seldevice"
		Select getselectedmenuitem(devicelistmenu)
		
			Case 0
				Select MAINEDITPLAYER
				
					Case 1
						P1INPUTDEV = 0
					Case 2
						P2INPUTDEV = 0
			
			
			
				End Select
		
			Default
		   
				Select MAINEDITPLAYER
				
					Case 1
						P1INPUTDEV = getselectedmenuitem(devicelistmenu)
						If P1INPUTDEV > 0 Then
						P1DEVICE$="Joy:"
						P1KEYUP = 0
						P1KEYDN = 0
						P1KEYLF = 0
						P1KEYRT = 0
						P1KEYWP = 0
						P1KEYSP = 0
						P1KEYWK = 0
						P1KEYSK = 0
						P1KEYST = 0
						EndIf
					
					Case 2
						P2INPUTDEV = getselectedmenuitem(devicelistmenu)
						If P2INPUTDEV > 0 Then
						P2DEVICE$="Joy:"
						P2KEYUP = 0
						P2KEYDN = 0
						P2KEYLF = 0
						P2KEYRT = 0
						P2KEYWP = 0
						P2KEYSP = 0
						P2KEYWK = 0
						P2KEYSK = 0
						P2KEYST = 0
						EndIf
				End Select
		End Select
		deletemenu(devicelistmenu)
		setmenuactive(controlsmenu)
		
		Case "gsetkkey"
		Cls
		DrawText "Press Key",0,0
		Flip
		Select getselectedmenuitem(keyconfigmenu)
		
		Case 0
			Select MAINEDITPLAYER
		
			Case 1
				Select P1INPUTDEV
				
				Case 0
					P1KEYUP = WaitKey()
					updatemenuitemtext(keyconfigmenu,0,"UP KEY: "+P1KEYUP)
				
				'Default
				'P1KEYUP = waitjoyaxis(P1INPUTDEV)
				
				End Select
			
			Case 2
				Select P2INPUTDEV
				
				Case 0
					P2KEYUP = WaitKey()
					updatemenuitemtext(keyconfigmenu,0,"UP KEY: "+P2KEYUP)
				
				
				'Default
				'P2KEYUP = waitjoyaxis(P2INPUTDEV)
				
				End Select
			
			End Select
		
		Case 1
			Select MAINEDITPLAYER
		
			Case 1
				Select P1INPUTDEV
				
				Case 0
					P1KEYDN = WaitKey()
					updatemenuitemtext(keyconfigmenu,1,"DOWN KEY: "+P1KEYDN)
				
				'Default
				'P1KEYDN = waitjoyaxis(P1INPUTDEV)
				
				End Select
			
			Case 2
				Select P2INPUTDEV
				
				Case 0
					P2KEYDN = WaitKey()
					updatemenuitemtext(keyconfigmenu,1,"DOWN KEY: "+P2KEYDN)
				
				
				'Default
				'P2KEYDN = waitjoyaxis(P2INPUTDEV)
				
				End Select
			
			End Select
		
		Case 2
			Select MAINEDITPLAYER
		
			Case 1
				Select P1INPUTDEV
				
				Case 0
					P1KEYLF = WaitKey()
						updatemenuitemtext(keyconfigmenu,2,"LEFT KEY: "+P1KEYLF)
		
				
				'Default
				'P1KEYLF = waitjoyaxis(P1INPUTDEV)
				
				End Select
			
			Case 2
				Select P2INPUTDEV
				
				Case 0
					P2KEYLF = WaitKey()
						updatemenuitemtext(keyconfigmenu,2,"LEFT KEY: "+P2KEYDN)
		
				
				'Default
				'P2KEYLF = waitjoyaxis(P2INPUTDEV)
				
				End Select
			
			End Select
		
		Case 3
			Select MAINEDITPLAYER
		
			Case 1
				Select P1INPUTDEV
				
				Case 0
					P1KEYRT = WaitKey()
						updatemenuitemtext(keyconfigmenu,3,"RIGHT KEY: "+P1KEYRT)
		
				
				'Default
				'P1KEYRT = waitjoyaxis(P1INPUTDEV)
				
				End Select
			
			Case 2
				Select P2INPUTDEV
				
				Case 0
					P2KEYRT = WaitKey()
						updatemenuitemtext(keyconfigmenu,3,"RIGHT KEY: "+P2KEYRT)
		
				
				'Default
				'P2KEYRT = waitjoyaxis(P2INPUTDEV)
				
				End Select
			
			End Select
		
		Case 4
			Select MAINEDITPLAYER
		
			Case 1
				Select P1INPUTDEV
				
				Case 0
					P1KEYWP = WaitKey()
						updatemenuitemtext(keyconfigmenu,4,"WPUNCH KEY: "+P1KEYWP)
		
				
				Default
					P1KEYWP = waitjoycaps(P1INPUTDEV)
						updatemenuitemtext(keyconfigmenu,4,"WPUNCH JOY: "+P1KEYWP)
		
				End Select
			
			Case 2
				Select P2INPUTDEV
				
				Case 0
					P2KEYWP = WaitKey()
						updatemenuitemtext(keyconfigmenu,4,"WPUNCH KEY: "+P2KEYWP)
		
				
				Default
					P2KEYWP = waitjoycaps(P2INPUTDEV)
						updatemenuitemtext(keyconfigmenu,4,"WPUNCH JOY: "+P2KEYWP)
		
				End Select
			
			End Select
		
		Case 5
			Select MAINEDITPLAYER
		
			Case 1
				Select P1INPUTDEV
				
				Case 0
					P1KEYSP = WaitKey()
						updatemenuitemtext(keyconfigmenu,5,"SPUNCH KEY: "+P1KEYSP)
		
				
				Default
					P1KEYSP = waitjoycaps(P1INPUTDEV)
						updatemenuitemtext(keyconfigmenu,5,"SPUNCH JOY: "+P1KEYSP)
		
				End Select
			
			Case 2
				Select P2INPUTDEV
				
				Case 0
					P2KEYSP = WaitKey()
						updatemenuitemtext(keyconfigmenu,5,"SPUNCH KEY: "+P2KEYSP)
		
				
				Default
					P2KEYSP = waitjoycaps(P2INPUTDEV)
						updatemenuitemtext(keyconfigmenu,5,"SPUNCH JOY: "+P2KEYSP)
		
				End Select
			
			End Select
		
		Case 6
			Select MAINEDITPLAYER
		
			Case 1
				Select P1INPUTDEV
				
				Case 0
					P1KEYWK = WaitKey()
						updatemenuitemtext(keyconfigmenu,6,"WKICK KEY: "+P1KEYWK)
		
				
				Default
					P1KEYWK = waitjoycaps(P1INPUTDEV)
						updatemenuitemtext(keyconfigmenu,6,"WKICK JOY: "+P1KEYWK)
		
				End Select
			
			Case 2
				Select P2INPUTDEV
				
				Case 0
					P2KEYWK = WaitKey()
						updatemenuitemtext(keyconfigmenu,6,"WKICK KEY: "+P2KEYWK)
		
				
				Default
					P2KEYWK = waitjoycaps(P2INPUTDEV)
						updatemenuitemtext(keyconfigmenu,6,"WKICK JOY: "+P2KEYWK)
		
				End Select
			
			End Select
		
		Case 7
			Select MAINEDITPLAYER
		
			Case 1
				Select P1INPUTDEV
				
				Case 0
					P1KEYSK = WaitKey()
						updatemenuitemtext(keyconfigmenu,7,"SKICK KEY: "+P1KEYSK)
		
				
				Default
					P1KEYSK = waitjoycaps(P1INPUTDEV)
						updatemenuitemtext(keyconfigmenu,7,"SKICK JOY: "+P1KEYSK)
		
				End Select
			
			Case 2
				Select P2INPUTDEV
				
				Case 0
					P2KEYSK = WaitKey()
						updatemenuitemtext(keyconfigmenu,7,"SKICK KEY: "+P2KEYSK)
		
				
				Default
					P2KEYSK = waitjoycaps(P2INPUTDEV)
						updatemenuitemtext(keyconfigmenu,7,"SKICK JOY: "+P2KEYSK)
		
				End Select
		
			End Select
		Case 8
			Select MAINEDITPLAYER
		
			Case 1
				Select P1INPUTDEV
				
				Case 0
					P1KEYST = WaitKey()
						updatemenuitemtext(keyconfigmenu,8,"START KEY: "+P1KEYST)
		
				
				Default
					P1KEYST = waitjoycaps(P1INPUTDEV)
						updatemenuitemtext(keyconfigmenu,8,"START JOY: "+P1KEYST)
		
				End Select
			
			Case 2
				Select P2INPUTDEV
				
				Case 0
					P2KEYST = WaitKey()
						updatemenuitemtext(keyconfigmenu,8,"START KEY: "+P2KEYST)
		
				
				Default
					P2KEYST = waitjoycaps(P2INPUTDEV)
						updatemenuitemtext(keyconfigmenu,8,"START JOY: "+P2KEYST)
		
				End Select
			
			End Select			
			
		End Select
		
		Case "gplayer"
			Select getselectedmenuitem(pselectconfmenu)
			
				Case 0
				MAINEDITPLAYER = 1
				Case 1
				MAINEDITPLAYER = 2
			End Select
			
			deletemenu(pselectconfmenu)
			devicelistmenu = createdevicelistmenu()
		
		
		
		
		
		Case "ggdisplay"
			Select getselectedmenuitem(displaymenu)
			
				Case 0
					MAINGAMEDISPLAY$ = "Win"
					Graphics 640,480,0,60
					SetImageFont fntArialD
					SetScale(2,2)
					SetBlend(ALPHABLEND)
				Case 1
					MAINGAMEDISPLAY$ = "FS"
					Graphics 640,480,16,60
					SetImageFont fntArialD
					SetScale(2,2)
					SetBlend(ALPHABLEND)
			End Select
			updatemenuitemtext(configmenu,3,"Display "+MAINGAMEDISPLAY$)
			deletemenu(displaymenu)
			setmenuactive(configmenu)
		
		
		Case "ggdiffi"
			Select getselectedmenuitem(diffimenu)
			
				Case 0
					MAINGAMEDIFFICULTY$ = "Easy"
				
				
				Case 1
					MAINGAMEDIFFICULTY$ = "Medium"
				
				Case 2
					MAINGAMEDIFFICULTY$ = "Hard"
				
				Case 3
					MAINGAMEDIFFICULTY$ = "Elite"
			
			
			End Select
			updatemenuitemtext(configmenu,2,"Difficulty "+MAINGAMEDIFFICULTY$)
			deletemenu(diffimenu)
			setmenuactive(configmenu)
		
		Case "ggrounds"
			Select getselectedmenuitem(roundsmenu)
			
				Case 0
					MAINGAMEROUNDS = 2
				
				
				Case 1
					MAINGAMEROUNDS = 4
				
				Case 2
					MAINGAMEROUNDS = 6
				
				Case 3
					MAINGAMEROUNDS = 8
			
			
			End Select
			updatemenuitemtext(configmenu,1,"Rounds "+MAINGAMEROUNDS)
			deletemenu(roundsmenu)
			setmenuactive(configmenu)
		
		Case "ggtimer"
			Select getselectedmenuitem(timermenu)
			
				Case 0
					MAINGAMETIMER = 30
				
				
				Case 1
					MAINGAMETIMER = 60
				
				Case 2
					MAINGAMETIMER = 90
				
				Case 3
					MAINGAMETIMER = 00
			
			
			End Select
			updatemenuitemtext(configmenu,0,"Timer "+MAINGAMETIMER)
			deletemenu(timermenu)
			setmenuactive(configmenu)
		
		
		Case "greturn"
			deletemenu(optionsmenu)
			mainmmenu = createmainmenu()
		
		
		Case "gconfigreturn"
			deletemenu(configmenu)
			optionsmenu = createoptionsmenu()
		
		
		
		Case "exitgame"
			End
		
		Case "hostfightersel"
			selfight = getselectedmenuitem(hostfighterselmenu)
			For d:fighter = EachIn fighter_list
			If d.fighternum = selfight+1 Then
			P1FNAME$ = d.fname$
			SetGNetString( localObj,NETFNAME,d.fname$ )
			sendnetmessage(NETUSER$+" Selected Fighter:",P1FNAME$,"fighter@"+P1FNAME$)
			EndIf
			Next
			p1hosttypesel = createplayer1typehost()
			setmenudeactive(hostfighterselmenu)
		
		
		Case "clientfightersel"
			selfight = getselectedmenuitem(hostfighterselmenu)
			For d:fighter = EachIn fighter_list
			If d.fighternum = selfight+1 Then
			P1FNAME$ = d.fname$
			SetGNetString( localObj,NETFNAME,d.fname$ )
			sendnetmessage(NETUSER$+" Selected Fighter:",P1FNAME$,"fighter@"+P1FNAME$)
			EndIf
			Next
			p1hosttypesel = createplayer1typeclient()
			setmenudeactive(hostfighterselmenu)
		
		Case "fightersel"
			selfight = getselectedmenuitem(fighterselmenu)
			For d:fighter = EachIn fighter_list
			If d.fighternum = selfight+1 Then
			P1FNAME$ = d.fname$
			EndIf
			Next
			If P2TYPE$ = "COMP" Then
			poop = 0
			For d:fighter = EachIn fighter_list
			selfight = selfight + 1
			Next
			selfight2 = Rnd(1,selfight)
			For d:fighter = EachIn fighter_list
			If d.fighternum = selfight2 Then
			P2FNAME$ = d.fname$
			EndIf
			Next
			
			EndIf
			p1typesel = createplayer1type()
			setmenudeactive(fighterselmenu)
	
	
	
	End Select
	menufunct$ = ""
	Return menufunct$
End Function


Function createmainmenu()
poop = createxmenu(180,280,300,240,"logo.png","menu\bar.png","wav\menu.wav","music\menu.ogg","wav\select.wav")
addmenuitem("Arcade Mode","","arcade",0,poop)
addmenuitem("Online Mode","","online",1,poop)
addmenuitem("Options","","options",2,poop)
addmenuitem("Exit","","exitgame",3,poop)


setmenuactive(poop)
Return poop
End Function

Function createoptionsmenu()
poop = createxmenu(0,0,300,240,"menu\optscreen.png","menu\bar.png","wav\menu.wav","music\ryu.ogg","wav\select.wav")
addmenuitem("Game Config","","gconfig",0,poop)
addmenuitem("Controls","","gcontrols",1,poop)
addmenuitem("Network","","gnetconfig",2,poop)
addmenuitem("Credits","","gcredits",3,poop)
addmenuitem("Return","","greturn",4,poop)

setmenuactive(poop)
Return poop
End Function

Function createmultiplaymenu()
poop = createxmenu(0,0,300,240,"menu\optscreen.png","menu\bar.png","wav\menu.wav","music\ryu.ogg","wav\select.wav")
addmenuitem("Host Game","","multihost",0,poop)
addmenuitem("Join Game","","multijoin",1,poop)
addmenuitem("Return","","multireturn",2,poop)

setmenuactive(poop)
Return poop
End Function

Function createhoststartmenu()
poop = createxmenu(0,0,300,240,"menu\optscreen.png","menu\bar.png","wav\menu.wav","music\ryu.ogg","wav\select.wav")
addmenuitem("Username: "+NETUSER$,"","multihuser",0,poop)
addmenuitem("Password: "+NETENCTPASS$,"","multihpass",1,poop)
addmenuitem("Connect","","multihconnect",2,poop)
addmenuitem("Return","","multihreturn",3,poop)

setmenuactive(poop)
Return poop


End Function


Function createhostchatmenu()
poop = createxmenu(0,0,300,240,"menu\chatmenu.png","menu\bar2.png","wav\menu.wav","music\ryu.ogg","wav\select.wav")
addmenuitem("Chat","","multihchatting",0,poop)
addmenuitem("Back","","multihback",1,poop)


setmenuactive(poop)
Return poop

End Function

Function createclientchatmenu()
poop = createxmenu(0,0,300,240,"menu\chatmenu.png","menu\bar2.png","wav\menu.wav","music\ryu.ogg","wav\select.wav")
addmenuitem("Chat","","multihchatting",0,poop)
addmenuitem("Back","","multicback",1,poop)


setmenuactive(poop)
Return poop

End Function


Function createchatlistmenu()
poop = createxmenu(196,16,640,480,"menu\blank.png","menu\self3.png","wav\menu.wav","","wav\select.wav")
fart = 0
For chat:chatstring = EachIn chatstring_list
addmenuitem(chat.message$,"","",fart,poop)
fart = fart + 1
Next
setmenufont(poop,fntArialA)

'setmenuactive(poop)
Return poop
End Function

Function createchatsaymenu()
poop = createxmenu(196,436,300,240,"menu\blank.png","menu\self3.png","wav\menu.wav","","wav\select.wav")
addmenuitem("> "+CHATSAYTEXT$,"","chatsay",0,poop)
setmenufont(poop,fntArialA)

'setmenuactive(poop)
Return poop
End Function

Function createhostmainmenu()
poop = createxmenu(0,0,300,240,"menu\optscreen.png","menu\bar.png","wav\menu.wav","music\ryu.ogg","wav\select.wav")
addmenuitem("Fighter","","multihfighter",0,poop)
addmenuitem("Stage ","","multihstage",1,poop)
'addmenuitem("Settings","","multihsettings",2,poop)
addmenuitem("Start Fight","","multihstartfight",2,poop)

addmenuitem("Chat","","multihchat",3,poop)

addmenuitem("Exit","","multihexit",4,poop)

setmenuactive(poop)
Return poop


End Function


Function createclientmainmenu()
poop = createxmenu(0,0,300,240,"menu\optscreen.png","menu\bar.png","wav\menu.wav","music\ryu.ogg","wav\select.wav")
addmenuitem("Fighter","","multicfighter",0,poop)

addmenuitem("Chat","","multicchat",1,poop)

addmenuitem("Exit","","multicexit",2,poop)

setmenuactive(poop)
Return poop


End Function

Function createclientstartmenu()
poop = createxmenu(0,0,300,240,"menu\optscreen.png","menu\bar.png","wav\menu.wav","music\ryu.ogg","wav\select.wav")
addmenuitem("Username: "+NETUSER$,"","multihuser",0,poop)
addmenuitem("Password: "+NETENCTPASS$,"","multihpass",1,poop)
addmenuitem("IP/HostN: "+NETHOSTIP$,"","multihip",2,poop)
addmenuitem("Connect","","multihconnectc",3,poop)
addmenuitem("Return","","multihreturn",4,poop)

setmenuactive(poop)
Return poop


End Function

Function createcontrolsmenu()
poop = createxmenu(0,0,300,240,"menu\optscreen.png","menu\bar.png","wav\menu.wav","music\ryu.ogg","wav\select.wav")
addmenuitem("Set Devices","","gsetdevice",0,poop)
addmenuitem("Key Config","","gsetkeys",1,poop)
addmenuitem("Return","","gkeyreturn",2,poop)

setmenuactive(poop)
Return poop
End Function


Function creategconfigmenu()
poop = createxmenu(0,0,300,240,"menu\optscreen.png","menu\bar.png","wav\menu.wav","music\ryu.ogg","wav\select.wav")
addmenuitem("Timer "+MAINGAMETIMER,"","gsettimer",0,poop)
addmenuitem("Rounds "+MAINGAMEROUNDS,"","gsetrounds",1,poop)
addmenuitem("Difficulty "+MAINGAMEDIFFICULTY$,"","gsetdiff",2,poop)
addmenuitem("Display "+MAINGAMEDISPLAY$,"","gsetdisplay",3,poop)
addmenuitem("Return","","gconfigreturn",4,poop)

setmenuactive(poop)
Return poop
End Function


Function createtimermenu()
poop = createxmenu(280,0,300,240,"menu\blank.png","menu\bar.png","wav\menu.wav","","wav\select.wav")
addmenuitem("30","","ggtimer",0,poop)
addmenuitem("60","","ggtimer",1,poop)
addmenuitem("90","","ggtimer",2,poop)
addmenuitem("00","","ggtimer",3,poop)


setmenuactive(poop)
Return poop
End Function


Function Selectconfigplayermenu()
poop = createxmenu(280,0,300,240,"menu\blank.png","menu\bar.png","wav\menu.wav","","wav\select.wav")
addmenuitem("Player 1","","gplayer",0,poop)
addmenuitem("Player 2","","gplayer",1,poop)

setmenuactive(poop)
Return poop
End Function

Function Selectconfigplayermenub()
poop = createxmenu(280,0,300,240,"menu\blank.png","menu\bar.png","wav\menu.wav","","wav\select.wav")
addmenuitem("Player 1","","gplayerb",0,poop)
addmenuitem("Player 2","","gplayerb",1,poop)

setmenuactive(poop)
Return poop
End Function


Function createkeyconfigMenu()
poop = createxmenu(280,0,300,240,"menu\blank.png","menu\bar.png","wav\menu.wav","","wav\select.wav")
Select MAINEDITPLAYER
Case 1
If P1INPUTDEV = 0 Then
addmenuitem("UP"+P1DEVICE$+P1KEYUP,"","gsetkkey",0,poop)
addmenuitem("DOWN"+P1DEVICE$+P1KEYDN,"","gsetkkey",1,poop)
addmenuitem("LEFT"+P1DEVICE$+P1KEYLF,"","gsetkkey",2,poop)
addmenuitem("RIGHT"+P1DEVICE$+P1KEYRT,"","gsetkkey",3,poop)
Else
addmenuitem("UP"+"Joy UP","","",0,poop)
addmenuitem("DOWN"+"Joy DN","","",1,poop)
addmenuitem("LEFT"+"Joy LF","","",2,poop)
addmenuitem("RIGHT"+"Joy RT","","",3,poop)
EndIf
addmenuitem("WPUNCH"+P1DEVICE$+P1KEYWP,"","gsetkkey",4,poop)
addmenuitem("SPUNCH"+P1DEVICE$+P1KEYSP,"","gsetkkey",5,poop)
addmenuitem("WKICK"+P1DEVICE$+P1KEYWK,"","gsetkkey",6,poop)
addmenuitem("SKICK"+P1DEVICE$+P1KEYSK,"","gsetkkey",7,poop)
addmenuitem("START"+P1DEVICE$+P1KEYST,"","gsetkkey",8,poop)

Case 2
If P2INPUTDEV = 0 Then
addmenuitem("UP"+P2DEVICE$+P2KEYUP,"","gsetkkey",0,poop)
addmenuitem("DOWN"+P2DEVICE$+P2KEYDN,"","gsetkkey",1,poop)
addmenuitem("LEFT"+P2DEVICE$+P2KEYLF,"","gsetkkey",2,poop)
addmenuitem("RIGHT"+P2DEVICE$+P2KEYRT,"","gsetkkey",3,poop)
Else
addmenuitem("UP"+"Joy UP","","",0,poop)
addmenuitem("DOWN"+"Joy DN","","",1,poop)
addmenuitem("LEFT"+"Joy LF","","",2,poop)
addmenuitem("RIGHT"+"Joy RT","","",3,poop)
EndIf
addmenuitem("WPUNCH"+P2DEVICE$+P2KEYWP,"","gsetkkey",4,poop)
addmenuitem("SPUNCH"+P2DEVICE$+P2KEYSP,"","gsetkkey",5,poop)
addmenuitem("WKICK"+P2DEVICE$+P2KEYWK,"","gsetkkey",6,poop)
addmenuitem("SKICK"+P2DEVICE$+P2KEYSK,"","gsetkkey",7,poop)
addmenuitem("START"+P2DEVICE$+P2KEYST,"","gsetkkey",8,poop)

End Select
addmenuitem("Return","","gsetkkeyreturn",9,poop)
setmenuactive(poop)
Return poop
End Function

Function createdevicelistmenu()
poop = createxmenu(280,0,300,240,"menu\blank.png","menu\bar.png","wav\menu.wav","","wav\select.wav")
addmenuitem("Keyboard","","seldevice",0,poop)
If Not JoyCount() Then

Else
For n = 1 To JoyCount()
addmenuitem(JoyName(n),"","seldevice",n,poop)

Next
EndIf
setmenuactive(poop)
Return poop
End Function

Function createroundsmenu()
poop = createxmenu(280,0,300,240,"menu\blank.png","menu\bar.png","wav\menu.wav","","wav\select.wav")
addmenuitem("2","","ggrounds",0,poop)
addmenuitem("4","","ggrounds",1,poop)
addmenuitem("6","","ggrounds",2,poop)
addmenuitem("8","","ggrounds",3,poop)


setmenuactive(poop)
Return poop
End Function


Function createdifficultmenu()
poop = createxmenu(280,0,300,240,"menu\blank.png","menu\bar.png","wav\menu.wav","","wav\select.wav")
addmenuitem("Easy","","ggdiffi",0,poop)
addmenuitem("Medium","","ggdiffi",1,poop)
addmenuitem("Hard","","ggdiffi",2,poop)
addmenuitem("Elite","","ggdiffi",3,poop)


setmenuactive(poop)
Return poop
End Function

Function createdisplaymenu()
poop = createxmenu(280,0,300,240,"menu\blank.png","menu\bar.png","wav\menu.wav","","wav\select.wav")
addmenuitem("Window","","ggdisplay",0,poop)
addmenuitem("FullScreen","","ggdisplay",1,poop)



setmenuactive(poop)
Return poop
End Function


Function createstageseltext()
poop = createxmenu(190,0,300,240,"menu\blank.png","menu\blank.png","wav\menu.wav","","wav\select.wav")

addmenuitem("Stage Select","","",0,poop)

'setmenuactive(poop)

Return poop

End Function

Function createstageselectionscreen()
poop = createxmenu(0,64,300,240,"menu\stagesel.png","menu\self.png","wav\menu.wav","music\world.ogg","wav\select.wav")
'addmenuitem("eh?","","fightersel",0,poop)

poopit = 0

For b:bga = EachIn bga_list
addmenuitem("","bgs\"+b.thumbgpath$,"stagesel",poopit,poop)
'setitembg(poop,poopit,"bgs\"+b.bgname$+".png")
'setitembgscale(poop,poopit,True,1)
poopit = poopit + 1
Next
setmenucols(poop,10)
'addmenuitem("",turds$,"fightersel",poopit,poop)
'addmenuitem("",turds$,"fightersel",poopit+1,poop)
'addmenuitem("",turds$,"fightersel",poopit+2,poop)

setmenuactive(poop)

Return poop

End Function

Function createstageselectionscreenhost()
poop = createxmenu(0,64,300,240,"menu\stagesel.png","menu\self.png","wav\menu.wav","music\world.ogg","wav\select.wav")
'addmenuitem("eh?","","fightersel",0,poop)

poopit = 0

For b:bga = EachIn bga_list
addmenuitem("","bgs\"+b.thumbgpath$,"stageselhost",poopit,poop)
'setitembg(poop,poopit,"bgs\"+b.bgname$+".png")
'setitembgscale(poop,poopit,True,1)
poopit = poopit + 1
Next
setmenucols(poop,10)
'addmenuitem("",turds$,"fightersel",poopit,poop)
'addmenuitem("",turds$,"fightersel",poopit+1,poop)
'addmenuitem("",turds$,"fightersel",poopit+2,poop)

setmenuactive(poop)

Return poop

End Function

Function createselectionscreen()
poop = createxmenu(180,60,300,240,"menu\selscreen.png","menu\self.png","wav\menu.wav","music\world.ogg","wav\select.wav")
'addmenuitem("eh?","","fightersel",0,poop)
setmenucols(poop,4)
poopit = 0


For d:fighter = EachIn fighter_list
addmenuitem("",d.selspath$,"fightersel",poopit,poop)
setitembg(poop,poopit,d.selbpath$)
turds$ = d.selspath$
poopit = poopit + 1
Next

setmenuactive(poop)
P2TYPE$ = "COMP"
P2FSELREADY = True
P1FSELREADY = False
Return poop
End Function


Function createhostselectionscreen()
poop = createxmenu(180,60,300,240,"menu\selscreen.png","menu\self.png","wav\menu.wav","music\world.ogg","wav\select.wav")
'addmenuitem("eh?","","fightersel",0,poop)
setmenucols(poop,4)
poopit = 0


For d:fighter = EachIn fighter_list
addmenuitem("",d.selspath$,"hostfightersel",poopit,poop)
setitembg(poop,poopit,d.selbpath$)
turds$ = d.selspath$
poopit = poopit + 1
Next

setmenuactive(poop)
P2TYPE$ = ""
P2FSELREADY = True
P1FSELREADY = False
Return poop
End Function

Function createclientselectionscreen()
poop = createxmenu(180,60,300,240,"menu\selscreen.png","menu\self.png","wav\menu.wav","music\world.ogg","wav\select.wav")
'addmenuitem("eh?","","fightersel",0,poop)
setmenucols(poop,4)
poopit = 0


For d:fighter = EachIn fighter_list
addmenuitem("",d.selspath$,"clientfightersel",poopit,poop)
setitembg(poop,poopit,d.selbpath$)
turds$ = d.selspath$
poopit = poopit + 1
Next

setmenuactive(poop)
P2TYPE$ = ""
P2FSELREADY = True
P1FSELREADY = False
Return poop
End Function

Function createplayer1type()
poop = createxmenu(0,20,180,240,"menu\blank.png","menu\tsel.png","wav\menu.wav","","wav\select.wav")
setmenucols(poop,1)
addmenuitem("","menu\typem.png","typesel",0,poop)
addmenuitem("","menu\typeo.png","typesel",1,poop)
addmenuitem("","menu\typef.png","typesel",2,poop)
addmenuitem("","menu\typee.png","typesel",3,poop)
addmenuitem("","menu\typex.png","typesel",4,poop)


setmenuactive(poop)

Return poop
End Function


Function createplayer1typehost()
poop = createxmenu(0,20,180,240,"menu\blank.png","menu\tsel.png","wav\menu.wav","","wav\select.wav")
setmenucols(poop,1)
addmenuitem("","menu\typem.png","hosttypesel",0,poop)
addmenuitem("","menu\typeo.png","hosttypesel",1,poop)
addmenuitem("","menu\typef.png","hosttypesel",2,poop)
addmenuitem("","menu\typee.png","hosttypesel",3,poop)
addmenuitem("","menu\typex.png","hosttypesel",4,poop)


setmenuactive(poop)

Return poop
End Function

Function createplayer1typeclient()
poop = createxmenu(0,20,180,240,"menu\blank.png","menu\tsel.png","wav\menu.wav","","wav\select.wav")
setmenucols(poop,1)
addmenuitem("","menu\typem.png","clienttypesel",0,poop)
addmenuitem("","menu\typeo.png","clienttypesel",1,poop)
addmenuitem("","menu\typef.png","clienttypesel",2,poop)
addmenuitem("","menu\typee.png","clienttypesel",3,poop)
addmenuitem("","menu\typex.png","clienttypesel",4,poop)


setmenuactive(poop)

Return poop
End Function

Function createplayer2type()
poop = createxmenu(640-180,20,180,240,"menu\blank.png","menu\tsel.png","wav\menu.wav","","wav\select.wav")
setmenucols(poop,1)
addmenuitem("","menu\typem.png","typesel",0,poop)
addmenuitem("","menu\typeo.png","typesel",1,poop)
addmenuitem("","menu\typef.png","typesel",2,poop)
addmenuitem("","menu\typee.png","typesel",3,poop)
addmenuitem("","menu\typex.png","typesel",4,poop)


setmenuactive(poop)

Return poop
End Function




Function getselectedmenuitem(mmhandle)


For men:menu = EachIn menu_list
If men.mhandle = mmhandle Then

Return men.currentind
EndIf
Next

End Function

Function getselectedmenuitemp2(mmhandle)


For men:menu = EachIn menu_list
If men.mhandle = mmhandle Then

Return men.currentind2
EndIf
Next

End Function

Function getselectionfighters()
	'optimized for faster loading.
	tempdir=ReadDir(CurrentDir$()+"\Fighters\")
	DebugLog tempdir
	fightnum = 0
	Repeat
		tempfile$=NextFile$(tempdir)
		DebugLog tempfile$+" <----- file?"
		If FileType(CurrentDir$()+"\Fighters\"+tempfile$) = 2 And tempfile$ <> "." And tempfile$ <> ".." And tempfile$ <> ".svn" Then
			'let's wait to make the fighter until we know the data is even there..
			
			'd:fighter = New fighter
			'DebugLog "made a fighter"
			'fightnum = fightnum + 1
			'd.fighternum = fightnum
			'not sure why io used that variable name lol
			'tempshitass = tempshitass + 1
			'tempint = tempint + 1
			'd.fname$ = tempfile$
			'd.fid$ = tempfile$
			'd.fanim$ = "intro"
			'tempdir2=ReadDir(CurrentDir$()+"\Fighters\"+tempfile$)
			'tempfile2$ = "p"
			
			'**************************************************************************************************************
			'going to speed this up, no point in iterating through each file if we know exactly what we need out of the dir
			'**************************************************************************************************************
			
			If FileType(CurrentDir$()+"\Fighters\"+tempfile$+"\"+tempfile$+".mfe") = 1 Then
			
				d:fighter = New fighter
				fightnum = fightnum + 1
				d.fighternum = fightnum
				d.fname$ = tempfile$
				'might want to check on that id
				d.fid$ = tempfile$
				d.fanim$ = "intro"	
				d.dfile$ = CurrentDir$()+"\Fighters\"+tempfile$+"\"+tempfile$+".mfe"			
				d.Stream = ReadFile(d.dfile$)
				d.charid$ = ReadString(d.Stream,5)
				d.vit = ReadInt(d.Stream)
				d.spd = ReadInt(d.Stream)
				d.def = ReadInt(d.Stream)
				d.pow = ReadInt(d.Stream)
				d.spr = ReadInt(d.Stream)
				d.will = ReadInt(d.Stream)
				CloseFile( d.Stream ) 			
			
			
				'get selection images
				If FileType(CurrentDir$()+"\Fighters\"+tempfile$+"\selb.png") = 1 Then
				
					d.selbpath$ = CurrentDir$()+"\Fighters\"+tempfile$+"\selb.png"
					d.selb = LoadImage(CurrentDir$()+"\Fighters\"+tempfile$+"\selb.png")
				
				Else
				
					d.selbpath$ = CurrentDir$()+"\sprites\selb.png"
					d.selb = LoadImage(CurrentDir$()+"\sprites\selb.png")					
				
				EndIf
				If FileType(CurrentDir$()+"\Fighters\"+tempfile$+"\sels.png") = 1 Then
				
					d.selspath$ = CurrentDir$()+"\Fighters\"+tempfile$+"\sels.png"
					d.sels = LoadImage(CurrentDir$()+"\Fighters\"+tempfile$+"\sels.png")
				
				Else
				
					d.selspath$ = CurrentDir$()+"\sprites\sels.png"
					d.sels = LoadImage(CurrentDir$()+"\sprites\sels.png")					
				
				EndIf
				Cls
				SetScale( 2,2 )
				SetImageFont(fntArialA)
				DrawImage mainload,0,0
				'Color Rnd(1,255),Rnd(1,255),Rnd(1,255)
				DrawText "Loading: Fighter "+tempfile$,0,0
				'a debug code
				'If maindebug = True Then 
				'Print startdir$+"\sprites\"+tempfile$
				Flip 'nbg 'flipCanvas nbg 'FlipCanvas nbg 'flipCanvas nbg 'FlipCanvas nbg 'Flip
				SetScale( 1,1 )				
							
			EndIf
			Rem
			While tempfile2$ <> ""
				tempfile2$=NextFile$(tempdir2)
				tempfile2$ = Lower(tempfile2$)
				If Instr(tempfile2$,".mfe",1) <> 0 Or Instr(tempfile2$,".MFE",1) <> 0 Then
					d.dfile$ = CurrentDir$()+"\Fighters\"+tempfile$+"\"+tempfile2$
					If d.dfile$ <> "" Then
					d.Stream = OpenFile(d.dfile$)
					'print "datafile "+p\datafile$
					'turd = ReadInt(d.Stream)
					d.charid$ = ReadString(d.Stream,5)
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
					d.selbpath$ = CurrentDir$()+"\Fighters\"+tempfile$+"\"+tempfile2$
					d.selb = LoadImage(CurrentDir$()+"\Fighters\"+tempfile$+"\"+tempfile2$)
					'MaskImage d.selb,255,0,255
					EndIf
					If Instr(tempfile2$,"sels",1) <> 0 Then
					d.selspath$ = CurrentDir$()+"\Fighters\"+tempfile$+"\"+tempfile2$
					
					d.sels = LoadImage(CurrentDir$()+"\Fighters\"+tempfile$+"\"+tempfile2$)
					'MaskImage d.sels,255,0,255
					EndIf
				
				EndIf
				
				
				
				
				Cls
				SetScale( 2,2 )
				SetImageFont(fntArialA)
				DrawImage mainload,0,0
				'Color Rnd(1,255),Rnd(1,255),Rnd(1,255)
				DrawText "Loading: Fighter "+tempfile$,0,0
				'a debug code
				'If maindebug = True Then 
				'Print startdir$+"\sprites\"+tempfile$
				Flip 'nbg 'flipCanvas nbg 'FlipCanvas nbg 'flipCanvas nbg 'FlipCanvas nbg 'Flip
				SetScale( 1,1 )
				
			
			Wend
			End Rem
			
		EndIf
		
		If tempfile$="" Then Exit 
	Forever
End Function 


Function getimpacts()


	' i broke this down into three types For impacts And some other things like fballs
	' this Type is just To store the main types of impacts And some Default properties For them
	i:impact = New impact
	i.iid$ = "bimpact"
	i.getframes()
	i:impact = New impact
	i.iid$ = "simpact"
	i.getframes()
	i:impact = New impact
	i.iid$ = "wimpact"
	i.getframes()
	i:impact = New impact
	i.iid$ = "charge"
	i.getframes()
	
	Print "created impact types"


	

	Rem
	'Right here im checking the sprites directory For any image files To load all the impact frames
	tempdir=ReadDir(startdir$+"\sprites\")
	tempfile$ = "poop"
	Repeat
	tempfile$=NextFile$(tempdir)
	Print "tempfile: "+tempfile$+startdir$+"\sprites\" 
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
	SetImageFont(fntArialA)
	DrawImage mainload,0,0
	'Color Rnd(1,255),Rnd(1,255),Rnd(1,255)
	DrawText "Loading: Impact GFX "+tempfile$,0,0
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
	End Rem
End Function


Function getbgs()

	bgdir=ReadDir(startdir$+"\bgs\")
	bgnum = 0
	Repeat
		bgfile$=NextFile$(bgdir)
		bgfile$ = Lower(bgfile$)
		If Instr(bgfile$,".png",1) <> 0 And Instr(bgfile$,"_thumb",1) = 0 Then
			b:bga = New bga
			
			b.bgnum = bgnum
			bgnum = bgnum + 1
			'do i really need to load the music and stage large files now?
			b.sbgpath$ = startdir$+"\bgs\"+bgfile$
			'b.bg = LoadImage(startdir$+"\bgs\"+bgfile$,0)
			
			
			If FileType(startdir$+"\music\"+Replace(bgfile$,".png",".ogg")) <> 0 Then 
				b.bgmusicpath$ = startdir$+"\music\"+Replace(bgfile$,".png",".ogg")
			'b.bgmusic = LoadSound(startdir$+"\music\"+Replace(bgfile$,".png",".ogg"),True)
			Else
				b.bgmusicpath$ = startdir$+"\music\ryu.ogg"
			'b.bgmusic = LoadSound(startdir$+"\music\ryu.ogg",True)
			EndIf
			'lets take out the .png To use the file as the name of the background
			DebugLog "Made file from "+bgfile$
			b.bgname$ = Replace(bgfile$,".png","")
			b.thumbgpath$ = b.bgname$+"_thumb.png"
			Cls
			SetScale( 2,2 )
			SetImageFont(fntArialA)
			DrawImage mainload,0,0
			'Color Rnd(1,255),Rnd(1,255),Rnd(1,255)
			DrawText "Loading: Stages "+bgfile$,0,0
			'a debug code
			'If maindebug = True Then 
			'Print startdir$+"\sprites\"+tempfile$
			Flip 'nbg 'flipCanvas nbg 'FlipCanvas nbg 'flipCanvas nbg 'FlipCanvas nbg 'Flip
			SetScale( 1,1 )		
		EndIf
		
		

		'If we run out of files in the bg folder Then we are done here
		If bgfile$="" Then Exit 
	Forever


End Function

Function waitjoyaxis#(port)


Repeat

n# = JoyX( port )
If n# <> 0 Then Return n#
n# = JoyY( port )
If n# <> 0 Then Return n#



Forever


End Function

Function waitjoycaps(port)

Repeat

For n = 0 To Int(Bin$(JoyAxisCaps(0)))
If JoyHit(n,port) = True Then Return n
Next


Forever


End Function


Function clearevents()
While PollEvent() <> Null
poop = PollEvent()
Wend

End Function
