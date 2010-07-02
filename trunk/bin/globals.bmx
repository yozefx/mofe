'setting the number of players.. only 1 vs comp for now 
Global arcadeplayer = 1
Global nopl = 1
Global senditbg = False
Global menetp,bgnum
'some menu variables
Global blnkim,grabby,bgwidth
Global blnkim2,p1typesel,p2typesel,fighterselmenu
Global webaddy$ = "start"
Global startdir$ = CurrentDir()
blnkim2 = CreateImage(160,240)
'MaskImage blnkim2,255,0,255
blnkim = CreateImage(160,240)
'MaskImage blnkim,255,0,255
Global plose = False
Global selection,offsety,menuselect,fightnum,currentbg
Global bgnumo,currentbgs$
Global tempanimo$ = "stand"
Global tempintroint,playedround,playedfightsnd,fightroint,hostfighterselmenu,p1hosttypesel,stageselmenuhost
Global buttup,buttdwn,buttleft,buttright,buttwp,buttsp,buttwk,buttsk,pselectconfmenub,stageseltext,chatmenu
Global temp_anim$,loadingnum,lodps,loadingadd,optionsmenu,displaymenu,keyconfigmenu,stageselmenu,chatsayer
Global configmenu,timermenu,roundsmenu,diffimenu,controlsmenu,pselectconfmenu,devicelistmenu
Global multiplaymenu,mhostmenu,hostmainmenu,chatmesslist,GNETSUCCESS,HOSTJOIN = 0
Global MAINGAMETIMER = 30,MAINGAMEROUNDS = 2,MAINGAMEDIFFICULTY$ = "EASY"
Global MAINGAMEDISPLAY$ = "WIN",MAINEDITPLAYER = 1,P1DEVICE$="Key:",P2DEVICE$="Key:"
Global loadamt#,elfighto,net_name$,escfunct$,p2_menufunct$,PLAYERCOUNTER=1
Global P1TYPE$ = "HUMAN",P2TYPE$ = "COMP",GAMEENGINETYPE$="Arcade",NETTEAM = 1,NETWID$

loadingnum = 660
Global P1INPUTDEV,P2INPUTDEV
Global P1FSELREADY = False,P2FSELREADY = True,PERFECT = False
Global CURRENTSTAGE
Global P1FNAME$,P2FNAME$,MUSICCHANNEL,BGMUSIC
Global ENGINESTATUS$,CURRENTRND,CURRENTCLOCK,ENGINESCALE#,SPLSHRNDPHASE,TEMPSCALE#,p1vicss=0,p2vicss=0
Global SPECIALMOVEACTIVE = False
Global INOUTRND:TTimer = CreateTimer(30)
Global SPLSHRNDSTART,SPLSHRNDFINISH,SLPSHSCALE#,SPLSHTIME,SPLSHCURTIME,ENGINEROTATION
Global SPECIALFRAME,SPECFX,SPECFY,SLOMO,SPLSHOUT,WINNER:player,P1ETYPE,P2ETYPE,ENGINEOFFSET#,ISOFFSET = False
Global NETIDX$,GAMENAME$,NETUSER$,NETPASS$,NETENCTPASS$,GETKEYCHAR$,GETKEYCHROPT,NETHOSTIP$,STAGENAME$,CHATSAYTEXT$
Global OLDMAXL = 0,OLDMAXR = 640
'Global PXMAXXL,PXMAXXR
'im gonna be doing a key config soon so this might change.. 
'but For now i have the Default buttons set as this
buttup = VKeyDown(200)
buttdwn = VKeyDown(208)
buttleft = VKeyDown(203)
buttright = VKeyDown(205)
buttwp = VKeyDown(30)
buttsp = VKeyDown(31)
buttwk = VKeyDown(44)
buttsk = VKeyDown(45)
'some variables for the actual fight
Global intro,round,outro,playedend
'variable for the energy type the player can select
Global etype
'im making an array for the various animation frames i will be
'using in the game

'im this variable isnt being used because i recently rewrote it.
Const FPS=1000
'this is the default game timer value and variable
Global gtimer = 60
'just setting the game timer to be on
Global bgtimer = True
'i havent implemented the difficulty quite yet..but i have it here
'anyways for when i do add it in
Global gdifficulty = 0
'this is for the key config.. you can set the controls to keyboard or joystick
'havent implemented it yet..default is keyboard.
Global controltype,controltypes$
'yet another var for difficulty.. although this var IS being used
'in the options menu
Global gdifficultys$ = "Easy"
'a variable for my command line option -debug
'a can add that so when the game loads it shows all my debug info
Global maindebug = False
'this is for scrolling the background during the fight.. i havent got this far yet.. as i was more concerned
'with getting the animations to work right. I'll be using this later on
Global scrollitx,scrollity
'just a variable to tell the program if the fight ended
Global gameend = False
'im using this variable to store your ip in and display it. so you can tell other people your IP
'to connect and play
Global hipaddy$
'i think im using this varible for joining or hosting a game. 
Global jnetgame
'heh this is your net name
Global yournetname$
' a variable for controlling FPS in the options menu.. under game speed.
Global selnfps = 19
'this is another var for displaying game speed as a 0-20 speed setting 0 being slow and 20 being fast
Global gspeed
'this variable i just added so i can stop the game and display that special move powerup effect before
'executing the power move.
Global specialo = False

Global animations$[33]
Global etypes$[4,4]

animations$[0] = "stand"
animations$[1] = "walk"
animations$[2] = "crouch"
animations$[3] = "jump"
animations$[4] = "block"
animations$[5] = "cblock"
animations$[6] = "hurt"
animations$[7] = "churt"
animations$[8] = "intro"
animations$[9] = "lose"
animations$[10] = "outro"
animations$[11] = "taunt"
animations$[12] = "pthrow"
animations$[13] = "kthrow"
animations$[14] = "wpunch"
animations$[15] = "spunch"
animations$[16] = "wkick"
animations$[17] = "skick"
animations$[18] = "apunch"
animations$[19] = "cpunch"
animations$[20] = "akick"
animations$[21] = "ckick"
animations$[22] = "fireb"
animations$[23] = "fball"
animations$[24] = "firebx"
animations$[25] = "fballx"
animations$[26] = "dash"
animations$[27] = "dashx"
animations$[28] = "special"
animations$[29] = "specialx"
animations$[30] = "fatal"
animations$[31] = "powerup"
animations$[32] = "maxpow"


etypes$[0,0] = "Type M: Gain Energy by Charging"
etypes$[0,1] = "to charge energy press and hold"
etypes$[0,2] = "down + weak punch + weak kick"
etypes$[0,3] = "and your energy gauge will slowly fill."

etypes$[1,0] = "Type O: Gain Energy by Getting hit"
etypes$[1,1] = "When getting hit or blocking a"
etypes$[1,2] = "hit your energy will charge up."
etypes$[1,3] = "You gain less energy when you block."

etypes$[2,0] = "Type F: Gain Energy by Attacking"
etypes$[2,1] = "Using your techniques that"
etypes$[2,2] = "don't require energy charge up your"
etypes$[2,3] = "bar much faster than just regular attacks."

etypes$[3,0] = "Type E: No Energy Except when"
etypes$[3,1] = "your lifebar is critical. at that"
etypes$[3,2] = "point you have infinite energy"
etypes$[3,3] = "to use as many spec moves as you want."

' uh ya... i think these are temp debug vars
Global fuckx,fucky,fuckcolx,fuckcoly



Global menufunct$

Global P1UPHELD
Global P1DNHELD
Global P1LFHELD
Global P1RTHELD

Global P2UPHELD
Global P2DNHELD
Global P2LFHELD
Global P2RTHELD

'setting up default keys
Global P1KEYUP = KEY_UP
Global P1KEYDN = KEY_DOWN
Global P1KEYLF = KEY_LEFT
Global P1KEYRT = KEY_RIGHT
Global P1KEYWP = KEY_ENTER
Global P1KEYSP = KEY_RSHIFT
Global P1KEYWK = KEY_RCONTROL
Global P1KEYSK = KEY_BACKSLASH
Global P1KEYST = KEY_ENTER


Global P2KEYUP = KEY_W
Global P2KEYDN = KEY_Z
Global P2KEYLF = KEY_A
Global P2KEYRT = KEY_S
Global P2KEYWP = KEY_E
Global P2KEYSP = KEY_R
Global P2KEYWK = KEY_D
Global P2KEYSK = KEY_F
Global P2KEYST = KEY_E




'gnet globals
Global HOSTX:TGNetHost = CreateGNetHost()

Global PORTX = 1234 ' users would normally choose one allowed through their firewall
'Local address$ = "127.0.0.1"' loopback IP address for testing host & client on same machine
Global timeout_ms = 10000 ' client has 10 seconds to connect to host

' initialize host or client

'If hosting Then
'	success = GNetListen( host, port )
'	If Not success Then RuntimeError "GNetListen failed"
'Else
'	success = GNetConnect( host, address$, port, timeout_ms )
'	If Not success Then RuntimeError "GNetConnect failed"
'EndIf

' create local and remote GNet objects
Global localObj:TGNetObject = CreateGNetObject:TGNetObject( HOSTX )
Global messageObj:TGNetObject' = CreateGNetObject:TGNetObject( HOST )
Global remotemessage:TGNetObject
Global remoteObj:TGNetObject
Global messList:TList = New TList
Global objList:TList = New TList ' list of received, remote objects

'next is networking object consts so nothing gets sent to the wrong index in an object.

Const NETPX = 0
Const NETPY = 1
Const NETPTEAM = 2
Const NETTLIFE = 3
Const NETMLIFE = 4
Const NETTMLIFE = 5
Const NETPLIFE = 6
Const NETPANIMB = 7
Const NETENERGY = 8
Const NETFRAME = 9
Const NETFID = 10
Const NETFITNUM = 11
Const NETFNAME = 12
Const NETFANIM = 13
Const NETDIR = 14
Const NETFSTATUS = 15
Const NETJTYPE = 16
Const NETHURT = 17
Const NETDTAKEN = 18
Const NETFTAKEN = 19
Const NETJHEIGHT = 20
Const NETJUP = 21
Const NETDASH = 22
Const NETGETBGS = 23
Const NETLOST = 24
Const NETFMODE = 25
Const NETHALIGN = 26
Const NETETYPE = 27
Const NETPREADY = 28
Const NETNAME = 29
Const NETID = 30
Const NETFIGHTLOADED = 31