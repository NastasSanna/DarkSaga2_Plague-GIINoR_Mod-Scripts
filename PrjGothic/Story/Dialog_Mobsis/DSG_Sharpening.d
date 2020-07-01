
var int Global_Sharpening_itmInstance;
var int Global_Sharpening_itmNumber;
//
//СКАНИРОВАНИЕ ИНВЕНТАРЯ НА ОРУЖИЕ ДЛЯ ЗАТОЧКИ
//

var int InventWeaponArray_Adr;
var int InventWeapon_Array_Adr_SWD_1H;
var int InventWeapon_Array_Adr_SWD_2H;
var int InventWeapon_Array_Adr_AXE_1H;
var int InventWeapon_Array_Adr_AXE_2H;
var int InventWeapon_Array_Adr_SWD_1H_LEN;
var int InventWeapon_Array_Adr_SWD_2H_LEN;
var int InventWeapon_Array_Adr_AXE_1H_LEN;
var int InventWeapon_Array_Adr_AXE_2H_LEN;

func int B_DSG_GetWeaponArray_ForSharp()
{
	var oCNpc her; 												
	her = Hlp_GetNpc(hero);
	var int InvItemList_ptr;
	InvItemList_ptr = her.inventory2_inventory_next;
	var zCListSort her_InvItemList;
	her_InvItemList = _^(InvItemList_ptr);
	var oCItem itm;
	var int arr_adr;
	arr_adr = MEM_ArrayCreate();
	
	//Зачищаем старый список
	if(InventWeaponArray_Adr) {
		MEM_ArrayFree(InventWeaponArray_Adr);
		InventWeaponArray_Adr = 0;
	};	
	if(InventWeapon_Array_Adr_SWD_1H){
		MEM_ArrayFree(InventWeapon_Array_Adr_SWD_1H);
		InventWeapon_Array_Adr_SWD_1H = 0;
	};
	if(InventWeapon_Array_Adr_SWD_2H){
		MEM_ArrayFree(InventWeapon_Array_Adr_SWD_2H);
		InventWeapon_Array_Adr_SWD_2H = 0;
	};
	if(InventWeapon_Array_Adr_AXE_1H){
		MEM_ArrayFree(InventWeapon_Array_Adr_AXE_1H);
		InventWeapon_Array_Adr_AXE_1H = 0;
	};
	if(InventWeapon_Array_Adr_AXE_2H){
		MEM_ArrayFree(InventWeapon_Array_Adr_AXE_2H);
		InventWeapon_Array_Adr_AXE_2H = 0;
	};
	
	while(InvItemList_ptr);
		itm = _^(her_InvItemList.data);	//Берем предмет;
		if((itm.mainflag & ITEM_KAT_NF) && !(itm.flags & ITEM_ACTIVE) && !itm.nutrition){
			MEM_ArrayInsert(arr_Adr,her_InvItemList.data);	//Заносим указатель на итем в массив.
		}else{};
		//Продолжение сканирования инвентаря
		if(her_InvItemList.next){
			InvItemList_ptr = her_InvItemList.next;
			her_InvItemList = _^(InvItemList_ptr);
		}else{
			InvItemList_ptr = 0;
		};
		//--Конец сканирования--//
	end;
	if(MEM_ArraySize(arr_Adr)){
		InventWeaponArray_Adr = arr_adr;
		return arr_adr;	//Указатель на массив с оружием.
	};
	return 0;
};


func int B_DSG_GetWeapon_Array_byFlag(var int itmFlag)
{
	//var oCNpc her; 												her = Hlp_GetNpc(hero);
	//var int InvItemList_ptr;						InvItemList_ptr = her.inventory2_inventory_next;
	//var zCListSort her_InvItemList;	her_InvItemList = _^(InvItemList_ptr);
	var oCItem itm;
	var int itm_ptr;
	var int arr_adr;											arr_adr = MEM_ArrayCreate();
	var int arr_size;
	var int InventWeaponArray_Len;		InventWeaponArray_Len = MEM_ArraySize(InventWeaponArray_Adr);
	var int x; x = 0;
	
	//Зачищаем старые списки
	if(itmFlag == ITEM_SWD)						{
		if(InventWeapon_Array_Adr_SWD_1H){
			MEM_ArrayFree(InventWeapon_Array_Adr_SWD_1H);
			InventWeapon_Array_Adr_SWD_1H = 0;
			};}
	else if(itmFlag == ITEM_2HD_SWD){
		if(InventWeapon_Array_Adr_SWD_2H){
			MEM_ArrayFree(InventWeapon_Array_Adr_SWD_2H);
			InventWeapon_Array_Adr_SWD_2H = 0;
			};}
	else if(itmFlag == ITEM_AXE)			{
		if(InventWeapon_Array_Adr_AXE_1H){
			MEM_ArrayFree(InventWeapon_Array_Adr_AXE_1H);
			InventWeapon_Array_Adr_AXE_1H = 0;
			};}
	else if(itmFlag == ITEM_2HD_AXE){
		if(InventWeapon_Array_Adr_AXE_2H){
			MEM_ArrayFree(InventWeapon_Array_Adr_AXE_2H);
			InventWeapon_Array_Adr_AXE_2H = 0;
			};};
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(InventWeaponArray_Len));
	while(InventWeaponArray_Len);
		//MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(y));
		itm_ptr = MEM_ArrayRead(InventWeaponArray_Adr,x);
		itm = _^(itm_ptr);
		if(itm.flags & itmFlag)	{
			MEM_ArrayInsert(arr_Adr,itm_ptr);	//Заносим указатель на итем в массив.
		};
		InventWeaponArray_Len -= 1;
		x += 1;
	end;
	arr_size = MEM_ArraySize(arr_Adr);
	
	if(arr_size){
		if(itmFlag == ITEM_SWD)						{InventWeapon_Array_Adr_SWD_1H = arr_adr;	InventWeapon_Array_Adr_SWD_1H_LEN = arr_size;	}
		else if(itmFlag == ITEM_2HD_SWD){InventWeapon_Array_Adr_SWD_2H = arr_adr;	InventWeapon_Array_Adr_SWD_2H_LEN = arr_size;	}
		else if(itmFlag == ITEM_AXE)			{InventWeapon_Array_Adr_AXE_1H = arr_adr;	InventWeapon_Array_Adr_AXE_1H_LEN = arr_size;	}
		else if(itmFlag == ITEM_2HD_AXE){InventWeapon_Array_Adr_AXE_2H = arr_adr;	InventWeapon_Array_Adr_AXE_2H_LEN = arr_size;	};
		return arr_adr;	///указатель на массив с оружием флага: itmFlag
	};
	return 0;
};
//Итак мы на выходе имеем 4 массива разного типа оружия.
//Теперь нам на каждый итем надо сделать строку выбора и сделать таблицу для экрана.

////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////
instance PC_Sharpening(C_Info)
{
	npc = /*PC_Hero*/G2NV_18_Vatras;
	condition = PC_Sharpening_Condition;
	information = PC_Sharpening_Info;
	permanent = TRUE;
	description = "Заточка_NEW.";
	//important = true;
};
func int PC_Sharpening_Condition()
{
	/*if(PLAYER_MOBSI_PRODUCTION == MOBSI_Sharpening)
	{
		return TRUE;
	};*/
	return TRUE;
};

func void PC_Sharpening_Info()
{
	Info_ClearChoices(PC_Sharpening);
	if(B_DSG_GetWeaponArray_ForSharp())
	{
		if(B_DSG_GetWeapon_Array_byFlag(ITEM_SWD))
		{
			Info_AddChoice(PC_Sharpening,"(1-ручные мечи)",dia_zatochka_SWD_1H);
		};
		if(B_DSG_GetWeapon_Array_byFlag(ITEM_2HD_SWD))
		{
			Info_AddChoice(PC_Sharpening,"(2-ручные мечи)",dia_zatochka_SWD_2H);
		};
		if(B_DSG_GetWeapon_Array_byFlag(ITEM_AXE))
		{
			Info_AddChoice(PC_Sharpening,"(1-ручные топоры)",dia_zatochka_AXE_1H);
		};
		if(B_DSG_GetWeapon_Array_byFlag(ITEM_2HD_AXE))
		{
			Info_AddChoice(PC_Sharpening,"(2-ручные топоры)",dia_zatochka_AXE_2H);
		};
	};
};


func void dia_zatochka_SWD_1H()
{
	var int arr_adr;
	Info_ClearChoices(PC_Sharpening);
	
	var int x; 	//счётчик
	var oCInfo info;	//Сам диалог
	var int symbIDfunc;	//Символ-индекс вызываемой функции в чойсах
	var oCInfoChoice InfoChoice;	//Сами инфо-чойсы
	var int InfoChoice_ListPtr;		//Указатель на лист с инфо-чойсом
	var zCList InfoChoice_List;		//Сам лист с инфо-чойсом
	var string funcName_str;				//Имя функции, идущей на подмену.
	
	var oCItem itm;
	var string choice_string;
	x=InventWeapon_Array_Adr_SWD_1H_LEN;
	
	while(x);
		//Получаем лист - 1,2,3,4,5.
		itm = _^(MEM_ArrayRead(InventWeapon_Array_Adr_SWD_1H,x-1));
		choice_string = ConcatStrings(IntToString(x),". ");
		choice_string = ConcatStrings(choice_string,itm.name);
		Info_Addchoice(PC_Sharpening,choice_string,dia_zatochka_dummy);
		x-=1;
	end;
	
	x=0;
	
	info = _^(MEM_InstToPtr(PC_Sharpening) - oCInfo_C_INFO_Offset );
	InfoChoice_ListPtr = info.listChoices_next;
	InfoChoice_List = _^(info.listChoices_next);
	
	while(InfoChoice_ListPtr);
		
		funcName_str="dia_zatochka_dummy_";
		funcName_str = ConcatStrings(funcName_str,IntToString(x));
		symbIDfunc = MEM_FindParserSymbol(funcName_str);
		
		InfoChoice = _^(InfoChoice_List.data);
		InfoChoice.Function = symbIDfunc;
		
		if(InfoChoice_List.next)
		{
			InfoChoice_ListPtr = InfoChoice_List.next;
			InfoChoice_List = _^(InfoChoice_ListPtr);
		}
		else
		{
			InfoChoice_ListPtr = 0;
		};
		x+=1;
	end;
	
};
func void dia_zatochka_SWD_2H(){	};
func void dia_zatochka_AXE_1H(){	};
func void dia_zatochka_AXE_2H(){	};

func void dia_zatochka_dummy_1H(){
	var ocItem itm;
	MEM_SendToSpy(zERR_TYPE_FAULT, IntToString(Global_Sharpening_itmNumber));
	itm = _^(MEM_ArrayRead(InventWeapon_Array_Adr_SWD_1H,Global_Sharpening_itmNumber));
	var int itmInstance;	itmInstance = Hlp_GetInstanceID(itm);
	
	var int itmID;	itmID = itm.instanz;
	var zCPar_Symbol itmScriptName;
	itmID = MEM_GetSymbolByIndex(itmID);
	itmScriptName = _^(itmID);
	var string oldItmName;
	oldItmName = itmScriptName.name;	//Получили имя в виде "ItMw_Sword"
	var string NewName;
	NewName = ConcatStrings(itmScriptName.name,"_BET");	//Получаем имя оружия с окончанием _BET
	var int itmNewID; itmNewID = MEM_FindParserSymbol(NewName);	//Ищем его ID в символьной таблице.
	Npc_RemoveInvItem(hero,itmInstance);
	CreateInvItem(hero,itmNewID);
	Info_ClearChoices(PC_Sharpening);
};

func int dia_zatochka_dummy(var func fnc)
{
	var int ESP;
	ESP = MEMINT_FindFrameBoundary(MEMINT_GetESP(), -1);
	ESP += MEMINT_DoStackFrameSize; 
	var int passedMySelf; passedMySelf = 0;
	var int mySelf; mySelf = MEM_GetFuncID(fnc);
	var int funcID;
	
	while(funcID != mySelf);
		var int popPos;
		popPos = MEM_ReadInt(ESP-MEMINT_DoStackPopPosOffset);
		if (passedMySelf) {	
		} 
		else if (popPos < MEM_Parser.stack_stacksize) {
			
			funcID = MEM_GetFuncIDByOffset(popPos);
			passedMySelf = (funcID == mySelf);
		};
		if (MEMINT_IsFrameBoundary(ESP)) {
			ESP += MEMINT_DoStackFrameSize;
			//MEM_SendToSpy(zERR_TYPE_FAULT, "..next");
		};
	end;
	var zCPar_Symbol function;
	function = _^(MEM_GetSymbolByIndex(funcID));
		var string str;
	str = STR_Split(function.name,"_",3);
		var int number;
	number = STR_ToInt(str);
	Global_Sharpening_itmNumber = number;
	//
		dia_zatochka_dummy_1H();
	//{};
};
func void dia_zatochka_dummy_0(){	dia_zatochka_dummy(dia_zatochka_dummy_0);};
func void dia_zatochka_dummy_1(){	dia_zatochka_dummy(dia_zatochka_dummy_1);};
func void dia_zatochka_dummy_2(){	dia_zatochka_dummy(dia_zatochka_dummy_2);};
func void dia_zatochka_dummy_3(){};func void dia_zatochka_dummy_4(){};
func void dia_zatochka_dummy_5(){};func void dia_zatochka_dummy_6(){};func void dia_zatochka_dummy_7(){};func void dia_zatochka_dummy_8(){};
func void dia_zatochka_dummy_9(){};func void dia_zatochka_dummy_10(){};func void dia_zatochka_dummy_11(){};func void dia_zatochka_dummy_12(){};
func void dia_zatochka_dummy_13(){};func void dia_zatochka_dummy_14(){};func void dia_zatochka_dummy_15(){};func void dia_zatochka_dummy_16(){};
func void dia_zatochka_dummy_17(){};func void dia_zatochka_dummy_18(){};func void dia_zatochka_dummy_19(){};func void dia_zatochka_dummy_20(){};
func void dia_zatochka_dummy_21(){};func void dia_zatochka_dummy_22(){};func void dia_zatochka_dummy_23(){};func void dia_zatochka_dummy_24(){};
	

//-----------------------------------------------------------------------------
func void InstallHook_oCInfoMan_OnChoice()
{
	//void __fastcall oCInformationManager::OnChoice(oCInfoChoice *)	0x006629A0
	const int oCInformationManager__OnChoice = 6695328;
	 const int done = false;
   if(!done) {
		HookEngineF(oCInformationManager__OnChoice, 7, _InstallHook_oCInfoMan_OnChoice);
		done = true;
   };
};
func void _InstallHook_oCInfoMan_OnChoice()
{
	var int param; //param = MEM_ReadInt(ESP-4);
	ASM_2(ASMINT_OP_movMemToEDX);
	//param = GetEDX();
	//param = MEM_ReadInt(EDX);
	//param = MEM_ReadInt(EAX);
	MEM_SendToSpy(zERR_TYPE_FAULT, IntToString(param));
	
	var oCInfoChoice choice;	choice = _^(param);
	//var int symbId;
	//if(STR_Len(choice.text) < 3)
	//{
		Global_Sharpening_itmNumber = STR_ToInt(choice.text);
		MEM_SendToSpy(zERR_TYPE_FAULT, choice.text);
		MEM_SendToSpy(zERR_TYPE_FAULT, "___");
		MEM_SendToSpy(zERR_TYPE_FAULT, IntToString(Global_Sharpening_itmNumber));
	//};
};

