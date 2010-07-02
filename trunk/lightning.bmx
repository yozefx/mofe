Graphics 640,480,0,60
'SetBuffer BackBuffer()
SetBlend(ALPHABLEND)
SeedRnd MilliSecs()
t=CreateTimer(60)
SetMaskColor(0,0,0)
Global flare = LoadImage("sun.png",MASKEDIMAGE)
SetImageHandle( flare,ImageWidth(flare)/2,ImageHeight(flare)/2 )
While KeyHit(1)=0
   Cls

   If KeyHit(49) Then t2=0	'N Next
   If t2=0
      t2=200
      Ax=Rand(19,619)'anfang
      Bx=Rand(19,619)'-"-
      Ay=Rand(19,459)'ende
      By=Rand(19,459)'..
   EndIf
   t2=t2-1
   SetBlend(ALPHABLEND)
   SetColor 50,50,50
   DrawRect 0,0,640,480
   SetBlend(LIGHTBLEND)
   blitzmalen(Ax,Ay,Bx,By)
SetBlend(ALPHABLEND)
   While KeyDown(57)
   Wend	'space -pause
   WaitTimer(t)
   Flip

Wend


End

Function blitzmalen(vonX,vonY,zuX,zuY)
   'Color 90,90,255
   Local wurz#,steps#,size#,verX#,verY#	''steps'-mal (diagonal) um 'size' veränd. um zu B zu kommen.
   Local abstX,abstY,x#,y#	'der abstand zwischen Ax und Bx
   Local r,winkel2
   Local blitzteil=16

   abstX=zuX-vonX
   abstY=zuY-vonY
   wurz=Sqr(abstX^2+abstY^2) 
   size=blitzteil+(wurz Mod blitzteil) 
   steps=wurz/size
   verX=abstX/steps 
   verY=abstY/steps	'verX/Y=welche veränderung auf der x&y-achse um diagonal
										'(ca.)12-{<24} pixel näher zu B zu kommen.

   x=vonX+verX
   y=vonY+verY
   xx1=vonX
   yy1=vonY
   xx2=x
   yy2=y
   For i=0 To Floor(steps)-1

      r=Rand(size)
      winkel2=Rand(359)
      xx2=xx2+Cos(winkel2)*r 
      yy2=yy2+Sin(winkel2)*r

      If (i+2)>steps Then 
      xx2=zuX 
	  yy2=zuY
	  EndIf
      BlitzLine (xx1,yy1,xx2,yy2)

      xx1=xx2
      yy1=yy2
      x=x+verX
      xx2=x
      y=y+verY
      yy2=y
   Next

   SetColor 127,127,127
   DrawOval vonX-4,vonY-4,9,9
   DrawOval zuX-4,zuY-4,9,9

End Function

Function BlitzLine(mlx,mly,mlx2,mly2)

   SetColor 90,90,255
SetAlpha(0.2)
DrawImage flare,mlx-1,mly-1
SetAlpha(1)
   DrawLine mlx-1,mly-1,mlx2-1,mly2-1
SetAlpha(0.5)
DrawImage flare,mlx2-1,mly2-1
SetAlpha(1)
   DrawLine mlx-1,mly+1,mlx2-1,mly2+1
   DrawLine mlx+1,mly-1,mlx2+1,mly2-1
   DrawLine mlx+1,mly+1,mlx2+1,mly2+1
   SetColor 255,255,255
   DrawLine mlx,mly,mlx2,mly2

End Function
