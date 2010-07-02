Function savechar()

filter$="Mofe Files:mfe"
File$=RequestFile( "Save Fighter as",filter$,True,CurrentDir() )

If File$ = "" Then Return
If FileType(File$) = 0 Then
CreateFile(File$)

EndIf
Stream = WriteFile(File$)
'write main fighter data
For f:fighter = EachIn fighter_list
If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
WriteInt Stream,Len(f.fid$)
WriteString Stream,f.fid$
WriteInt Stream,f.vit
WriteInt Stream,f.spd
WriteInt Stream,f.def
WriteInt Stream,f.pow
WriteInt Stream,f.spr
WriteInt Stream,f.will
WriteInt Stream,f.expts
WriteInt Stream,Len(f.password$)
WriteString Stream,f.password$
WriteInt Stream,Len(f.fname$)
WriteString Stream,f.fname$
WriteInt Stream,Len(f.ftname$)
WriteString Stream,f.ftname$
WriteInt Stream,f.spoints
WriteInt Stream,f.fighternum
WriteInt Stream,Len(f.fireb$)
WriteInt Stream,Len(f.firebx$)
WriteInt Stream,Len(f.dash$)
WriteInt Stream,Len(f.dashx$)
WriteInt Stream,Len(f.spec$)
WriteInt Stream,Len(f.specx$)
WriteInt Stream,Len(f.fatal$)

WriteString Stream,f.fireb$
WriteString Stream,f.firebx$
WriteString Stream,f.dash$
WriteString Stream,f.dashx$
WriteString Stream,f.spec$
WriteString Stream,f.specx$
WriteString Stream,f.fatal$
EndIf
Next
'write main animation data
For ass = 0 To 32
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = GadgetItemText(animsel,ass) Then
WriteInt Stream,Len(a.fid$)
WriteString Stream,a.fid$
WriteInt Stream,a.nof
WriteInt Stream,Len(a.fanim$)
WriteString Stream,a.fanim$
WriteInt Stream,a.fhitf
WriteInt Stream,a.fhcolx
WriteInt Stream,a.fhcoly
WriteInt Stream,a.fdcolx
WriteInt Stream,a.fdcoly
WriteInt Stream,a.fighternum
WriteInt Stream,a.frate
WriteInt Stream,a.halign
EndIf
EndIf
Next
Next

'WriteInt Stream,"-1"
CloseFile Stream


End Function





Function loadchar()


'load fighter data

'first lets make sure they have their fighter in the correct folder

'tempfexists = False
filter$="Mofe Files:mfe"
File$=RequestFile( "Load Fighter",filter$,False,CurrentDir() )

If File$ = "" Then Return
If FileType(File$) = 0 Then
Return

EndIf



Stream = ReadFile(File$)
ttint = ReadInt(Stream)
tempid$ = ReadString(Stream,ttint)
For f:fighter = EachIn fighter_list
If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
f.vit = ReadInt(Stream)
f.spd = ReadInt(Stream)
f.def = ReadInt(Stream)
f.pow = ReadInt(Stream)
f.spr = ReadInt(Stream)
f.will = ReadInt(Stream)
f.expts = ReadInt(Stream)
ttint = ReadInt(Stream)
f.password$ = ReadString(Stream,ttint)
temppass$ = f.password$
ttint = ReadInt(Stream)
f.fname$ = ReadString(Stream,ttint)
ttint = ReadInt(Stream)
f.ftname$ = ReadString(Stream,ttint)
f.spoints = ReadInt(Stream)
nulla2 = ReadInt(Stream)
ttint1 = ReadInt(Stream)
ttint2 = ReadInt(Stream)
ttint3 = ReadInt(Stream)
ttint4 = ReadInt(Stream)
ttint5 = ReadInt(Stream)
ttint6 = ReadInt(Stream)
ttint7 = ReadInt(Stream)

f.fireb$ = ReadString(Stream,ttint1)
f.firebx$ = ReadString(Stream,ttint2)
f.dash$ = ReadString(Stream,ttint3)
f.dashx$ = ReadString(Stream,ttint4)
f.spec$ = ReadString(Stream,ttint5)
f.specx$ = ReadString(Stream,ttint6)
f.fatal$ = ReadString(Stream,ttint7)
'tempfexists = True
'Else
'tempfexists = False
EndIf
Next


For ass = 0 To 32
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = GadgetItemText(animsel,ass) Then
ttint = ReadInt(Stream)
Nulla$ = ReadString(Stream,ttint)
a.nof = ReadInt(Stream)
ttint = ReadInt(Stream)
Nulla$ = ReadString(Stream,ttint)
a.fhitf = ReadInt(Stream)
a.fhcolx = ReadInt(Stream)
a.fhcoly = ReadInt(Stream)
a.fdcolx = ReadInt(Stream)
a.fdcoly = ReadInt(Stream)
nulla2 = ReadInt(Stream)
a.frate = ReadInt(Stream)
a.halign = ReadInt(Stream)
tempfexists = True 
EndIf
'Else
'tempfexists = False
EndIf
Next
Next
CloseFile Stream
'If Not ReadInt(Stream) = -1 Then End'Probaly Not a valid file
'If tempfexists = False Then
'Notify "Fighter needs to be in Fighter Dir to Load",False
'Else
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

'If temppass$ <> "" Then
'DisableGadget fightered
'passlock2 = CreateWindow( "Enter Password",GadgetWidth(Desktop())/4,GadgetHeight(Desktop())/4,200,120,Desktop(),1 )
'CreateLabel("Password",5,0,50,20,passlock2)
'passwordgui2=CreateTextField(5,25,150,20,passlock2)
'passok2 = CreateButton("OK",5,50,20,20,passlock2)
'EndIf
'EndIf
'EndIf

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


End Function







Function importkof91()


filter$="KOF91 Files:ini"
File$=RequestFile( "Import KOF91",filter$,False,CurrentDir() )


'File$ = RequestFile("Import Fighter INI","ini",False)
If File$ = "" Then Return
For f:fighter = EachIn fighter_list
If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then

Stream = ReadFile(File$)
While Not Eof(Stream) 
fileline$ =  ReadLine(Stream) 
parsekof91data(fileline$)

Wend 
EndIf
Next
'EndIf
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
EndIf
EndIf
Next
For f:fighter = EachIn fighter_list
If f.fighternum = SelectedGadgetItem(fightersel) + 1 Then
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


End Function






Function parsekof91data(fileline$)

'stand hitting coordinates
If Instr(fileline$,"static_offx",1) Then
stat$ = Replace(fileline$,"static_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "stand" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"static_offy",1) Then
stat$ = Replace(fileline$,"static_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "stand" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'stamd get hit coordinates

If Instr(fileline$,"static_defx",1) Then
stat$ = Replace(fileline$,"static_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "stand" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"static_defy",1) Then
stat$ = Replace(fileline$,"static_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "stand" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf


'walking hit coordinates
If Instr(fileline$,"walk_offx",1) Then
stat$ = Replace(fileline$,"walk_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "walk" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"walk_offy",1) Then
stat$ = Replace(fileline$,"walk_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "walk" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'walk get hit coordinates

'walking hit coordinates
If Instr(fileline$,"walk_defx",1) Then
stat$ = Replace(fileline$,"walk_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "walk" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"walk_defy",1) Then
stat$ = Replace(fileline$,"walk_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "walk" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf



'jump hit coordinates
If Instr(fileline$,"jump_offx",1) Then
stat$ = Replace(fileline$,"jump_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "jump" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"jump_offy",1) Then
stat$ = Replace(fileline$,"jump_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "jump" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'jump get hit coordinates


If Instr(fileline$,"jump_defx",1) Then
stat$ = Replace(fileline$,"jump_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "jump" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"jump_defy",1) Then
stat$ = Replace(fileline$,"jump_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "jump" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf



'crouch hit coordinates
If Instr(fileline$,"crouch_offx",1) Then
stat$ = Replace(fileline$,"crouch_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "crouch" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"crouch_offy",1) Then
stat$ = Replace(fileline$,"crouch_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "crouch" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'crouch get hit coordinates


If Instr(fileline$,"crouch_defx",1) Then
stat$ = Replace(fileline$,"crouch_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "crouch" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"crouch_defy",1) Then
stat$ = Replace(fileline$,"crouch_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "crouch" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf






'wpunch hit coordinates
If Instr(fileline$,"wpunch_offx",1) Then
stat$ = Replace(fileline$,"wpunch_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "wpunch" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"wpunch_offy",1) Then
stat$ = Replace(fileline$,"wpunch_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "wpunch" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'wpunch get hit coordinates


If Instr(fileline$,"wpunch_defx",1) Then
stat$ = Replace(fileline$,"wpunch_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "wpunch" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"wpunch_defy",1) Then
stat$ = Replace(fileline$,"wpunch_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "wpunch" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf



'spunch hit coordinates
If Instr(fileline$,"spunch_offx",1) Then
stat$ = Replace(fileline$,"spunch_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "spunch" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"spunch_offy",1) Then
stat$ = Replace(fileline$,"spunch_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "spunch" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'spunch get hit coordinates


If Instr(fileline$,"spunch_defx",1) Then
stat$ = Replace(fileline$,"spunch_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "spunch" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"spunch_defy",1) Then
stat$ = Replace(fileline$,"spunch_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "spunch" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf






'cpunch hit coordinates
If Instr(fileline$,"gpunch_offx",1) Then
stat$ = Replace(fileline$,"gpunch_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "cpunch" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"gpunch_offy",1) Then
stat$ = Replace(fileline$,"gpunch_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "cpunch" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'cpunch get hit coordinates


If Instr(fileline$,"gpunch_defx",1) Then
stat$ = Replace(fileline$,"gpunch_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "cpunch" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"gpunch_defy",1) Then
stat$ = Replace(fileline$,"gpunch_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "cpunch" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf





'apunch hit coordinates
If Instr(fileline$,"apunch_offx",1) Then
stat$ = Replace(fileline$,"apunch_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "apunch" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"apunch_offy",1) Then
stat$ = Replace(fileline$,"apunch_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "apunch" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'apunch get hit coordinates


If Instr(fileline$,"apunch_defx",1) Then
stat$ = Replace(fileline$,"apunch_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "apunch" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"apunch_defy",1) Then
stat$ = Replace(fileline$,"apunch_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "apunch" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf



'wkick hit coordinates
If Instr(fileline$,"wkick_offx",1) Then
stat$ = Replace(fileline$,"wkick_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "wkick" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"wkick_offy",1) Then
stat$ = Replace(fileline$,"wkick_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "wkick" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'wkick get hit coordinates


If Instr(fileline$,"wkick_defx",1) Then
stat$ = Replace(fileline$,"wkick_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "wkick" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"wkick_defy",1) Then
stat$ = Replace(fileline$,"wkick_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "wkick" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf




'skick hit coordinates
If Instr(fileline$,"skick_offx",1) Then
stat$ = Replace(fileline$,"skick_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "skick" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"skick_offy",1) Then
stat$ = Replace(fileline$,"skick_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "skick" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'skick get hit coordinates


If Instr(fileline$,"skick_defx",1) Then
stat$ = Replace(fileline$,"skick_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "skick" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"skick_defy",1) Then
stat$ = Replace(fileline$,"skick_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "skick" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf


'ckick hit coordinates
If Instr(fileline$,"gkick_offx",1) Then
stat$ = Replace(fileline$,"gkick_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "ckick" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"gkick_offy",1) Then
stat$ = Replace(fileline$,"gkick_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "ckick" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'ckick get hit coordinates


If Instr(fileline$,"gkick_defx",1) Then
stat$ = Replace(fileline$,"gkick_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "ckick" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"gkick_defy",1) Then
stat$ = Replace(fileline$,"gkick_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "ckick" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf


'akick hit coordinates
If Instr(fileline$,"akick_offx",1) Then
stat$ = Replace(fileline$,"akick_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "akick" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"akick_offy",1) Then
stat$ = Replace(fileline$,"akick_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "akick" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'ckick get hit coordinates


If Instr(fileline$,"akick_defx",1) Then
stat$ = Replace(fileline$,"akick_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "akick" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"akick_defy",1) Then
stat$ = Replace(fileline$,"akick_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "akick" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf




'fball hit coordinates
If Instr(fileline$,"fball_offx",1) Then
stat$ = Replace(fileline$,"fball_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "fball" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"fball_offy",1) Then
stat$ = Replace(fileline$,"fball_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "fball" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'fball get hit coordinates


If Instr(fileline$,"fball_defx",1) Then
stat$ = Replace(fileline$,"fball_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "fball" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"fball_defy",1) Then
stat$ = Replace(fileline$,"fball_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "fball" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf



'special hit coordinates
If Instr(fileline$,"smove_offx",1) Then
stat$ = Replace(fileline$,"smove_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "special" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"smove_offy",1) Then
stat$ = Replace(fileline$,"smove_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "special" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'special get hit coordinates


If Instr(fileline$,"smove_defx",1) Then
stat$ = Replace(fileline$,"smove_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "special" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"smove_defy",1) Then
stat$ = Replace(fileline$,"smove_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "special" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf



'fireb hit coordinates
If Instr(fileline$,"fireb_offx",1) Then
stat$ = Replace(fileline$,"fireb_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "fireb" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"fireb_offy",1) Then
stat$ = Replace(fileline$,"fireb_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "fireb" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'fireb get hit coordinates


If Instr(fileline$,"fireb_defx",1) Then
stat$ = Replace(fileline$,"fireb_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "fireb" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"fireb_defy",1) Then
stat$ = Replace(fileline$,"fireb_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "fireb" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf




'block hit coordinates
If Instr(fileline$,"block_offx",1) Then
stat$ = Replace(fileline$,"block_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "block" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"block_offy",1) Then
stat$ = Replace(fileline$,"block_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "block" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'block get hit coordinates


If Instr(fileline$,"block_defx",1) Then
stat$ = Replace(fileline$,"block_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "block" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"block_defy",1) Then
stat$ = Replace(fileline$,"block_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "block" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf




'dash hit coordinates
If Instr(fileline$,"rush_offx",1) Then
stat$ = Replace(fileline$,"rush_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "dash" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"rush_offy",1) Then
stat$ = Replace(fileline$,"rush_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "dash" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'dash get hit coordinates


If Instr(fileline$,"rush_defx",1) Then
stat$ = Replace(fileline$,"rush_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "dash" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"rush_defy",1) Then
stat$ = Replace(fileline$,"rush_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "dash" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf





'specialx hit coordinates
If Instr(fileline$,"smovex_offx",1) Then
stat$ = Replace(fileline$,"smovex_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "specialx" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"smovex_offy",1) Then
stat$ = Replace(fileline$,"smovex_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "specialx" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'specialx get hit coordinates


If Instr(fileline$,"smovex_defx",1) Then
stat$ = Replace(fileline$,"smovex_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "specialx" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"smovex_defy",1) Then
stat$ = Replace(fileline$,"smovex_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "specialx" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf




'firebx hit coordinates
If Instr(fileline$,"firebx_offx",1) Then
stat$ = Replace(fileline$,"firebx_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "firebx" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"firebx_offy",1) Then
stat$ = Replace(fileline$,"firebx_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "firebx" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'firebx get hit coordinates


If Instr(fileline$,"firebx_defx",1) Then
stat$ = Replace(fileline$,"firebx_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "firebx" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"firebx_defy",1) Then
stat$ = Replace(fileline$,"firebx_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "firebx" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf





'fballx hit coordinates
If Instr(fileline$,"fballx_offx",1) Then
stat$ = Replace(fileline$,"fballx_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "fballx" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"fballx_offy",1) Then
stat$ = Replace(fileline$,"fballx_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "fballx" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'fballx get hit coordinates


If Instr(fileline$,"fballx_defx",1) Then
stat$ = Replace(fileline$,"fballx_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "fballx" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"fballx_defy",1) Then
stat$ = Replace(fileline$,"fballx_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "fballx" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf










'dashx hit coordinates
If Instr(fileline$,"rushx_offx",1) Then
stat$ = Replace(fileline$,"rushx_offx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "dashx" Then
a.fhcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"rushx_offy",1) Then
stat$ = Replace(fileline$,"rushx_offy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "dashx" Then
a.fhcoly = Int(stat$)
EndIf
EndIf
Next

EndIf

'dashx get hit coordinates


If Instr(fileline$,"rushx_defx",1) Then
stat$ = Replace(fileline$,"rushx_defx","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "dashx" Then
a.fdcolx = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"rushx_defy",1) Then
stat$ = Replace(fileline$,"rushx_defy","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "dashx" Then
a.fdcoly = Int(stat$)
EndIf
EndIf
Next

EndIf




'number of frames
If Instr(fileline$,"fireb_nbf",1) Then
stat$ = Replace(fileline$,"fireb_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "fireb" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf



If Instr(fileline$,"fball_nbf",1) Then
stat$ = Replace(fileline$,"fball_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "fball" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf


If Instr(fileline$,"firebx_nbf",1) Then
stat$ = Replace(fileline$,"firebx_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "firebx" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf



If Instr(fileline$,"fballx_nbf",1) Then
stat$ = Replace(fileline$,"fballx_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "fballx" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf



If Instr(fileline$,"smove_nbf",1) Then
stat$ = Replace(fileline$,"smove_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "special" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf


If Instr(fileline$,"smovex_nbf",1) Then
stat$ = Replace(fileline$,"smovex_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "specialx" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf





If Instr(fileline$,"rush_nbf",1) Then
stat$ = Replace(fileline$,"rush_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "dash" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf



If Instr(fileline$,"rushx_nbf",1) Then
stat$ = Replace(fileline$,"rushx_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "dashx" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf




If Instr(fileline$,"walk_nbf",1) Then
stat$ = Replace(fileline$,"walk_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "walk" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf


If Instr(fileline$,"static_nbf",1) Then
stat$ = Replace(fileline$,"static_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "stand" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf


If Instr(fileline$,"hurt_nbf",1) Then
stat$ = Replace(fileline$,"hurt_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "hurt" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"ghurt_nbf",1) Then
stat$ = Replace(fileline$,"ghurt_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "churt" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf




If Instr(fileline$,"intro_nbf",1) Then
stat$ = Replace(fileline$,"intro_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "intro" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf



If Instr(fileline$,"outwin_nbf",1) Then
stat$ = Replace(fileline$,"outwin_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "outro" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf

If Instr(fileline$,"spunch_nbf",1) Then
stat$ = Replace(fileline$,"spunch_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "spunch" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf


If Instr(fileline$,"wpunch_nbf",1) Then
stat$ = Replace(fileline$,"wpunch_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "wpunch" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf


If Instr(fileline$,"apunch_nbf",1) Then
stat$ = Replace(fileline$,"apunch_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "apunch" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf




If Instr(fileline$,"gpunch_nbf",1) Then
stat$ = Replace(fileline$,"gpunch_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "cpunch" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf






If Instr(fileline$,"skick_nbf",1) Then
stat$ = Replace(fileline$,"skick_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "skick" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf



If Instr(fileline$,"wkick_nbf",1) Then
stat$ = Replace(fileline$,"wkick_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "wkick" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf


If Instr(fileline$,"akick_nbf",1) Then
stat$ = Replace(fileline$,"akick_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "akick" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf


If Instr(fileline$,"gkick_nbf",1) Then
stat$ = Replace(fileline$,"gkick_nbf","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "ckick" Then
a.nof = Int(stat$)
EndIf
EndIf
Next

EndIf





'anim speeds


If Instr(fileline$,"fireb_spd",1) Then
stat$ = Replace(fileline$,"fireb_spd","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "fireb" Then
a.frate = Int(stat$)
EndIf
EndIf
Next

EndIf




If Instr(fileline$,"firebx_spd",1) Then
stat$ = Replace(fileline$,"firebx_spd","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "firebx" Then
a.frate = Int(stat$)
EndIf
EndIf
Next

EndIf



If Instr(fileline$,"fball_spd",1) Then
stat$ = Replace(fileline$,"fball_spd","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "fball" Then
a.frate = Int(stat$)
EndIf
EndIf
Next

EndIf




If Instr(fileline$,"fballx_spd",1) Then
stat$ = Replace(fileline$,"fballx_spd","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "fballx" Then
a.frate = Int(stat$)
EndIf
EndIf
Next

EndIf



If Instr(fileline$,"smove_spd",1) Then
stat$ = Replace(fileline$,"smove_spd","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "special" Then
a.frate = Int(stat$)
EndIf
EndIf
Next

EndIf



If Instr(fileline$,"smovex_spd",1) Then
stat$ = Replace(fileline$,"smovex_spd","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "specialx" Then
a.frate = Int(stat$)
EndIf
EndIf
Next

EndIf




If Instr(fileline$,"rush_spd",1) Then
stat$ = Replace(fileline$,"rush_spd","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "dash" Then
a.frate = Int(stat$)
EndIf
EndIf
Next

EndIf



If Instr(fileline$,"rushx_spd",1) Then
stat$ = Replace(fileline$,"rushx_spd","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "dashx" Then
a.frate = Int(stat$)
EndIf
EndIf
Next

EndIf




If Instr(fileline$,"walk_spd",1) Then
stat$ = Replace(fileline$,"walk_spd","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "walk" Then
a.frate = Int(stat$)
EndIf
EndIf
Next

EndIf




If Instr(fileline$,"static_spd",1) Then
stat$ = Replace(fileline$,"static_spd","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "stand" Then
a.frate = Int(stat$)
EndIf
EndIf
Next

EndIf



If Instr(fileline$,"intro_spd",1) Then
stat$ = Replace(fileline$,"intro_spd","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "intro" Then
a.frate = Int(stat$)
EndIf
EndIf
Next

EndIf


If Instr(fileline$,"outwin_spd",1) Then
stat$ = Replace(fileline$,"outwin_spd","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "outro" Then
a.frate = Int(stat$)
EndIf
EndIf
Next

EndIf


If Instr(fileline$,"spunch_spd",1) Then
stat$ = Replace(fileline$,"spunch_spd","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "spunch" Then
a.frate = Int(stat$)
EndIf
EndIf
Next

EndIf



If Instr(fileline$,"wpunch_spd",1) Then
stat$ = Replace(fileline$,"wpunch_spd","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "wpunch" Then
a.frate = Int(stat$)
EndIf
EndIf
Next

EndIf




If Instr(fileline$,"apunch_spd",1) Then
stat$ = Replace(fileline$,"apunch_spd","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "apunch" Then
a.frate = Int(stat$)
EndIf
EndIf
Next

EndIf



If Instr(fileline$,"gpunch_spd",1) Then
stat$ = Replace(fileline$,"gpunch_spd","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "cpunch" Then
a.frate = Int(stat$)
EndIf
EndIf
Next

EndIf




If Instr(fileline$,"skick_spd",1) Then
stat$ = Replace(fileline$,"skick_spd","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "skick" Then
a.frate = Int(stat$)
EndIf
EndIf
Next

EndIf



If Instr(fileline$,"wkick_spd",1) Then
stat$ = Replace(fileline$,"wkick_spd","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "wkick" Then
a.frate = Int(stat$)
EndIf
EndIf
Next

EndIf



If Instr(fileline$,"akick_spd",1) Then
stat$ = Replace(fileline$,"akick_spd","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "akick" Then
a.frate = Int(stat$)
EndIf
EndIf
Next

EndIf



If Instr(fileline$,"gkick_spd",1) Then
stat$ = Replace(fileline$,"gkick_spd","")
stat$ = Replace(stat$,"=","")
stat$ = Replace(stat$," ","")
For a:animdata = EachIn animdata_list
If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
If a.fanim$ = "ckick" Then
a.frate = Int(stat$)
EndIf
EndIf
Next

EndIf

End Function






