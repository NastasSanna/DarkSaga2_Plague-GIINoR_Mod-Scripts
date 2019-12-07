
func void B_CreateShieldSlots(var C_NPC slf)
{
	if (!Npc_IsInvSlotAvailable(slf, "ZS_LEFTARM"))	{
//		MEM_DEBUG("ZS_LEFTARM created");
		Npc_CreateInvSlot(slf ,"ZS_LEFTARM");
	};
	if (!Npc_IsInvSlotAvailable(slf, "ZS_SHIELD"))	{
		//MEM_DEBUG("ZS_SHIELD created");
		Npc_CreateInvSlot(slf ,"ZS_SHIELD");
	};
};

//===================================================

func void SHIELD_DRAW1(var C_NPC slf)
{
	if(slf.aivar[AIV_ShieldEquipped] == ITEM_SHIELD)	//щит экипирован, висит на спине
	{
//		MEM_DEBUG("SHIELD_DRAW1_OnAniCtrl");
		Npc_DoModelSwapMesh(slf,"ZS_SHIELD","ZS_LEFTARM");
		slf.aivar[AIV_ShieldEquipped] = ITEM_SHIELD + 1;
	};
	if(slf.aivar[AIV_ShieldEquipped] == ITEM_DAG)	//экипирован 2 меч, висит на спине
	{
//		MEM_DEBUG("SHIELD_DRAW1_OnAniCtrl");
		Npc_DoModelSwapMesh(slf,"ZS_LONGSWORD","ZS_LEFTHAND");
		slf.aivar[AIV_ShieldEquipped] = ITEM_DAG + 1;
	};
};


func void SHIELD_DRAW1_OnAniCtrl()	//срабатывает несколько раз, видимо, в каждом фрейме
{
	if(!ECX) { return; };
	var oCAniCtrl_Human ani_ctrl;	ani_ctrl = _^(ECX);
	var c_npc slf; slf = _^(ani_ctrl.npc);
	//MEM_DEBUG(ConcatStrings("SHIELD_DRAW: ESP + 4 = ", IntToString(MEM_ReadInt(ESP+4))));
	//MEM_DEBUG(ConcatStrings("ESP + 8 = ", IntToString(MEM_ReadInt(ESP+8))));
	//MEM_DEBUG(ConcatStrings("ESP + 12 = ", IntToString(MEM_ReadInt(ESP+12))));
	// значения ESP+4 (последний параметр), частично совпадает с FMODE
	// 1 - прежнее экипированное оружие ББ или кулаки, у игрока по 1, или у npc
	// 2 - ???
	// 3 - одноруч. (по SPACE)
	// 4 - двуруч. (по SPACE)
	// 5 - прежнее экипированное оружие ДБ по SPACE, или лук по 2, или ДБ у npc
	// 6 - арбалет по SPACE
	// 7 - магия любой кнопкой
	// если прежнее оружие не найдено, то ищется следующее имеющееся. Если ничего нет - то кулаки
	// НЕ СРАБАТЫВАЕТ во время ходьбы/бега
	if ((MEM_ReadInt(ESP+4) < 5) && Npc_HasEquippedMeleeWeapon(slf))	{ 	//выбран ББ и у npc есть оружие ББ
		SHIELD_DRAW1(slf);
	};
};
func void SHIELD_DRAW1_OnNpc()	//срабатывает несколько раз, видимо, в каждом фрейме
{
	if(!ECX) { return; };
	var c_npc slf; slf = _^(ECX);
	//MEM_DEBUG(IntToString(slf.weapon));	//устанавливается > 0 только когда достанем оружие
	if ((slf.weapon > 0) && (slf.weapon < 5))	{ 	//выбран ББ и у npc есть оружие ББ
		SHIELD_DRAW1(slf);
	};
};
func void SHIELD_REMOVE1()
{
	if(!ECX) { return; };
	var c_npc slf; slf = _^(ECX);
	if(slf.aivar[AIV_ShieldEquipped] == ITEM_SHIELD + 1)	// был своп, щит в руке
	{
//		MEM_DEBUG("SHIELD_REMOVE1");
		Npc_DoModelSwapMesh(slf,"ZS_SHIELD","ZS_LEFTARM");
		slf.aivar[AIV_ShieldEquipped] = ITEM_SHIELD;
	};
	if(slf.aivar[AIV_ShieldEquipped] == ITEM_DAG + 1)// был своп, 2 меч в руке
	{
//		MEM_DEBUG("SHIELD_REMOVE1 DAG");
		Npc_DoModelSwapMesh(slf,"ZS_LONGSWORD","ZS_LEFTHAND");
		slf.aivar[AIV_ShieldEquipped] = ITEM_DAG;
	};
};
func void SHIELD_ForceREMOVE()
{
//	MEM_DEBUG("SHIELD_ForceREMOVE");
	SHIELD_REMOVE1();
};
// щит будет ронять по oCNpc__DropAllInHand
func void SHIELD_DROP()
{
	if(!ECX) { return; };
	var c_npc slf; slf = _^(ECX);
	if(slf.aivar[AIV_ShieldEquipped] == ITEM_SHIELD + 1)	// был своп, щит в руке
	{
		//MEM_DEBUG("SHIELD_DROP");
		Npc_DropFromSlot(slf,"ZS_LEFTARM");
		// UNEQUIP не сработает ??? хотя защита отнимается нормально
		Mdl_RemoveOverlayMds(slf,"HUM_SHIELD2.MDS");
		slf.aivar[AIV_ShieldEquipped] = FALSE;
	};
	if(slf.aivar[AIV_ShieldEquipped] == ITEM_DAG + 1)	// был своп, 2 меч в руке
	{
		//MEM_DEBUG("SHIELD_DROP");
		Npc_DropFromSlot(slf,"ZS_LEFTHAND");
		// UNEQUIP не сработает ??? хотя защита отнимается нормально
		Mdl_RemoveOverlayMds(slf,"Hum_2x2L3.MDS");
		Mdl_RemoveOverlayMds(slf,"Hum_2x2L2.MDS");
		slf.aivar[AIV_ShieldEquipped] = FALSE;
	};
};
// экипировать лучшее
func void SHIELD_EquipBest()
{
	if(!ECX) { return; };
	var c_npc slf; slf = _^(ECX);
	//MEM_DEBUG(ConcatStrings("SHIELD_EquipBest: ESP + 4 = ", IntToString(MEM_ReadInt(ESP+4))));
	if (MEM_ReadInt(ESP+4) == ITEM_KAT_NF)	{//экипируем оружие ББ
		//лучшее оружие еще не выбрано, проверять 1h/2h смысла нет
		var int shield_ptr;	shield_ptr = Npc_SearchBestShield(slf);
		if (shield_ptr)	{	//если щит нашелся - экипируем
			if(!Npc_IsSlotFree(slf,"ZS_SHIELD"))	//если щит уже есть, его надо снять, иначе не работает
			{
				var int prevshield_ptr;	prevshield_ptr = Npc_GetSlotItem(slf,"ZS_SHIELD");
				oCNpc_UnequipItem(slf, prevshield_ptr);
			};
			//MEM_DEBUG("Equipped");
			oCNpc_Equip(MEM_InstToPtr(slf), shield_ptr);
			//EquipItem не катит, он создает новый экземпляр щита
		};
	};
	//если дальше лучшим окажется двуруч, щит снимется
};

//======================================================

func void Shields_Init1() {
	const int ShieldsHooked = 0;
	if (!ShieldsHooked)	{	// только раз за игровую сессию! иначе - вылет
		ShieldsHooked = 1;
		HookEngineF(oCAniCtrl_Human__DrawWeapon1,	6, SHIELD_DRAW1_OnAniCtrl);
		HookEngineF(oCNpc__EV_DrawWeapon,	6, SHIELD_DRAW1_OnNpc);
		HookEngineF(oCNpc__EV_DrawWeapon1,	5, SHIELD_DRAW1_OnNpc);
		HookEngineF(oCNpc__EV_RemoveWeapon,  7, SHIELD_REMOVE1);
		HookEngineF(oCNpc__EV_RemoveWeapon1, 7, SHIELD_REMOVE1);
		HookEngineF(oCNpc__DropAllInHand,  5, SHIELD_DROP);
		HookEngineF(oCNpc__ForceRemoveWeapon,  6, SHIELD_ForceREMOVE);
		//HookEngineF(oCNpc__EV_UnequipWeapons,  9, SHIELD_UnequipAll);
		HookEngineF(oCNpc__EV_EquipBestWeapon,  7, SHIELD_EquipBest);
	};
};

//======================================================
const int INIT_Ikarus_Lego_Once = 0;

func void INIT_Ikarus_Lego()
{
	if (!INIT_Ikarus_Lego_Once)	{
		INIT_Ikarus_Lego_Once = 1;
		MEM_InitAll();
		Lego_Init(LeGo_AI_Function);
		Shields_Init1();
		HookEngineF_Ext(oCNpc__CanUse,6,My_Npc_CanUse_before,My_Npc_CanUse_after);
	};
};

