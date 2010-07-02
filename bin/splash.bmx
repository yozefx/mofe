Width=GadgetWidth(Desktop())
Height=GadgetHeight(Desktop())

'SetBuffer DesktopBuffer()
'SetGraphics()
'image=CreateImage( 652,124 )
'Grab the Desktop from where the window will appear (middle)
'GrabImage image,Width/2-200,Height/2-45

Global window=CreateWindow("M.O.F.E.ED",Width/2-200,Height/2-45,652,124,Desktop(),WINDOW_TOOL)
Global canvas=CreateCanvas(0,0,652,124,window)
Global Progress=CreateProgBar(150,53,550,15,canvas)
SetGraphics(CanvasGraphics(canvas))
SetBlend(ALPHABLEND)
'load the splash image And make White the masked color
SetMaskColor(255,0,255)
Global Splash=LoadImage("Splash.png",MASKEDIMAGE)
'MaskImage Splash,255,0,255




Cls
'DrawBlock image,0,0
SetColor 255,0,0
DrawImage Splash,0,0
DrawText "fooker",0,0
Flip