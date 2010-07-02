Global fightered = CreateWindow( "M.O.F.E.ED X v1.0.0",GadgetWidth(Desktop())/4,GadgetHeight(Desktop())/4,500,480,Desktop(),WS_TABSTOP|WINDOW_TITLEBAR|WINDOW_MENU|WINDOW_STATUS )
Global passlock,passwordgui,passok,fnameo,fnameogui,fnameook
Const MENU_SAVE = 1420
Const MENU_LOAD = 1440
Const MENU_PASS = 1520
Const MENU_NAME = 1530
Const MENU_KOF9 = 1450
Const MENU_EXIT = 8430

fightermenu = CreateMenu("File",0,WindowMenu(fightered))
fightermenu2 = CreateMenu("Options",0,WindowMenu(fightered))
saveachar = CreateMenu("Save Fighter Data",MENU_SAVE,fightermenu)
loadachar = CreateMenu("Load Fighter Data",MENU_LOAD,fightermenu)
passchar = CreateMenu("Password Protect",MENU_PASS,fightermenu2)
fighterchar = CreateMenu("Set Fighter Name",MENU_NAME,fightermenu2)
importakof91 = CreateMenu("Import KOF91 .ini",MENU_KOF9,fightermenu)
exited = CreateMenu("Exit",MENU_EXIT,fightermenu)




UpdateWindowMenu fightered



CreateLabel("Fighter",5,1,50,20,fightered)
Global fightersel = CreateComboBox(5,25,120,20,fightered) 
For f:fighter = EachIn fighter_list
AddGadgetItem fightersel,f.fname$
Next
SelectGadgetItem fightersel,0
CreateLabel("Animation",5,50,50,20,fightered)
Global animsel = CreateComboBox(5,75,120,20,fightered) 
AddGadgetItem animsel,"stand"
AddGadgetItem animsel,"walk"
AddGadgetItem animsel,"crouch"
AddGadgetItem animsel,"jump"
AddGadgetItem animsel,"block"
AddGadgetItem animsel,"cblock"
AddGadgetItem animsel,"hurt"
AddGadgetItem animsel,"churt"
AddGadgetItem animsel,"intro"
AddGadgetItem animsel,"lose"
AddGadgetItem animsel,"outro"
AddGadgetItem animsel,"taunt"
AddGadgetItem animsel,"pthrow"
AddGadgetItem animsel,"kthrow"
AddGadgetItem animsel,"wpunch"
AddGadgetItem animsel,"spunch"
AddGadgetItem animsel,"wkick"
AddGadgetItem animsel,"skick"
AddGadgetItem animsel,"apunch"
AddGadgetItem animsel,"cpunch"
AddGadgetItem animsel,"akick"
AddGadgetItem animsel,"ckick"
AddGadgetItem animsel,"fireb"
AddGadgetItem animsel,"fball"
AddGadgetItem animsel,"firebx"
AddGadgetItem animsel,"fballx"
AddGadgetItem animsel,"dash"
AddGadgetItem animsel,"dashx"
AddGadgetItem animsel,"special"
AddGadgetItem animsel,"specialx"
AddGadgetItem animsel,"fatal"
AddGadgetItem animsel,"powerup"
AddGadgetItem animsel,"maxpow"

SelectGadgetItem animsel,0

For g:frame = EachIn frame_list
If g.fighternum = 1 Then
pwid = ImageWidth(g.fframe)
phigh = ImageHeight(g.fframe)
If pwid <= 0 Then pwid = 10
If phigh <= 0 Then pwid = 10

EndIf
Next

CreateLabel("Frame",5,100,50,20,fightered)
Global framenumlabel = CreateLabel(currentframe,26,125,15,20,fightered)
Global framedown = CreateButton("<",5,125,20,20,fightered)
Global frameup = CreateButton(">",45,125,20,20,fightered)

CreateLabel("Hitx",5,150,20,20,fightered)

Global hitxgui=CreateTextField(40,150,50,20,fightered)

CreateLabel("Hity",5,175,20,20,fightered)

Global hitygui=CreateTextField(40,175,50,20,fightered)

CreateLabel("Dmx",5,200,25,20,fightered)

Global damxgui=CreateTextField(40,200,50,20,fightered)

CreateLabel("Dmy",5,225,25,20,fightered)

Global damygui=CreateTextField(40,225,50,20,fightered)

CreateLabel("Nof",5,250,20,20,fightered)

Global nofgui=CreateTextField(40,250,50,20,fightered)

CreateLabel("Hfm",5,275,20,20,fightered)

Global hfmgui=CreateTextField(40,275,50,20,fightered)

CreateLabel("Frate",5,300,25,20,fightered)

Global frtgui=CreateTextField(40,300,50,20,fightered)


CreateLabel("Halgn",5,325,25,20,fightered)

Global halign=CreateTextField(40,325,50,20,fightered)

'stat allocation
CreateLabel("Stat Allocation",200,0,125,20,fightered)
Global statpointsgui = CreateLabel("Stat Points: 20",200,25,125,20,fightered)

CreateLabel("Vital:",200,50,55,20,fightered)
CreateLabel("Defend:",200,75,55,20,fightered)
CreateLabel("Power:",200,100,55,20,fightered)
CreateLabel("Speed:",200,125,55,20,fightered)
CreateLabel("Will:",200,150,55,20,fightered)
CreateLabel("Spirit:",200,175,55,20,fightered)


Global vitnumlabel = CreateLabel("0",290,50,15,20,fightered)
Global vitdown = CreateButton("<",260,50,20,20,fightered)
Global vitup = CreateButton(">",320,50,20,20,fightered)

Global defnumlabel = CreateLabel("0",290,75,15,20,fightered)
Global defdown = CreateButton("<",260,75,20,20,fightered)
Global defup = CreateButton(">",320,75,20,20,fightered)

Global pownumlabel = CreateLabel("0",290,100,15,20,fightered)
Global powdown = CreateButton("<",260,100,20,20,fightered)
Global powup = CreateButton(">",320,100,20,20,fightered)

Global spdnumlabel = CreateLabel("0",290,125,15,20,fightered)
Global spddown = CreateButton("<",260,125,20,20,fightered)
Global spdup = CreateButton(">",320,125,20,20,fightered)

Global willnumlabel = CreateLabel("0",290,150,15,20,fightered)
Global willdown = CreateButton("<",260,150,20,20,fightered)
Global willup = CreateButton(">",320,150,20,20,fightered)

Global sprnumlabel = CreateLabel("0",290,175,15,20,fightered)
Global sprdown = CreateButton("<",260,175,20,20,fightered)
Global sprup = CreateButton(">",320,175,20,20,fightered)


CreateLabel("Moves Creation:",160,200,200,20,fightered)
CreateLabel("Down %d Up %u Forward %f",160,220,200,20,fightered)
CreateLabel("Back %b Wpunch %wp Spunch %sp",160,240,200,20,fightered)
CreateLabel("Wkick %wk Skick %sk",160,260,200,20,fightered)
CreateLabel("Moves Should be entered as following",160,280,200,20,fightered)
CreateLabel("Down Back Strong Punch",160,300,200,20,fightered)
CreateLabel("Should be entered as",160,320,200,20,fightered)
CreateLabel("%d+%b+%sp",160,340,200,20,fightered)


CreateLabel("Fireb",380,0,50,20,fightered)

Global firebgui=CreateTextField(380,25,100,20,fightered)

CreateLabel("Firebx",380,50,50,20,fightered)

Global firebxgui=CreateTextField(380,75,100,20,fightered)

CreateLabel("Dash",380,100,50,20,fightered)

Global dashgui=CreateTextField(380,125,100,20,fightered)

CreateLabel("Dashx",380,150,50,20,fightered)

Global dashxgui=CreateTextField(380,175,100,20,fightered)

CreateLabel("Spec",380,200,50,20,fightered)

Global specgui=CreateTextField(380,225,100,20,fightered)

CreateLabel("Specx",380,250,50,20,fightered)

Global specxgui=CreateTextField(380,275,100,20,fightered)

CreateLabel("Fatal",380,300,50,20,fightered)

Global fatalgui=CreateTextField(380,325,100,20,fightered)


'fighter display window
Global fdisplay = CreateWindow( "M.O.F.E.ED X v1.0.0",5,5,pwid+20,phigh+20,Desktop(),WINDOW_TITLEBAR )
Global chardisplay = CreateCanvas(0,0,pwid,phigh,fdisplay)

SetGraphics(CanvasGraphics(chardisplay))
ActivateGadget(chardisplay)