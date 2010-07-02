Import "bin\bbtype.bmx"
Import "bin\bbvkey.bmx"
'Include "bin\globals.bmx"
Include "bin\splash.bmx"
Include "bin\types.bmx"
Include "bin\uimedia.bmx"
Include "bin\fighterdata.bmx"

Global currentfighter$,fileline$,stat$,tempgfx
Global fightnum,pwid,phigh
Global trefresh = True
Global currentframe = 1
geteditorfighters()
Include "bin\editorgui.bmx"
Include "bin\editorgfx.bmx"
Include "bin\editorguievents.bmx"




While True
Cls
drawfighter()

'Cls
Flip
	WaitEvent 
	'Print CurrentEvent.ToString()
	'kkeyhit = 0
	Select EventID()
	
		Case EVENT_MENUACTION
			Select EventData()
			
			Case MENU_EXIT
			End
		
			Case MENU_SAVE
			savechar()
		
			Case MENU_LOAD
			loadchar()
			
			Case MENU_KOF9
			importkof91()
			
			Case MENU_PASS
			passlock = CreateWindow( "Password Protect Char",GadgetWidth(Desktop())/4,GadgetHeight(Desktop())/4,200,120,Desktop(),1 )
			CreateLabel("Password",5,0,50,20,passlock)
			passwordgui=CreateTextField(5,25,150,20,passlock)
			passok = CreateButton("OK",5,50,20,20,passlock)
			
						
			Case MENU_NAME
			fnameo = CreateWindow( "Set Fighter In-Game Name",GadgetWidth(Desktop())/4,GadgetHeight(Desktop())/4,200,120,Desktop(),1 )
			CreateLabel("Fighter Name",5,0,150,20,fnameo)
			fnameogui=CreateTextField(5,25,150,20,fnameo)
			fnameook = CreateButton("OK",5,50,20,20,fnameo)
						
															
			End Select
		
		Case EVENT_GADGETACTION
		
			Select EventSourceHandle()
			
			Case passok2
				For f:fighter = EachIn fighter_list
					If f.fid$ = tempid$ Then
						If f.password$ = TextFieldText(passwordgui2) Then
						FreeGadget passlock2
						EnableGadget fightered
						Else
						End
						EndIf
					EndIf
				Next
			
			
			Case fnameook
			trefresh = True
				For f:fighter = EachIn fighter_list
					If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
					f.ftname$ = TextFieldText(fnameogui)
					EndIf
				Next
			FreeGadget fnameo
			
			
			Case framedown
			trefresh = True
			currentframe = currentframe - 1
			If currentframe < 1 Then currentframe = 1
			SetGadgetText framenumlabel,currentframe

			Case frameup
			trefresh = True
			currentframe = currentframe + 1
			If currentframe > 20 Then currentframe = 20
			SetGadgetText framenumlabel,currentframe
			
			Case hitxgui
			trefresh = True
			For a:animdata = EachIn animdata_list
			If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If a.fanim$ = GadgetItemText(animsel,SelectedGadgetItem(animsel)) Then
			
			a.fhcolx = Int(TextFieldText(hitxgui))
			EndIf
			EndIf
			Next
			
			Case hitygui
			trefresh = True
			For a:animdata = EachIn animdata_list
			If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If a.fanim$ = GadgetItemText(animsel,SelectedGadgetItem(animsel)) Then
			
			a.fhcoly = Int(TextFieldText(hitygui))
			EndIf
			EndIf
			Next
			
			Case damxgui
			trefresh = True
			For a:animdata = EachIn animdata_list
			If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If a.fanim$ = GadgetItemText(animsel,SelectedGadgetItem(animsel)) Then
			
			a.fdcolx = Int(TextFieldText(damxgui))
			EndIf
			EndIf
			Next
			
			Case nofgui
			For a:animdata = EachIn animdata_list
			If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If a.fanim$ = GadgetItemText(animsel,SelectedGadgetItem(animsel)) Then
			
			a.nof = Int(TextFieldText(nofgui))
			EndIf
			EndIf
			Next
			
			Case hfmgui
			For a:animdata = EachIn animdata_list
			If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If a.fanim$ = GadgetItemText(animsel,SelectedGadgetItem(animsel)) Then
			
			a.fhitf = Int(TextFieldText(hfmgui))
			EndIf
			EndIf
			Next
			
			Case frtgui
			For a:animdata = EachIn animdata_list
			If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If a.fanim$ = GadgetItemText(animsel,SelectedGadgetItem(animsel)) Then
			
			a.frate = Int(TextFieldText(frtgui))
			EndIf
			EndIf
			Next
			
			
			Case halign
			trefresh = True
			For a:animdata = EachIn animdata_list
			If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If a.fanim$ = GadgetItemText(animsel,SelectedGadgetItem(animsel)) Then
			
			a.halign = Int(TextFieldText(halign))
			EndIf
			EndIf
			Next
			
			Case damygui
			trefresh = True
			For a:animdata = EachIn animdata_list
			If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If a.fanim$ = GadgetItemText(animsel,SelectedGadgetItem(animsel)) Then
			
			a.fdcoly = Int(TextFieldText(damygui))
			EndIf
			EndIf
			Next
			
			Case fightersel
			trefresh = True
			For a:animdata = EachIn animdata_list
			If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If a.fanim$ = GadgetItemText(animsel,SelectedGadgetItem(animsel)) Then
			SetGadgetText hitxgui,a.fhcolx
			SetGadgetText hitygui,a.fhcoly
			SetGadgetText damxgui,a.fdcolx
			SetGadgetText damygui,a.fdcoly
			SetGadgetText nofgui,a.nof
			SetGadgetText hfmgui,a.fhitf
			SetGadgetText frtgui,a.frate
			SetGadgetText halign,a.halign
			
			EndIf
			EndIf
			Next
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			myfrigginnum = f.fighternum
			SetGadgetText vitnumlabel,f.vit
			SetGadgetText pownumlabel,f.pow
			SetGadgetText defnumlabel,f.def
			SetGadgetText spdnumlabel,f.spd
			SetGadgetText willnumlabel,f.will
			SetGadgetText sprnumlabel,f.spr
			SetGadgetText firebgui,f.fireb$
			SetGadgetText firebxgui,f.firebx$
			SetGadgetText specgui,f.spec$
			SetGadgetText specxgui,f.specx$
			SetGadgetText dashgui,f.dash$
			SetGadgetText dashxgui,f.dashx$
			SetGadgetText fatalgui,f.fatal$
			
			EndIf
			Next
			
			
			
			Case animsel
			trefresh = True
			For a:animdata = EachIn animdata_list
			If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If a.fanim$ = GadgetItemText(animsel,SelectedGadgetItem(animsel)) Then
			SetGadgetText hitxgui,a.fhcolx
			SetGadgetText hitygui,a.fhcoly
			SetGadgetText damxgui,a.fdcolx
			SetGadgetText damygui,a.fdcoly
			SetGadgetText nofgui,a.nof
			SetGadgetText hfmgui,a.fhitf
			SetGadgetText frtgui,a.frate
			SetGadgetText halign,a.halign
			EndIf
			EndIf
			Next
			
			
			Case vitdown
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If f.vit <= 0 Then
			f.vit = 0
			Else
			f.vit = f.vit - 1
			f.spoints = f.spoints + 1
			EndIf
			SetGadgetText statpointsgui,"Stat Points: "+f.spoints
			SetGadgetText vitnumlabel,f.vit
			EndIf
			Next
			
			Case vitup
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If f.spoints <= 0 Then
			f.spoints = 0
			Else
			f.vit = f.vit + 1
			f.spoints = f.spoints - 1
			EndIf
			SetGadgetText statpointsgui,"Stat Points: "+f.spoints
			SetGadgetText vitnumlabel,f.vit
			EndIf
			Next
			
			
			Case defdown
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If f.def <= 0 Then
			f.def = 0
			Else
			f.def = f.def - 1
			f.spoints = f.spoints + 1
			EndIf
			SetGadgetText statpointsgui,"Stat Points: "+f.spoints
			SetGadgetText defnumlabel,f.def
			EndIf
			Next
			
			Case defup
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If f.spoints <= 0 Then
			f.spoints = 0
			Else
			f.def = f.def + 1
			f.spoints = f.spoints - 1
			EndIf
			SetGadgetText statpointsgui,"Stat Points: "+f.spoints
			SetGadgetText defnumlabel,f.def
			EndIf
			Next
			
			Case powdown
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If f.pow <= 0 Then
			f.pow = 0
			Else
			f.pow = f.pow - 1
			f.spoints = f.spoints + 1
			EndIf
			SetGadgetText statpointsgui,"Stat Points: "+f.spoints
			SetGadgetText pownumlabel,f.pow
			EndIf
			Next
			
			Case powup
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If f.spoints <= 0 Then
			f.spoints = 0
			Else
			f.pow = f.pow + 1
			f.spoints = f.spoints - 1
			EndIf
			SetGadgetText statpointsgui,"Stat Points: "+f.spoints
			SetGadgetText pownumlabel,f.pow
			EndIf
			Next
			
			Case spddown
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If f.spd <= 0 Then
			f.spd = 0
			Else
			f.spd = f.spd - 1
			f.spoints = f.spoints + 1
			EndIf
			SetGadgetText statpointsgui,"Stat Points: "+f.spoints
			SetGadgetText spdnumlabel,f.spd
			EndIf
			Next
			
			Case spdup
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If f.spoints <= 0 Then
			f.spoints = 0
			Else
			f.spd = f.spd + 1
			f.spoints = f.spoints - 1
			EndIf
			SetGadgetText statpointsgui,"Stat Points: "+f.spoints
			SetGadgetText spdnumlabel,f.spd
			EndIf
			Next
			
			Case willdown
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If f.will <= 0 Then
			f.will = 0
			Else
			f.will = f.will - 1
			f.spoints = f.spoints + 1
			EndIf
			SetGadgetText statpointsgui,"Stat Points: "+f.spoints
			SetGadgetText willnumlabel,f.will
			EndIf
			Next
			
			Case willup
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If f.spoints <= 0 Then
			f.spoints = 0
			Else
			f.will = f.will + 1
			f.spoints = f.spoints - 1
			EndIf
			SetGadgetText statpointsgui,"Stat Points: "+f.spoints
			SetGadgetText willnumlabel,f.will
			EndIf
			Next
			
			Case sprdown
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If f.spr <= 0 Then
			f.spr = 0
			Else
			f.spr = f.spr - 1
			f.spoints = f.spoints + 1
			EndIf
			SetGadgetText statpointsgui,"Stat Points: "+f.spoints
			SetGadgetText sprnumlabel,f.spr
			EndIf
			Next
			
			Case sprup
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			If f.spoints <= 0 Then
			f.spoints = 0
			Else
			f.spr = f.spr + 1
			f.spoints = f.spoints - 1
			EndIf
			SetGadgetText statpointsgui,"Stat Points: "+f.spoints
			SetGadgetText sprnumlabel,f.spr
			EndIf
			Next
			
			Case firebgui
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			f.fireb$ = TextFieldText(firebgui)
			EndIf
			Next
			
			Case firebxgui
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			f.firebx$ = TextFieldText(firebxgui)
			EndIf
			Next
			
			Case dashgui
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			f.dash$ = TextFieldText(dashgui)
			EndIf
			Next
			
			Case dashxgui
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			f.dashx$ = TextFieldText(dashxgui)
			EndIf
			Next
			
			Case specgui
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			f.spec$ = TextFieldText(specgui)
			EndIf
			Next
			
			Case specxgui
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			f.specx$ = TextFieldText(specxgui)
			EndIf
			Next
			
			Case fatalgui
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			f.fatal$ = TextFieldText(fatalgui)
			EndIf
			Next
			
			Case passwordgui
			For f:fighter = EachIn fighter_list
			If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
			f.password$ = TextFieldText(passwordgui)
			EndIf
			Next
			
			Case passok
			FreeGadget passlock

			
			End Select
		
		'gadgetactions()
		Case EVENT_KEYDOWN
		kkeyhit = EventData()
		Case EVENT_KEYUP
		kkeyhit = 0
		Case EVENT_WINDOWCLOSE
			End
	End Select
Wend



guievents()