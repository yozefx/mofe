	format	MS COFF
	extrn	___bb_appstub_appstub
	extrn	___bb_audio_audio
	extrn	___bb_bank_bank
	extrn	___bb_bankstream_bankstream
	extrn	___bb_basic_basic
	extrn	___bb_blitz_blitz
	extrn	___bb_bmploader_bmploader
	extrn	___bb_d3d7max2d_d3d7max2d
	extrn	___bb_d3d9max2d_d3d9max2d
	extrn	___bb_data_data
	extrn	___bb_directsoundaudio_directsoundaudio
	extrn	___bb_eventqueue_eventqueue
	extrn	___bb_freeaudioaudio_freeaudioaudio
	extrn	___bb_freejoy_freejoy
	extrn	___bb_freeprocess_freeprocess
	extrn	___bb_freetypefont_freetypefont
	extrn	___bb_glew_glew
	extrn	___bb_gnet_gnet
	extrn	___bb_jpgloader_jpgloader
	extrn	___bb_macos_macos
	extrn	___bb_map_map
	extrn	___bb_mappy_mappy
	extrn	___bb_maxlua_maxlua
	extrn	___bb_maxml_maxml
	extrn	___bb_maxutil_maxutil
	extrn	___bb_oggloader_oggloader
	extrn	___bb_openalaudio_openalaudio
	extrn	___bb_pngloader_pngloader
	extrn	___bb_retro_retro
	extrn	___bb_tgaloader_tgaloader
	extrn	___bb_threads_threads
	extrn	___bb_timer_timer
	extrn	___bb_wavloader_wavloader
	extrn	_bbEmptyString
	extrn	_bbGCFree
	extrn	_bbHandleFromObject
	extrn	_bbNullObject
	extrn	_bbObjectClass
	extrn	_bbObjectCompare
	extrn	_bbObjectCtor
	extrn	_bbObjectDowncast
	extrn	_bbObjectFree
	extrn	_bbObjectRegisterType
	extrn	_bbObjectReserved
	extrn	_bbObjectSendMessage
	extrn	_bbObjectToString
	extrn	_bbOnDebugEnterScope
	extrn	_bbOnDebugEnterStm
	extrn	_bbOnDebugLeaveScope
	extrn	_brl_blitz_NullObjectError
	extrn	_brl_stream_ReadInt
	extrn	_brl_stream_ReadString
	public	___bb_bin_bbtype
	public	__bb_TBBType_Add
	public	__bb_TBBType_Delete
	public	__bb_TBBType_InsertAfter
	public	__bb_TBBType_InsertBefore
	public	__bb_TBBType_New
	public	__bb_TBBType_Remove
	public	_bb_DeleteEach
	public	_bb_DeleteFirst
	public	_bb_DeleteLast
	public	_bb_HandleFromObject
	public	_bb_HandleToObject
	public	_bb_ReadStringa
	public	_bb_TBBType
	section	"code" code
___bb_bin_bbtype:
	push	ebp
	mov	ebp,esp
	push	ebx
	cmp	dword [_80],0
	je	_81
	mov	eax,0
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
_81:
	mov	dword [_80],1
	push	ebp
	push	_78
	call	dword [_bbOnDebugEnterScope]
	add	esp,8
	call	___bb_blitz_blitz
	call	___bb_appstub_appstub
	call	___bb_audio_audio
	call	___bb_bank_bank
	call	___bb_bankstream_bankstream
	call	___bb_basic_basic
	call	___bb_bmploader_bmploader
	call	___bb_d3d7max2d_d3d7max2d
	call	___bb_d3d9max2d_d3d9max2d
	call	___bb_data_data
	call	___bb_directsoundaudio_directsoundaudio
	call	___bb_eventqueue_eventqueue
	call	___bb_freeaudioaudio_freeaudioaudio
	call	___bb_freetypefont_freetypefont
	call	___bb_gnet_gnet
	call	___bb_jpgloader_jpgloader
	call	___bb_map_map
	call	___bb_maxlua_maxlua
	call	___bb_maxutil_maxutil
	call	___bb_oggloader_oggloader
	call	___bb_openalaudio_openalaudio
	call	___bb_pngloader_pngloader
	call	___bb_retro_retro
	call	___bb_tgaloader_tgaloader
	call	___bb_threads_threads
	call	___bb_timer_timer
	call	___bb_wavloader_wavloader
	call	___bb_freejoy_freejoy
	call	___bb_freeprocess_freeprocess
	call	___bb_glew_glew
	call	___bb_macos_macos
	call	___bb_mappy_mappy
	call	___bb_maxml_maxml
	push	_bb_TBBType
	call	_bbObjectRegisterType
	add	esp,4
	mov	ebx,0
	jmp	_37
_37:
	call	dword [_bbOnDebugLeaveScope]
	mov	eax,ebx
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
__bb_TBBType_New:
	push	ebp
	mov	ebp,esp
	sub	esp,4
	push	ebx
	mov	eax,dword [ebp+8]
	mov	dword [ebp-4],eax
	push	ebp
	push	_84
	call	dword [_bbOnDebugEnterScope]
	add	esp,8
	push	dword [ebp-4]
	call	_bbObjectCtor
	add	esp,4
	mov	eax,dword [ebp-4]
	mov	dword [eax],_bb_TBBType
	mov	edx,_bbNullObject
	inc	dword [edx+4]
	mov	eax,dword [ebp-4]
	mov	dword [eax+8],edx
	mov	edx,_bbNullObject
	inc	dword [edx+4]
	mov	eax,dword [ebp-4]
	mov	dword [eax+12],edx
	mov	ebx,0
	jmp	_40
_40:
	call	dword [_bbOnDebugLeaveScope]
	mov	eax,ebx
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
__bb_TBBType_Delete:
	push	ebp
	mov	ebp,esp
	push	ebx
	mov	ebx,dword [ebp+8]
_43:
	mov	eax,dword [ebx+12]
	dec	dword [eax+4]
	jnz	_89
	push	eax
	call	_bbGCFree
	add	esp,4
_89:
	mov	eax,dword [ebx+8]
	dec	dword [eax+4]
	jnz	_91
	push	eax
	call	_bbGCFree
	add	esp,4
_91:
	mov	eax,0
	jmp	_87
_87:
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
__bb_TBBType_Add:
	push	ebp
	mov	ebp,esp
	sub	esp,8
	push	ebx
	push	esi
	mov	eax,dword [ebp+8]
	mov	dword [ebp-4],eax
	mov	eax,dword [ebp+12]
	mov	dword [ebp-8],eax
	push	ebp
	push	_113
	call	dword [_bbOnDebugEnterScope]
	add	esp,8
	push	_92
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	mov	esi,dword [ebp-4]
	cmp	esi,_bbNullObject
	jne	_95
	call	_brl_blitz_NullObjectError
_95:
	mov	ebx,dword [ebp-8]
	inc	dword [ebx+4]
	mov	eax,dword [esi+8]
	dec	dword [eax+4]
	jnz	_100
	push	eax
	call	_bbGCFree
	add	esp,4
_100:
	mov	dword [esi+8],ebx
	push	_101
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	mov	ebx,dword [ebp-4]
	cmp	ebx,_bbNullObject
	jne	_103
	call	_brl_blitz_NullObjectError
_103:
	mov	esi,dword [ebp-4]
	cmp	esi,_bbNullObject
	jne	_106
	call	_brl_blitz_NullObjectError
_106:
	mov	esi,dword [esi+8]
	cmp	esi,_bbNullObject
	jne	_108
	call	_brl_blitz_NullObjectError
_108:
	push	dword [ebp-4]
	push	esi
	mov	eax,dword [esi]
	call	dword [eax+68]
	add	esp,8
	inc	dword [eax+4]
	mov	esi,eax
	mov	eax,dword [ebx+12]
	dec	dword [eax+4]
	jnz	_112
	push	eax
	call	_bbGCFree
	add	esp,4
_112:
	mov	dword [ebx+12],esi
	mov	ebx,0
	jmp	_47
_47:
	call	dword [_bbOnDebugLeaveScope]
	mov	eax,ebx
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
__bb_TBBType_InsertBefore:
	push	ebp
	mov	ebp,esp
	sub	esp,8
	push	ebx
	push	esi
	push	edi
	mov	eax,dword [ebp+8]
	mov	dword [ebp-4],eax
	mov	eax,dword [ebp+12]
	mov	dword [ebp-8],eax
	mov	eax,ebp
	push	eax
	push	_134
	call	dword [_bbOnDebugEnterScope]
	add	esp,8
	push	_115
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	mov	ebx,dword [ebp-4]
	cmp	ebx,_bbNullObject
	jne	_117
	call	_brl_blitz_NullObjectError
_117:
	mov	ebx,dword [ebx+12]
	cmp	ebx,_bbNullObject
	jne	_119
	call	_brl_blitz_NullObjectError
_119:
	push	ebx
	mov	eax,dword [ebx]
	call	dword [eax+60]
	add	esp,4
	push	_120
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	mov	ebx,dword [ebp-4]
	cmp	ebx,_bbNullObject
	jne	_122
	call	_brl_blitz_NullObjectError
_122:
	mov	edi,ebx
	mov	ebx,dword [ebp-4]
	cmp	ebx,_bbNullObject
	jne	_125
	call	_brl_blitz_NullObjectError
_125:
	mov	esi,dword [ebx+8]
	cmp	esi,_bbNullObject
	jne	_127
	call	_brl_blitz_NullObjectError
_127:
	mov	ebx,dword [ebp-8]
	cmp	ebx,_bbNullObject
	jne	_129
	call	_brl_blitz_NullObjectError
_129:
	push	dword [ebx+12]
	push	dword [ebp-4]
	push	esi
	mov	eax,dword [esi]
	call	dword [eax+96]
	add	esp,12
	mov	ebx,eax
	inc	dword [ebx+4]
	mov	eax,dword [edi+12]
	dec	dword [eax+4]
	jnz	_133
	push	eax
	call	_bbGCFree
	add	esp,4
_133:
	mov	dword [edi+12],ebx
	mov	ebx,0
	jmp	_51
_51:
	call	dword [_bbOnDebugLeaveScope]
	mov	eax,ebx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
__bb_TBBType_InsertAfter:
	push	ebp
	mov	ebp,esp
	sub	esp,8
	push	ebx
	push	esi
	push	edi
	mov	eax,dword [ebp+8]
	mov	dword [ebp-4],eax
	mov	eax,dword [ebp+12]
	mov	dword [ebp-8],eax
	mov	eax,ebp
	push	eax
	push	_154
	call	dword [_bbOnDebugEnterScope]
	add	esp,8
	push	_135
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	mov	ebx,dword [ebp-4]
	cmp	ebx,_bbNullObject
	jne	_137
	call	_brl_blitz_NullObjectError
_137:
	mov	ebx,dword [ebx+12]
	cmp	ebx,_bbNullObject
	jne	_139
	call	_brl_blitz_NullObjectError
_139:
	push	ebx
	mov	eax,dword [ebx]
	call	dword [eax+60]
	add	esp,4
	push	_140
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	mov	ebx,dword [ebp-4]
	cmp	ebx,_bbNullObject
	jne	_142
	call	_brl_blitz_NullObjectError
_142:
	mov	edi,ebx
	mov	ebx,dword [ebp-4]
	cmp	ebx,_bbNullObject
	jne	_145
	call	_brl_blitz_NullObjectError
_145:
	mov	esi,dword [ebx+8]
	cmp	esi,_bbNullObject
	jne	_147
	call	_brl_blitz_NullObjectError
_147:
	mov	ebx,dword [ebp-8]
	cmp	ebx,_bbNullObject
	jne	_149
	call	_brl_blitz_NullObjectError
_149:
	push	dword [ebx+12]
	push	dword [ebp-4]
	push	esi
	mov	eax,dword [esi]
	call	dword [eax+100]
	add	esp,12
	mov	ebx,eax
	inc	dword [ebx+4]
	mov	eax,dword [edi+12]
	dec	dword [eax+4]
	jnz	_153
	push	eax
	call	_bbGCFree
	add	esp,4
_153:
	mov	dword [edi+12],ebx
	mov	ebx,0
	jmp	_55
_55:
	call	dword [_bbOnDebugLeaveScope]
	mov	eax,ebx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
__bb_TBBType_Remove:
	push	ebp
	mov	ebp,esp
	sub	esp,4
	push	ebx
	mov	eax,dword [ebp+8]
	mov	dword [ebp-4],eax
	push	ebp
	push	_160
	call	dword [_bbOnDebugEnterScope]
	add	esp,8
	push	_155
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	mov	ebx,dword [ebp-4]
	cmp	ebx,_bbNullObject
	jne	_157
	call	_brl_blitz_NullObjectError
_157:
	mov	ebx,dword [ebx+8]
	cmp	ebx,_bbNullObject
	jne	_159
	call	_brl_blitz_NullObjectError
_159:
	push	dword [ebp-4]
	push	ebx
	mov	eax,dword [ebx]
	call	dword [eax+116]
	add	esp,8
	mov	ebx,0
	jmp	_58
_58:
	call	dword [_bbOnDebugLeaveScope]
	mov	eax,ebx
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
_bb_DeleteLast:
	push	ebp
	mov	ebp,esp
	sub	esp,4
	push	ebx
	mov	eax,dword [ebp+8]
	mov	dword [ebp-4],eax
	push	ebp
	push	_170
	call	dword [_bbOnDebugEnterScope]
	add	esp,8
	push	_161
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	cmp	dword [ebp-4],_bbNullObject
	je	_162
	push	_163
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	mov	ebx,dword [ebp-4]
	cmp	ebx,_bbNullObject
	jne	_165
	call	_brl_blitz_NullObjectError
_165:
	mov	ebx,dword [ebx+8]
	cmp	ebx,_bbNullObject
	jne	_167
	call	_brl_blitz_NullObjectError
_167:
	push	_bb_TBBType
	push	ebx
	mov	eax,dword [ebx]
	call	dword [eax+76]
	add	esp,4
	push	eax
	call	_bbObjectDowncast
	add	esp,8
	mov	ebx,eax
	cmp	ebx,_bbNullObject
	jne	_169
	call	_brl_blitz_NullObjectError
_169:
	push	ebx
	mov	eax,dword [ebx]
	call	dword [eax+60]
	add	esp,4
_162:
	mov	ebx,0
	jmp	_61
_61:
	call	dword [_bbOnDebugLeaveScope]
	mov	eax,ebx
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
_bb_DeleteFirst:
	push	ebp
	mov	ebp,esp
	sub	esp,4
	push	ebx
	mov	eax,dword [ebp+8]
	mov	dword [ebp-4],eax
	push	ebp
	push	_181
	call	dword [_bbOnDebugEnterScope]
	add	esp,8
	push	_172
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	cmp	dword [ebp-4],_bbNullObject
	je	_173
	push	_174
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	mov	ebx,dword [ebp-4]
	cmp	ebx,_bbNullObject
	jne	_176
	call	_brl_blitz_NullObjectError
_176:
	mov	ebx,dword [ebx+8]
	cmp	ebx,_bbNullObject
	jne	_178
	call	_brl_blitz_NullObjectError
_178:
	push	_bb_TBBType
	push	ebx
	mov	eax,dword [ebx]
	call	dword [eax+72]
	add	esp,4
	push	eax
	call	_bbObjectDowncast
	add	esp,8
	mov	ebx,eax
	cmp	ebx,_bbNullObject
	jne	_180
	call	_brl_blitz_NullObjectError
_180:
	push	ebx
	mov	eax,dword [ebx]
	call	dword [eax+60]
	add	esp,4
_173:
	mov	ebx,0
	jmp	_64
_64:
	call	dword [_bbOnDebugLeaveScope]
	mov	eax,ebx
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
_bb_DeleteEach:
	push	ebp
	mov	ebp,esp
	sub	esp,4
	push	ebx
	mov	eax,dword [ebp+8]
	mov	dword [ebp-4],eax
	push	ebp
	push	_190
	call	dword [_bbOnDebugEnterScope]
	add	esp,8
	push	_183
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	cmp	dword [ebp-4],_bbNullObject
	je	_184
	push	_185
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	mov	ebx,dword [ebp-4]
	cmp	ebx,_bbNullObject
	jne	_187
	call	_brl_blitz_NullObjectError
_187:
	mov	ebx,dword [ebx+8]
	cmp	ebx,_bbNullObject
	jne	_189
	call	_brl_blitz_NullObjectError
_189:
	push	ebx
	mov	eax,dword [ebx]
	call	dword [eax+52]
	add	esp,4
_184:
	mov	ebx,0
	jmp	_67
_67:
	call	dword [_bbOnDebugLeaveScope]
	mov	eax,ebx
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
_bb_ReadStringa:
	push	ebp
	mov	ebp,esp
	sub	esp,8
	push	ebx
	mov	eax,dword [ebp+8]
	mov	dword [ebp-4],eax
	mov	dword [ebp-8],0
	push	ebp
	push	_200
	call	dword [_bbOnDebugEnterScope]
	add	esp,8
	push	_192
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	mov	dword [ebp-8],0
	push	_194
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	dword [ebp-4]
	call	_brl_stream_ReadInt
	add	esp,4
	mov	dword [ebp-8],eax
	push	_195
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	mov	eax,dword [ebp-8]
	cmp	eax,0
	setg	al
	movzx	eax,al
	cmp	eax,0
	je	_196
	mov	eax,dword [ebp-8]
	cmp	eax,1048576
	setl	al
	movzx	eax,al
_196:
	cmp	eax,0
	je	_198
	push	_199
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	dword [ebp-8]
	push	dword [ebp-4]
	call	_brl_stream_ReadString
	add	esp,8
	mov	ebx,eax
	jmp	_70
_198:
	mov	ebx,_bbEmptyString
	jmp	_70
_70:
	call	dword [_bbOnDebugLeaveScope]
	mov	eax,ebx
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
_bb_HandleToObject:
	push	ebp
	mov	ebp,esp
	sub	esp,4
	push	ebx
	mov	eax,dword [ebp+8]
	mov	dword [ebp-4],eax
	push	ebp
	push	_207
	call	dword [_bbOnDebugEnterScope]
	add	esp,8
	push	_206
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	mov	ebx,dword [ebp-4]
	jmp	_73
_73:
	call	dword [_bbOnDebugLeaveScope]
	mov	eax,ebx
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
_bb_HandleFromObject:
	push	ebp
	mov	ebp,esp
	sub	esp,8
	push	ebx
	mov	eax,dword [ebp+8]
	mov	dword [ebp-4],eax
	mov	dword [ebp-8],0
	push	ebp
	push	_214
	call	dword [_bbOnDebugEnterScope]
	add	esp,8
	push	_211
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	push	dword [ebp-4]
	call	_bb_HandleToObject
	add	esp,4
	push	eax
	call	_bbHandleFromObject
	add	esp,4
	mov	dword [ebp-8],eax
	push	_213
	call	dword [_bbOnDebugEnterStm]
	add	esp,4
	mov	ebx,dword [ebp-8]
	jmp	_76
_76:
	call	dword [_bbOnDebugLeaveScope]
	mov	eax,ebx
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
	section	"data" data writeable align 8
	align	4
_80:
	dd	0
_79:
	db	"bbtype",0
	align	4
_78:
	dd	1
	dd	_79
	dd	0
_23:
	db	"TBBType",0
_24:
	db	"_list",0
_25:
	db	":brl.linkedlist.TList",0
_26:
	db	"_link",0
_27:
	db	":brl.linkedlist.TLink",0
_28:
	db	"New",0
_29:
	db	"()i",0
_30:
	db	"Delete",0
_31:
	db	"Add",0
_32:
	db	"(:brl.linkedlist.TList)i",0
_33:
	db	"InsertBefore",0
_34:
	db	"(:TBBType)i",0
_35:
	db	"InsertAfter",0
_36:
	db	"Remove",0
	align	4
_22:
	dd	2
	dd	_23
	dd	3
	dd	_24
	dd	_25
	dd	8
	dd	3
	dd	_26
	dd	_27
	dd	12
	dd	6
	dd	_28
	dd	_29
	dd	16
	dd	6
	dd	_30
	dd	_29
	dd	20
	dd	6
	dd	_31
	dd	_32
	dd	48
	dd	6
	dd	_33
	dd	_34
	dd	52
	dd	6
	dd	_35
	dd	_34
	dd	56
	dd	6
	dd	_36
	dd	_29
	dd	60
	dd	0
	align	4
_bb_TBBType:
	dd	_bbObjectClass
	dd	_bbObjectFree
	dd	_22
	dd	16
	dd	__bb_TBBType_New
	dd	__bb_TBBType_Delete
	dd	_bbObjectToString
	dd	_bbObjectCompare
	dd	_bbObjectSendMessage
	dd	_bbObjectReserved
	dd	_bbObjectReserved
	dd	_bbObjectReserved
	dd	__bb_TBBType_Add
	dd	__bb_TBBType_InsertBefore
	dd	__bb_TBBType_InsertAfter
	dd	__bb_TBBType_Remove
_85:
	db	"Self",0
_86:
	db	":TBBType",0
	align	4
_84:
	dd	1
	dd	_28
	dd	2
	dd	_85
	dd	_86
	dd	-4
	dd	0
_114:
	db	"t",0
	align	4
_113:
	dd	1
	dd	_31
	dd	2
	dd	_85
	dd	_86
	dd	-4
	dd	2
	dd	_114
	dd	_25
	dd	-8
	dd	0
_93:
	db	"C:/Documents and Settings/dv/mofe/bin/bbtype.bmx",0
	align	4
_92:
	dd	_93
	dd	9
	dd	3
	align	4
_101:
	dd	_93
	dd	10
	dd	3
	align	4
_134:
	dd	1
	dd	_33
	dd	2
	dd	_85
	dd	_86
	dd	-4
	dd	2
	dd	_114
	dd	_86
	dd	-8
	dd	0
	align	4
_115:
	dd	_93
	dd	14
	dd	3
	align	4
_120:
	dd	_93
	dd	15
	dd	3
	align	4
_154:
	dd	1
	dd	_35
	dd	2
	dd	_85
	dd	_86
	dd	-4
	dd	2
	dd	_114
	dd	_86
	dd	-8
	dd	0
	align	4
_135:
	dd	_93
	dd	19
	dd	3
	align	4
_140:
	dd	_93
	dd	20
	dd	3
	align	4
_160:
	dd	1
	dd	_36
	dd	2
	dd	_85
	dd	_86
	dd	-4
	dd	0
	align	4
_155:
	dd	_93
	dd	24
	dd	3
_171:
	db	"DeleteLast",0
	align	4
_170:
	dd	1
	dd	_171
	dd	2
	dd	_114
	dd	_86
	dd	-4
	dd	0
	align	4
_161:
	dd	_93
	dd	30
	dd	2
	align	4
_163:
	dd	_93
	dd	30
	dd	7
_182:
	db	"DeleteFirst",0
	align	4
_181:
	dd	1
	dd	_182
	dd	2
	dd	_114
	dd	_86
	dd	-4
	dd	0
	align	4
_172:
	dd	_93
	dd	34
	dd	2
	align	4
_174:
	dd	_93
	dd	34
	dd	7
_191:
	db	"DeleteEach",0
	align	4
_190:
	dd	1
	dd	_191
	dd	2
	dd	_114
	dd	_86
	dd	-4
	dd	0
	align	4
_183:
	dd	_93
	dd	38
	dd	2
	align	4
_185:
	dd	_93
	dd	38
	dd	7
_201:
	db	"ReadStringa",0
_202:
	db	"in",0
_203:
	db	":brl.stream.TStream",0
_204:
	db	"length",0
_205:
	db	"i",0
	align	4
_200:
	dd	1
	dd	_201
	dd	2
	dd	_202
	dd	_203
	dd	-4
	dd	2
	dd	_204
	dd	_205
	dd	-8
	dd	0
	align	4
_192:
	dd	_93
	dd	42
	dd	2
	align	4
_194:
	dd	_93
	dd	43
	dd	2
	align	4
_195:
	dd	_93
	dd	44
	dd	2
	align	4
_199:
	dd	_93
	dd	44
	dd	35
_208:
	db	"HandleToObject",0
_209:
	db	"obj",0
_210:
	db	":Object",0
	align	4
_207:
	dd	1
	dd	_208
	dd	2
	dd	_209
	dd	_210
	dd	-4
	dd	0
	align	4
_206:
	dd	_93
	dd	48
	dd	2
_215:
	db	"HandleFromObject",0
_216:
	db	"h",0
	align	4
_214:
	dd	1
	dd	_215
	dd	2
	dd	_209
	dd	_210
	dd	-4
	dd	2
	dd	_216
	dd	_205
	dd	-8
	dd	0
	align	4
_211:
	dd	_93
	dd	52
	dd	2
	align	4
_213:
	dd	_93
	dd	53
	dd	2
