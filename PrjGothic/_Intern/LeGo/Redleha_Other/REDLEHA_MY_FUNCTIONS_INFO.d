/*******************************************************\
---------------РАБОТА С ДИАЛОГАМИ (oCINFO)---------------
\*******************************************************/

var int ARR_oCInfos_ADR;				//массив далогов (объектов класса oCInfo)
var int ARR_oCInfosFunc_ADR;	//массив символ-индексов функций условий (всех dia_xxx_cond)

func void DialogManager__UpdateInfos()
{
	const int null = 0;
	//00661AA0: protected: void __fastcall oCInformationManager::CollectInfos(void)
	const int oCInformationManager__CollectInfos = 6691488;
	CALL__fastcall(MEM_InstToPtr(MEM_InformationMan),_@(null),oCInformationManager__CollectInfos);
};
func void DialogManager__UpdateChoices()
{
	const int null = 0;
	//int __fastcall oCInformationManager::CollectChoices(oCInfo *)	0x00661CD0
	const int oCInformationManager__CollectChoices = 6692048;
	CALL__fastcall(MEM_InstToPtr(MEM_InformationMan),_@(null),oCInformationManager__CollectChoices);
};

func void Dialog_DeblokAllInstances(var int YesNo)
{
	if(YesNo)	{	GLOBAL_DSG_KEY_DIALOG = TRUE;	}
	else					{	GLOBAL_DSG_KEY_DIALOG = FALSE;	};
	DialogManager__UpdateInfos();
};

func void oCInfo_AddChoice(var oCInfo info,var string addTopic,var int nr/*var string funcName*/)	//NOT WORK
{
	//info.listChoices_data;
	//void __thiscall oCInfo::AddChoice(zSTRING int)  	0x00703B20 = 7355168
	var zString zStr;
	zStr = _^(_@s(addTopic));
	CALL_IntParam(nr);
	CALL_PtrParam(MEM_InstToPtr(zStr));
	CALL__thiscall(MEM_InstToPtr(info),7355168);
};

func int Info_GetInformation(var int firstNpc, var int secondNpc, var int important)
{
	//oCInfo * __thiscall oCInfoManager::GetInformation(oCNpc * oCNpc * int) 	0x007027B0
	const int oCInfoManager__GetInformation = 7350192;
	var oCNpc first; var oCNpc second;
	first = Hlp_GetNpc(firstNpc);
	second = Hlp_GetNpc(secondNpc);
	CALL_IntParam(important);
	CALL_PtrParam(MEM_InstToPtr(first));
	CALL_PtrParam(MEM_InstToPtr(second));
	CALL__thiscall(MEM_Game.infoman,oCInfoManager__GetInformation);
	return CALL_RetValAsPtr();
};
func int Info_GetInfoCountUnimportant(var int firstNpc, var int secondNpc)
{
	//int __thiscall oCInfoManager::GetInfoCountUnimportant(oCNpc * oCNpc *)  0x00702C00
	const int oCInfoManager__GetInfoCountUnimportant = 7351296;
	var oCNpc first;		first = Hlp_GetNpc(firstNpc);
	var oCNpc second;	second = Hlp_GetNpc(secondNpc);
	CALL_PtrParam(MEM_InstToPtr(first));
	CALL_PtrParam(MEM_InstToPtr(second));
	CALL__thiscall(MEM_Game.infoman,oCInfoManager__GetInfoCountUnimportant);
	return CALL_RetValAsInt();
};
func int Info_GetInfoCountImportant(var int firstNpc, var int secondNpc)
{
	//int __thiscall oCInfoManager::GetInfoCountImportant(oCNpc * oCNpc *)  	0x00702AA0
	const int oCInfoManager__GetInfoCountImportant = 7350944;
	var oCNpc first;		first = Hlp_GetNpc(firstNpc);
	var oCNpc second;	second = Hlp_GetNpc(secondNpc);
	CALL_PtrParam(MEM_InstToPtr(first));
	CALL_PtrParam(MEM_InstToPtr(second));
	CALL__thiscall(MEM_Game.infoman,oCInfoManager__GetInfoCountImportant);
	return CALL_RetValAsInt();
};

func int Info_GetInfo(var int npcInstance, var int herInstance, var int nr_info)	//oCInfo *
{
	//oCInfo * __thiscall oCInfoManager::GetInfo(class oCNpc * oCNpc * int)	0x00702D60
	const int oCInfoManager__GetInfo = 7351648;
	var oCNpc npc;	Npc = Hlp_GetNpc(npcInstance);
	var oCNpc her;	Her = Hlp_GetNpc(herInstance);
	CALL_IntParam(nr_info);
	CALL_PtrParam(MEM_InstToPtr(Npc));
	CALL_PtrParam(MEM_InstToPtr(Her));
	CALL__thiscall(MEM_Game.infoman,oCInfoManager__GetInfo);
	return CALL_RetValAsPtr();
};
func int Info_GetInfoCount(var int npcInstance, var int herInstance)	//oCInfo *
{
	//int __thiscall oCInfoManager::GetInfoCount(oCNpc * oCNpc *)  	0x00702940
	const int oCInfoManager__GetInfoCount = 7350592;
	var oCNpc npc;	Npc = Hlp_GetNpc(npcInstance);
	var oCNpc her;	Her = Hlp_GetNpc(herInstance);
	CALL_PtrParam(MEM_InstToPtr(Npc));
	CALL_PtrParam(MEM_InstToPtr(Her));
	CALL__thiscall(MEM_Game.infoman,oCInfoManager__GetInfoCount);
	return CALL_RetValAsInt();
};

func int oCInfo_GetConditionFunc(var int oCInfo_ptr)	//symbolindex
{
	//int __thiscall oCInfo::GetConditionFunc(void)   	0x007038F0
	const int oCInfo__GetConditionFunc = 7354608;	
	CALL__thiscall(oCInfo_ptr,oCInfo__GetConditionFunc);
	return CALL_RetValAsInt();
};
func string oCInfo_GetConditionFuncName(var int oCInfo_ptr)	//symbolname;
{
	var int symbolIndex;
	symbolIndex = oCInfo_GetConditionFunc(oCInfo_ptr);
	
	var zCPar_Symbol symb;
	symb = _^(MEM_GetSymbolByIndex(symbolIndex));
	return symb.name;
};
func int oCInfo_InfoConditions(var int oCInfo_ptr)	//	TRUE|FALSE
{
	//int __thiscall oCInfo::InfoConditions(void) 	0x00703950
	//Необходимая проверка. Без неё, в условиях для диалога other != hero, self != self
	
	if(other.id == 0)	{	other = Hlp_GetNpc(hero);	};
	self = _^(MEM_InformationMan.npc);
	const int oCInfo__InfoConditions = 7354704;	
	CALL__thiscall(oCInfo_ptr,oCInfo__InfoConditions);
	return CALL_RetValAsInt();
};
//-----------------------------------------------------------
//СКАНИРОВАНИЕ ВСЕХ ДИАЛОГОВ НА ПРИНАДЛЕЖНОСТЬ К НПС, 
//-------которые сейчас актуальны
//-----------------------------------------------------------
func int B_GetCurrentInfosByNPC(var int npcInstance)
{
	var int count;	count = Info_GetInfoCount(npcInstance,hero);
	var int i; i = 0;
	var int arr; arr   = MEM_ArrayCreate();
	var int InfoPtr;
	
	while(count);
		InfoPtr = Info_GetInfo(npcInstance,hero,i);
		MEM_ArrayInsert(arr,InfoPtr);
		i += 1;
		count -= 1;
	end;
	return arr;	//Array of oCInfo*
};
//
//СКАНИРОВАНИЕ ВСЕХ ДИАЛОГОВ НА ПРИНАДЛЕЖНОСТЬ К НПС, 
//---полностью весь список с прочитанными
//
func int B_GetAllInfosByNpc(var int npcInstance)
{
	//MEM_InfoMan = _^(MEM_Game.infoman);
	var int Infos_Ptr;	Infos_Ptr = MEM_InfoMan.infoList_next;	
	var int arr;   				arr   = MEM_ArrayCreate();
	
	var oCInfo INFO_INSTANCE;
	var zCListSort ListOfInfos;
	
	While(Infos_Ptr);
		ListOfInfos = _^(Infos_Ptr);
		INFO_INSTANCE = _^(ListOfInfos.data);
		if(INFO_INSTANCE.npc == npcInstance)
		{
			MEM_ArrayInsert(arr,MEM_InstToPtr(INFO_INSTANCE));
		};
		if(ListOfInfos.next)
		{
			Infos_Ptr = ListOfInfos.next;
			ListOfInfos = _^(Infos_Ptr);
		}
		else		{Infos_Ptr = 0;};
	end;
	
	return arr;	//Array of oCInfo*
};
//
///Сканирует диалоги и возвращает массив со значениями,
// выполняется ли условие диалога. [TRUE,FALSE,FALSE,TRUE,..]
//
func int B_GetAllInfosCondByNpc(var int npcInstance)	//по идее не нужно.
{
	var int arr_adr;	arr_adr = B_GetAllInfosByNPC(npcInstance);
	var zCArray arr;	arr = _^(arr_adr);
	var int arr_length;	arr_length = arr.numInArray;
	var int arrCond;	arrCond = MEM_ArrayCreate();	
	var int info_Ptr;
	var int i; i =0;
	var int bool;
	
	while(arr_length);
		info_Ptr = MEM_ArrayRead(arr_adr,i);
		bool = oCInfo_InfoConditions(info_Ptr);
		MEM_ArrayInsert(arrCond,bool);
		arr_length -= 1;
		i += 1;
	end;
	
	return arrCond;	//array of condition all NPC's dialogs (TRUE|FALSE)
};
//
///Сканирует диалоги и возвращает массив со значениями
// порядковых номеров названий функций dia_xx_cond в символьной таблице
//
func int B_GetAllInfosCondFuncByNpc(var int npcInstance)	//return array of symbolIndex
{
	//Получаем длину массива всех диалогов НПС npcInstance
	var int arr_adr;	arr_adr = B_GetAllInfosByNPC(npcInstance);
	var zCArray arr;	arr = _^(arr_adr);
	var int arr_length;	arr_length = arr.numInArray;
	//Делаем массив (символ_индексов функций условий диалогов) = массиву всех диалогов
	var int arrFuncCond;	arrFuncCond = MEM_ArrayCreate();	
	var int info_Ptr;
	var oCInfo info;
	var int i; i =0;
	
	while(arr_length);
		info_Ptr = MEM_ArrayRead(arr_adr,i);
		info = _^(info_ptr);
		MEM_ArrayInsert(arrFuncCond,info.conditions);
		arr_length -= 1;
		i += 1;
	end;
	
	return arrFuncCond;	//array of of symbolIndex all 'dia_xxx_cond' functions
};
//
/////Функция, возвращающая всегда TRUE - идет на подмену всех функций 'dia_xxx_cond'
//
const string INFO_allwaysTRUE_COND_NAME = "INFO_allwaysTRUE_COND";
func int INFO_allwaysTRUE_COND()	{	return TRUE;};
func int _get_INFO_TRUE_COND_symbolindex()	{	return MEM_GetSymbolIndex(INFO_allwaysTRUE_COND_NAME);	};
//
//Устанавливаем условия всех диалогов в TRUE
//
func void B_SetAllInfosCond_asTRUE(var int npcInstance)
{
	if(!ARR_oCInfosFunc_ADR)
	{
		ARR_oCInfosFunc_ADR = B_GetAllInfosCondFuncByNpc(npcInstance);
		var int arr_adr;	arr_adr = B_GetAllInfosByNpc(npcInstance);
		var zCArray arr;	arr = _^(arr_adr);
		var int arr_length;  arr_length = arr.numInArray;
		var oCInfo oCInfo_inst;
		var int i; i=0;
		var string info_description;	info_description="";
		
		while(arr_length);
			oCInfo_inst = _^(MEM_ArrayRead(arr_adr,i));
			info_description = oCInfo_inst.description;
			if(oCInfo_InfoConditions(MEM_ArrayRead(arr_adr,i)))	//Если для диалога выполняется условие
			{
				if(oCInfo_inst.told && !oCInfo_inst.permanent)
				{
					info_description = ConcatStrings(info_description,"%//уже прослушано и ушло.");
				}
				else if(oCInfo_inst.told && oCInfo_inst.permanent)	//НЕВОЗМОЖНЫЙ ВАРИАНТ!
				{
					info_description = ConcatStrings(info_description,"%//уже прослушано, но постоянный");
				};
			}
			else if(!oCInfo_InfoConditions(MEM_ArrayRead(arr_adr,i)))	//Если для диалога НЕ выполняется условие
			{
				if(oCInfo_inst.told && !oCInfo_inst.permanent)
				{
					info_description = ConcatStrings(info_description,"%//уже прослушано, не постоянный и не выполняется условие.");
				}
				else if(oCInfo_inst.told && oCInfo_inst.permanent)
				{
					info_description = ConcatStrings(info_description,"%//уже прослушано, постоянный и не выполняется условие");
				}
				else if(!oCInfo_inst.told && !oCInfo_inst.permanent)
				{
					info_description = ConcatStrings(info_description,"%//не прослушано, не постоянный и не выполняется условие");
				}
				else if(!oCInfo_inst.told && oCInfo_inst.permanent)
				{
					info_description = ConcatStrings(info_description,"%//не прослушано, постоянный и не выполняется условие");
				};
			};
			oCInfo_inst.description = info_description;
			oCInfo_inst.conditions = _get_INFO_TRUE_COND_symbolindex();
			
			arr_length -= 1;
			i += 1;
		end;
		
		DialogManager__UpdateInfos();
	}
	else
	{
		MEM_Warn("Массив для восстановления условий диалогов уже существует. Необходимо затереть на него ссылку, прежде.");
	};
};
//
//Возвращаем все условия диалогов на место
//
func void B_RestoreAllInfosCond(var int npcInstance,var int arrCondFunc)
{
	if(ARR_oCInfosFunc_ADR)
	{
		var int arr_adr; var zCArray arr;
		arr_adr = B_GetAllInfosByNpc(npcInstance);
		arr = _^(arr_adr);
		var int arr_length;  arr_length = arr.numInArray;
		var oCInfo oCInfo_inst;
		var int i; i=0;
		var string info_description;	info_description="";
		
		while(arr_length);
			oCInfo_inst = _^(MEM_ArrayRead(arr_adr,i));
			info_description = oCInfo_inst.description;
			info_description = STR_Split(info_description,"%",0);
			oCInfo_inst.description = info_description;
			oCInfo_inst.conditions = MEM_ArrayRead(arrCondFunc,i);
			arr_length -= 1;
			i += 1;
		end;
		MEM_ArrayFree(ARR_oCInfosFunc_ADR);
		ARR_oCInfosFunc_ADR = 0;
		DialogManager__UpdateInfos();
	}
	else
	{
		MEM_Warn("Отсутствует массив для восстановления условий диалогов. Вероятно он был затёрт.");
	};
};
//
//--Функция вызывается в цикле (у нас в ds_time)
//При нажатии клавиш Info_DeblockKey_1 и Info_DeblockKey_2 все диалоги покажутся
//При нажатии клавиши Info_BlockKey_1 всё восстановится по умолчанию.
//!!!!Эти действия производить в рамках одного НПС и в течение одной сессии игры.!!!!
//
const int Info_DeblockKey_1 = KEY_LEFTARROW;		// -->> DarkSaga2.ini
const int Info_DeblockKey_2 = KEY_RIGHTARROW;	// -->> DarkSaga2.ini
const int Info_BlockKey_1 = KEY_TAB;							// -->> DarkSaga2.ini
const string Info_DeblockKey_Comb = "AND";

func void B_DSG_DeblockAllInfos()
{
	var int LeftArrow;		LeftArrow = MEM_KeyState(Info_DeblockKey_1);
	var int RightArrow;	RightArrow = MEM_KeyState(Info_DeblockKey_2);
	var int TabKey;				TabKey = MEM_KeyState(Info_BlockKey_1);
	//В(ы)ключаем деблокировочный ключ, который активирует все диалоги у НПС.
	if(hero.aivar[AIV_INVINCIBLE] == TRUE)
	{
		var oCNpc npc; npc = _^(MEM_InformationMan.npc);
		if((LeftArrow == KEY_PRESSED) && (RightArrow == KEY_PRESSED))
		{
			B_SetAllInfosCond_asTRUE(Hlp_GetInstanceID(npc));
		};
		if(TabKey == KEY_PRESSED)
		{
			B_RestoreAllInfosCond(Hlp_GetInstanceID(npc),ARR_oCInfosFunc_ADR);
		};
	};
};

//var int DlgTrade				;  //oCViewDialogTrade*	 //das sind Views. Das heiЯt vermutlich nur Anzeige
//void __fastcall oCViewDialogTrade::AllDialogsDisable(void) 	0x0068B160
func void ViewDialogTrade_AllDialogsDisable()
{
	var int oCViewDialogTrade_Ptr;
	oCViewDialogTrade_Ptr = MEM_InformationMan.DlgTrade;
	const int oCViewDialogTrade__AllDialogsDisable = 6861152;
	const int null = 0;
	
	CALL__fastcall(oCViewDialogTrade_Ptr,_@(null),oCViewDialogTrade__AllDialogsDisable);
};
func void ViewDialogTrade_AllDialogsStop()
{
	var int oCViewDialogTrade_Ptr;
	oCViewDialogTrade_Ptr = MEM_InformationMan.DlgTrade;
	const int oCViewDialogTrade__AllDialogsStop = 6861120;
	const int null = 0;
	
	CALL__fastcall(oCViewDialogTrade_Ptr,_@(null),oCViewDialogTrade__AllDialogsStop);
};

func void zCView_UpdateOpen(var int zCView_Ptr)
{
	//zCView::UpdateOpen(void)007A71C0 4B
	const int zCView__UpdateOpen = 8024512;	
	CALL__thiscall(zCView_Ptr,zCView__UpdateOpen);
};
