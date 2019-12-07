
func string Itm_GetCurrencyInstanceName()
{
	const int Itm__GetCurrencyInstanceName = 7358480; //oCItemContainer::GetCurrencyInstanceName(void)  00704810
	CALL_RetValIszString();
	CALL__cdecl(Itm__GetCurrencyInstanceName);
	return CALL_RetValAszString();
};
func int Itm_GetCurrencyInstance()
{
	const int Itm__GetCurrencyInstance = 7358976; //oCItemContainer::GetCurrencyInstance(void)00704A00
	//CALL_RetValIszString();
	CALL__cdecl(Itm__GetCurrencyInstance);
	return CALL_RetValAsInt();
};
func void ItmContainer_Draw(var C_NPC slf)
{
	//virtual void __thiscall oCItemContainer::Draw(void)     	0x007076B0
	const int ItmContainer__Draw= 7370416;
	var oCNpc npc;
	npc = Hlp_GetNpc(slf);
	var int ItmCont_ptr;
	ItmCont_ptr = MEM_InstToPtr(npc) + 1640;
	CALL__thiscall(ItmCont_ptr,ItmContainer__Draw);
};

func void InstallHook_ItmCont()
{
	const int done = false;
   if(!done) {
		HookEngineF(7357968,6, _InstallHook_ItmCont);
		HookEngineF(7358048,6, _InstallHook_ItmCont);
		done = true;
   };	
};
func void _InstallHook_ItmCont()
{
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(ESP));
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(Mem_ReadInt(ESI)));
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(Mem_ReadInt(EDI)));
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(Mem_ReadInt(EBP)));
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(Mem_ReadInt(ESP)));
	MEM_SendToSpy(zERR_TYPE_FAULT,"ХУК");
};


func int ItmContainer_GetInvMaxCols()
{
	//static short __cdecl oCItemContainer::GetInvMaxColumns(void)     	0x00704610
	const int ItmContainer__GetInvMaxColumns= 7357968;
	CALL__cdecl(ItmContainer__GetInvMaxColumns);
	return CALL_RetValAsInt();
};
func int ItmContainer_GetInvMaxRows()
{
//static short __cdecl oCItemContainer::GetInvMaxRows(void)     	0x00704660
	const int ItmContainer__GetInvMaxRows= 7358048;
	CALL__cdecl(ItmContainer__GetInvMaxRows);
	return CALL_RetValAsInt();
};

func int ItmContainer_GetSelectedItem(var C_NPC slf)	//oCItem*
{
	//virtual oCItem * __thiscall oCItemContainer::GetSelectedItem(void)   	0x007092C0
	const int ItmContainer__GetSelectedItem= 7377600;
	var oCNpc npc;
	npc = Hlp_GetNpc(slf);
	var int ItmCont_ptr;
	ItmCont_ptr = MEM_InstToPtr(npc) + 1640;
	CALL__thiscall(ItmCont_ptr,ItmContainer__GetSelectedItem);
	return CALL_RetValAsInt();
};
func void Itm_ChangeBetter(var C_NPC slf)
{
	var int itmPtr;	itmPtr = ItmContainer_GetSelectedItem(slf);		//Получаем указатель на итем в фокусе
	var ocItem itm;	itm = _^(itmPtr);		//Получаем сам итем по указателю
	if(itm.nutrition != 100)
	{
		var int itmInstance;	itmInstance = Hlp_GetInstanceID(itm);		//Получаем ID итема
		var int itmID;			itmID = MEM_GetSymbolByIndex(itmInstance);
		var zCPar_Symbol itmScriptName;
		itmScriptName = _^(itmID);	//Нашли имя итема в символьной таблице
		var string oldItmName;	oldItmName = itmScriptName.name;	//Получили имя в виде "ItMw_Sword"
		var string newItmName;	newItmName = ConcatStrings(itmScriptName.name,"_BET");	//Получаем имя оружия с окончанием _BET
		var int itmNewID; itmNewID = MEM_FindParserSymbol(newItmName);	//Ищем его ID в символьной таблице.
		Npc_RemoveInvItem(slf,itmInstance);
		CreateInvItem(slf,itmNewID);
	}else{
		Print_Ext(2,2,"Предмет уже заточен!",FONT_Screen,COL_Red,2);
	};
};
