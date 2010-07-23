import brl.blitz
import brl.appstub
import brl.audio
import brl.bank
import brl.bankstream
import brl.basic
import brl.bmploader
import brl.d3d7max2d
import brl.d3d9max2d
import brl.data
import brl.directsoundaudio
import brl.eventqueue
import brl.freeaudioaudio
import brl.freetypefont
import brl.gnet
import brl.jpgloader
import brl.map
import brl.maxlua
import brl.maxutil
import brl.oggloader
import brl.openalaudio
import brl.pngloader
import brl.retro
import brl.tgaloader
import brl.threads
import brl.timer
import brl.wavloader
import pub.freejoy
import pub.freeprocess
import pub.glew
import pub.macos
import pub.maxml
TBBType^brl.blitz.Object{
._list:brl.linkedlist.TList&
._link:brl.linkedlist.TLink&
-New%()="_bb_TBBType_New"
-Delete%()="_bb_TBBType_Delete"
-Add%(t:brl.linkedlist.TList)="_bb_TBBType_Add"
-InsertBefore%(t:TBBType)="_bb_TBBType_InsertBefore"
-InsertAfter%(t:TBBType)="_bb_TBBType_InsertAfter"
-Remove%()="_bb_TBBType_Remove"
}="bb_TBBType"
DeleteLast%(t:TBBType)="bb_DeleteLast"
DeleteFirst%(t:TBBType)="bb_DeleteFirst"
DeleteEach%(t:TBBType)="bb_DeleteEach"
ReadStringa$(in:brl.stream.TStream)="bb_ReadStringa"
HandleToObject:Object(obj:Object)="bb_HandleToObject"
HandleFromObject%(obj:Object)="bb_HandleFromObject"
