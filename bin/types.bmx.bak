Global fighter_list:TList = New TList
Global fight_list:TList = New TList
Global frame_list:TList = New TList
Global animdata_list:TList = New TList
Global player_list:TList = New TList
Global bga_list:TList = New TList
Global fballa_list:TList = New TList
Global fbframe_list:TList = New TList
Global tempimpact_list:TList = New TList
Global impact_list:TList = New TList
Global impctframe_list:TList = New TList
Global collbox_list:TList = New TList
Global victory_list:TList = New TList
Global chatstring_list:TList = New TList
Global menu_list:TList=New TList
Global menuitem_list:TList=New TList
Global menufx_list:TList = New TList

Type fighter Extends TBBType
'selection screen fighter base
	Method New()
		Add(fighter_list)
	End Method

	Method After:fighter()
		Local t:TLink
		t=_link.NextLink()
		If t Return fighter(t.Value())
	End Method

	Method Before:fighter()
		Local t:TLink
		t=_link.PrevLink()
		If t Return fighter(t.Value())
	End Method


Field vit,spd,def,pow,spr,will,x,y,team,tlife,mlife,plife#,fanimating,energy,ctime,bfball,bfballa,charid$
Field fname$,spoints,fid$,fighternum,expts,ftname$,fanim$,direction,fstatus$,jtype$,dfile$,Stream,selspath$,selbpath$,netname$
Field fireb$,firebx$,dash$,dashx$,spec$,specx$,fatal$,password$,selb,sels,jumpheight,jup,dashing,spectag,getbgs


End Type


Type fight Extends TBBType
'selection screen fighter base
	Method New()
		Add(fight_list)
	End Method

	Method After:fight()
		Local t:TLink
		t=_link.NextLink()
		If t Return fight(t.Value())
	End Method

	Method Before:fight()
		Local t:TLink
		t=_link.PrevLink()
		If t Return fight(t.Value())
	End Method


Field vit,spd,def,pow,spr,will,x,y,team,tlife,mlife,tmlife,plife#,fanimating,energy,ctime,bfball,bfballa,halign
Field fname$,spoints,fid$,fighternum,expts,ftname$,fanim$,direction,fstatus$,jtype$,hurt,dtaken,tftaken#
Field fireb$,firebx$,dash$,dashx$,spec$,specx$,fatal$,password$,selb,sels,jumpheight,jup,dashing,spectag,getbgs


End Type


Type frame Extends TBBType
'Frames of fighters anims
	Method New()
		Add(frame_list)
	End Method

	Method After:frame()
		Local t:TLink
		t=_link.NextLink()
		If t Return frame(t.Value())
	End Method

	Method Before:frame()
		Local t:TLink
		t=_link.PrevLink()
		If t Return frame(t.Value())
	End Method


Field fid$,fnum,fanim$,fframe,fighternum,fframe2


End Type

Type animdata Extends TBBType
'Frames of fighters anims
	Method New()
		Add(animdata_list)
	End Method

	Method After:animdata()
		Local t:TLink
		t=_link.NextLink()
		If t Return animdata(t.Value())
	End Method

	Method Before:animdata()
		Local t:TLink
		t=_link.PrevLink()
		If t Return animdata(t.Value())
	End Method


Field fid$,nof,fanim$,fhitf,fhcolx,fhcoly,fdcolx,fdcoly,fighternum,frate,tframe,x,y,tfrate,fwidth,fheight,halign


End Type

Type player Extends TBBType
'Frames of fighters anims
	Method New()
		Add(player_list)
	End Method

	Method After:player()
		Local t:TLink
		t=_link.NextLink()
		If t Return player(t.Value())
	End Method

	Method Before:player()
		Local t:TLink
		t=_link.PrevLink()
		If t Return player(t.Value())
	End Method


Field colred,colgreen,colblue,teamnum,playernum,selectedfighter,fightername$,selx,sely,etype,Stream,pause,spoints,halign,playerObj:TGNetObject
Field playertype$,datafile$,team,direction,x,y,tx,ty,scrolly,scrollx,fmode$,introfin,movestring$,bkeydwn,mtimer,bmtimer,fid$,getbgs,fightloaded
Field descrnd,descision$,desctime,desccd,descdir,oppx,ooldx,closeup,lost,vic,winner,netid,netname$,netplayer,spectag,oldpx,char:fight


End Type

Type bga Extends TBBType
'Frames of fighters anims
	Method New()
		Add(bga_list)
	End Method

	Method After:bga()
		Local t:TLink
		t=_link.NextLink()
		If t Return bga(t.Value())
	End Method

	Method Before:bga()
		Local t:TLink
		t=_link.PrevLink()
		If t Return bga(t.Value())
	End Method


Field x,y,bg,bgnum,bgname$,sbg,sbgpath$,thumbimg,thumbgpath$,bgmusic,bgmusicpath$

End Type

Type fballa Extends TBBType
'Frames of fighters anims
	Method New()
		Add(fballa_list)
	End Method

	Method After:fballa()
		Local t:TLink
		t=_link.NextLink()
		If t Return fballa(t.Value())
	End Method

	Method Before:fballa()
		Local t:TLink
		t=_link.PrevLink()
		If t Return fballa(t.Value())
	End Method


Field x,y,colx,coly,fball,fbframe,direction,id,bcreatef,nof,fid$,frate,antime,framenum,life,hitf,team,pow,ptype$


End Type


Type fbframe Extends TBBType
'Frames of fighters anims
	Method New()
		Add(fbframe_list)
	End Method

	Method After:fbframe()
		Local t:TLink
		t=_link.NextLink()
		If t Return fbframe(t.Value())
	End Method

	Method Before:fbframe()
		Local t:TLink
		t=_link.PrevLink()
		If t Return fbframe(t.Value())
	End Method


Field fball,fball2,fnum,id

End Type


Type tempimpact Extends TBBType
'Frames of fighters anims
	Method New()
		Add(tempimpact_list)
	End Method

	Method After:tempimpact()
		Local t:TLink
		t=_link.NextLink()
		If t Return tempimpact(t.Value())
	End Method

	Method Before:tempimpact()
		Local t:TLink
		t=_link.PrevLink()
		If t Return tempimpact(t.Value())
	End Method


Field x,y,fanimating,nof,iid$,fnum,direction,shiste,frate,charframe,charx,chary


End Type

Type impact Extends TBBType
'Frames of fighters anims
	Method New()
		Add(impact_list)
	End Method

	Method After:impact()
		Local t:TLink
		t=_link.NextLink()
		If t Return impact(t.Value())
	End Method

	Method Before:impact()
		Local t:TLink
		t=_link.PrevLink()
		If t Return impact(t.Value())
	End Method


Field x,y,fanimating,nof,iid$,fnum,direction


End Type

Type impctframe Extends TBBType
'Frames of fighters anims
	Method New()
		Add(impctframe_list)
	End Method

	Method After:impctframe()
		Local t:TLink
		t=_link.NextLink()
		If t Return impctframe(t.Value())
	End Method

	Method Before:impctframe()
		Local t:TLink
		t=_link.PrevLink()
		If t Return impctframe(t.Value())
	End Method


Field fframe,fframe2,iid$,fnum


End Type

Type collbox Extends TBBType
'Frames of fighters anims
	Method New()
		Add(collbox_list)
	End Method

	Method After:collbox()
		Local t:TLink
		t=_link.NextLink()
		If t Return collbox(t.Value())
	End Method

	Method Before:collbox()
		Local t:TLink
		t=_link.PrevLink()
		If t Return collbox(t.Value())
	End Method


Field x,y,colx,coly,fid$,team,life,damage,htype$,hitflag,colimg


End Type

Type victory Extends TBBType
'Frames of fighters anims
	Method New()
		Add(victory_list)
	End Method

	Method After:victory()
		Local t:TLink
		t=_link.NextLink()
		If t Return victory(t.Value())
	End Method

	Method Before:victory()
		Local t:TLink
		t=_link.PrevLink()
		If t Return victory(t.Value())
	End Method


Field x,y,vicnum,vicim,fid$


End Type

Type chatstring Extends TBBType
'Frames of fighters anims
	Method New()
		Add(chatstring_list)
	End Method

	Method After:chatstring()
		Local t:TLink
		t=_link.NextLink()
		If t Return chatstring(t.Value())
	End Method

	Method Before:chatstring()
		Local t:TLink
		t=_link.PrevLink()
		If t Return chatstring(t.Value())
	End Method


Field x,y,message$,message2$,red,green,blue,chatid


End Type

Type menu Extends TBBType
	Method New()
		Add(menu_list)
	End Method

	Method After:menu()
		Local t:TLink
		t=_link.NextLink()
		If t Return menu(t.Value())
	End Method

	Method Before:menu()
		Local t:TLink
		t=_link.PrevLink()
		If t Return menu(t.Value())
	End Method

Field x,y,w,h,bg,bgpath$,currentind,currentind2,bp2active,maxind,selsnd,selsndpath$,bactive,mhandle,offsetx,offsety,hasimages,bim,bim2,listt,col,row
Field selimg,selimgpath$,bgsndpath$,bgsnd,allowp2,denyp1,bactivep2
Field entersndpath$,entersnd,bhidden,menufx$,fxx,fxy,fxw,fxh,menufont
Field bgchannel
End Type

Type menufxa Extends TBBType
	Method New()
		Add(menufx_list)
	End Method

	Method After:menufxa()
		Local t:TLink
		t=_link.NextLink()
		If t Return menufxa(t.Value())
	End Method

	Method Before:menufxa()
		Local t:TLink
		t=_link.PrevLink()
		If t Return menufxa(t.Value())
	End Method

Field menufx$,fxx,fxy,fxw,fxh,parent:menu
End Type


Type menuitem Extends TBBType
	Method New()
		Add(menuitem_list)
	End Method

	Method After:menuitem()
		Local t:TLink
		t=_link.NextLink()
		If t Return menuitem(t.Value())
	End Method

	Method Before:menuitem()
		Local t:TLink
		t=_link.PrevLink()
		If t Return menuitem(t.Value())
	End Method

Field index,image,imagepath$,ttext$,val1,val2,mparent,ihandle,func$,selbgimg,selbgimgpath$,bbgx,bbgy,itembgscale,itembgalpha,sscale#
End Type

