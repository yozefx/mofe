Import "bin\bbtype.bmx"
Import "bin\bbvkey.bmx"
AppTitle = "M.O.F.E.X v1.14"
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
Include "bin\loadfight.bmx"
Include "bin\enginefunctions.bmx"


'Graphics GadgetWidth(Desktop()),GadgetHeight(Desktop()),3
'setting random seed
SeedRnd (MilliSecs())
 

'setting graphics to display on backbuffer

'SetBuffer CanvasBuffer( nbg )
'we aren't gonna be using the mouse so we are gonna hide it from view
HideMouse
'i dunno why i got this in here twice.
'SeedRnd (MilliSecs()) 
'loading global variables

'this command checks for a -debug in the command line""
'deguggy$ = CommandLine$()
'if debug is true then it will display all my debug info""
'If debuggy$ = "-debug" Then maindebug = True
'here i am loading various types for the game

'including a file that loads my menu gfx as well as grabbing impact anims  

'i dont think using this variable anymore
'period=1000/FPS
'im using this var to control the speed of the game.
'Global NFPS = 1900000
'Global NFPS = 50000
'just a spacer var to control the game speed
'Global fpscd
'Global newfps = 60
'i dont think im using this var anymore either
'time=MilliSecs()-period
'loading the bg music
'bgmusic = PlayMusic("midi\menu.mid")
'ShowMouse
'Global frameTimer = CreateTimer(newfps)  



getimpacts()
getselectionfighters()
getbgs()



SetImageFont fntArialD
SetBlend(LIGHTBLEND)
SetBlend(ALPHABLEND)
Global mainmmenu = createmainmenu()

' Your main screen draw loop 
SetScale( 2,2) 

Global FPSTIMER:TTIMER = CreateTimer(40) 
While Not KeyHit(KEY_F12)
WaitTimer(FPSTIMER)
'	Repeat
'	elapsed=MilliSecs()-time
'	Until elapsed
    'how many 'frames' have elapsed	
'	ticks=elapsed/period
	'fractional remainder
'	tween#=Float(elapsed Mod period)/Float(period)
'	For k=1 To ticks
'		time=time+periodb
'	Next
' frameTimer = 0
'Repeat
' frameTimer =  frameTimer + 1
'Until  frameTimer >= NFPS
'WaitTimer(frameTimer)

Cls
' here im slowing down the game.. its really really fast on my pc.. might be slower on others though.. 
'thats why you can change the speed setting in the options.
'Repeat 
'fpscd = fpscd + 1
'Until fpscd = NFPS
'fpscd = 0
'a debug command that shows the NFPS var
'If maindebug = True Then Text 40,80, String(NFPS)
'here is where the whole game is controlled
'menufunctions(menuselect)
If ENGINESTATUS$ <> "" Then
fightingengine()
Else
If GNETSUCCESS <> 0 Then
GNetSync HOSTX
retrievemessages()
playercount()
EndIf
keyevents()
menuevents$()
getkeycharmenu()
drawmenus()
EndIf
'the net update script only runs if your online.. otherwise it wont run it
If jnetgame = 1 Or jnetgame = 2 Then
'Include "bin\updatenet.bmx"
EndIf

'FlipCanvas nbg
'If KeyDown(200) Then
'PlaySound menuselsnd
'selection = selection - 1
'If selection < 0 Then selection = 3
'DebugLog selection
'EndIf
'If KeyDown(208) Then
'PlaySound menuselsnd
'selection = selection + 1
'If selection > 3 Then selection = 0
'DebugLog selection
'EndIf
'guievents()


Flip
'RedrawGadget( nbg)
'Flip
Wend

For g:frame = EachIn frame_list
'FreeImage g.fframe
'FreeImage g.fframe2
g.Remove()
Next
For u:impctframe = EachIn impctframe_list
'FreeImage u.fframe
u.Remove()
Next
End



