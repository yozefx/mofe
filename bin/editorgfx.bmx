Function drawfighter()
'this is where we draw stuff onto the canvas
SetGraphics(CanvasGraphics(chardisplay))
SetBlend(ALPHABLEND)
Cls





For g:frame = EachIn frame_list
DebugLog SelectedGadgetItem(animsel)
'If SelectedGadgetItem(fightersel) <> -1 And SelectedGadgetItem(fightersel) <= CountGadgetItems(fightersel)
	If g.fighternum = SelectedGadgetItem(fightersel) + 1 Then
		If SelectedGadgetItem(animsel) <> -1 And SelectedGadgetItem(animsel) <= CountGadgetItems(animsel) Then
			If g.fanim$ = GadgetItemText(animsel,SelectedGadgetItem(animsel)) Then
				If g.fnum = currentframe Then
					SetGadgetShape fdisplay,GadgetX(fdisplay),GadgetY(fdisplay),GadgetWidth(chardisplay)+ImageWidth(g.fframe)+50,GadgetHeight(chardisplay)+ImageHeight(g.fframe)+50
					SetGadgetShape chardisplay,0,0,ImageWidth(g.fframe),ImageHeight(g.fframe)
					SetViewport 0,0,ImageWidth(g.fframe),ImageHeight(g.fframe)
					
					'FreeGadget chardisplay
					'chardisplay = CreateCanvas(0,0,ImageWidth(g.fframe),ImageHeight(g.fframe),fdisplay)
					'SetBuffer CanvasBuffer( chardisplay )
					tempgfx = g.fframe
					DrawImage g.fframe,0,0
					
				EndIf
			EndIf
		EndIf
	EndIf
'EndIf
Next


For a:animdata = EachIn animdata_list
	If a.fighternum = SelectedGadgetItem(fightersel) + 1 Then
	If SelectedGadgetItem(animsel) <> -1 And SelectedGadgetItem(animsel) <= CountGadgetItems(animsel) Then
		If a.fanim$ = GadgetItemText(animsel,SelectedGadgetItem(animsel)) Then
			SetAlpha(0.5)
			SetColor 255,0,0
			If tempgfx = 0 Then tempgfx = CreateImage(100,100)
			temphigh = a.fhcoly - a.fhcoly - a.fhcoly
			DrawRect 0,a.fhcoly,a.fhcolx,ImageHeight(tempgfx)-a.fhcoly
			
			SetColor 0,255,0
			DrawRect 0,a.fdcoly,a.fdcolx,ImageHeight(tempgfx)-a.fdcoly
			
			SetColor 0,0,255
			DrawRect a.halign,0,2,ImageHeight(tempgfx)
			SetColor 255,255,255
			SetAlpha(1)
			'Text 10,10,Str(SelectedGadgetItem(fightersel))+" fn:"+Str(myfrigginnum)
		EndIf
	EndIf	
	EndIf
Next

Flip
End Function
