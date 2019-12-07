
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
	if(slf.aivar[AIV_ShieldEquipped] == ITEM_SHIELD)	//��� ����������, ����� �� �����
	{
//		MEM_DEBUG("SHIELD_DRAW1_OnAniCtrl");
		Npc_DoModelSwapMesh(slf,"ZS_SHIELD","ZS_LEFTARM");
		slf.aivar[AIV_ShieldEquipped] = ITEM_SHIELD + 1;
	};
	if(slf.aivar[AIV_ShieldEquipped] == ITEM_DAG)	//���������� 2 ���, ����� �� �����
	{
//		MEM_DEBUG("SHIELD_DRAW1_OnAniCtrl");
		Npc_DoModelSwapMesh(slf,"ZS_LONGSWORD","ZS_LEFTHAND");
		slf.aivar[AIV_ShieldEquipped] = ITEM_DAG + 1;
	};
};


func void SHIELD_DRAW1_OnAniCtrl()	//����������� ��������� ���, ������, � ������ ������
{
	if(!ECX) { return; };
	var oCAniCtrl_Human ani_ctrl;	ani_ctrl = _^(ECX);
	var c_npc slf; slf = _^(ani_ctrl.npc);
	//MEM_DEBUG(ConcatStrings("SHIELD_DRAW: ESP + 4 = ", IntToString(MEM_ReadInt(ESP+4))));
	//MEM_DEBUG(ConcatStrings("ESP + 8 = ", IntToString(MEM_ReadInt(ESP+8))));
	//MEM_DEBUG(ConcatStrings("ESP + 12 = ", IntToString(MEM_ReadInt(ESP+12))));
	// �������� ESP+4 (��������� ��������), �������� ��������� � FMODE
	// 1 - ������� ������������� ������ �� ��� ������, � ������ �� 1, ��� � npc
	// 2 - ???
	// 3 - �������. (�� SPACE)
	// 4 - ������. (�� SPACE)
	// 5 - ������� ������������� ������ �� �� SPACE, ��� ��� �� 2, ��� �� � npc
	// 6 - ������� �� SPACE
	// 7 - ����� ����� �������
	// ���� ������� ������ �� �������, �� ������ ��������� ���������. ���� ������ ��� - �� ������
	// �� ����������� �� ����� ������/����
	if ((MEM_ReadInt(ESP+4) < 5) && Npc_HasEquippedMeleeWeapon(slf))	{ 	//������ �� � � npc ���� ������ ��
		SHIELD_DRAW1(slf);
	};
};
func void SHIELD_DRAW1_OnNpc()	//����������� ��������� ���, ������, � ������ ������
{
	if(!ECX) { return; };
	var c_npc slf; slf = _^(ECX);
	//MEM_DEBUG(IntToString(slf.weapon));	//��������������� > 0 ������ ����� �������� ������
	if ((slf.weapon > 0) && (slf.weapon < 5))	{ 	//������ �� � � npc ���� ������ ��
		SHIELD_DRAW1(slf);
	};
};
func void SHIELD_REMOVE1()
{
	if(!ECX) { return; };
	var c_npc slf; slf = _^(ECX);
	if(slf.aivar[AIV_ShieldEquipped] == ITEM_SHIELD + 1)	// ��� ����, ��� � ����
	{
//		MEM_DEBUG("SHIELD_REMOVE1");
		Npc_DoModelSwapMesh(slf,"ZS_SHIELD","ZS_LEFTARM");
		slf.aivar[AIV_ShieldEquipped] = ITEM_SHIELD;
	};
	if(slf.aivar[AIV_ShieldEquipped] == ITEM_DAG + 1)// ��� ����, 2 ��� � ����
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
// ��� ����� ������ �� oCNpc__DropAllInHand
func void SHIELD_DROP()
{
	if(!ECX) { return; };
	var c_npc slf; slf = _^(ECX);
	if(slf.aivar[AIV_ShieldEquipped] == ITEM_SHIELD + 1)	// ��� ����, ��� � ����
	{
		//MEM_DEBUG("SHIELD_DROP");
		Npc_DropFromSlot(slf,"ZS_LEFTARM");
		// UNEQUIP �� ��������� ??? ���� ������ ���������� ���������
		Mdl_RemoveOverlayMds(slf,"HUM_SHIELD2.MDS");
		slf.aivar[AIV_ShieldEquipped] = FALSE;
	};
	if(slf.aivar[AIV_ShieldEquipped] == ITEM_DAG + 1)	// ��� ����, 2 ��� � ����
	{
		//MEM_DEBUG("SHIELD_DROP");
		Npc_DropFromSlot(slf,"ZS_LEFTHAND");
		// UNEQUIP �� ��������� ??? ���� ������ ���������� ���������
		Mdl_RemoveOverlayMds(slf,"Hum_2x2L3.MDS");
		Mdl_RemoveOverlayMds(slf,"Hum_2x2L2.MDS");
		slf.aivar[AIV_ShieldEquipped] = FALSE;
	};
};
// ����������� ������
func void SHIELD_EquipBest()
{
	if(!ECX) { return; };
	var c_npc slf; slf = _^(ECX);
	//MEM_DEBUG(ConcatStrings("SHIELD_EquipBest: ESP + 4 = ", IntToString(MEM_ReadInt(ESP+4))));
	if (MEM_ReadInt(ESP+4) == ITEM_KAT_NF)	{//��������� ������ ��
		//������ ������ ��� �� �������, ��������� 1h/2h ������ ���
		var int shield_ptr;	shield_ptr = Npc_SearchBestShield(slf);
		if (shield_ptr)	{	//���� ��� ������� - ���������
			if(!Npc_IsSlotFree(slf,"ZS_SHIELD"))	//���� ��� ��� ����, ��� ���� �����, ����� �� ��������
			{
				var int prevshield_ptr;	prevshield_ptr = Npc_GetSlotItem(slf,"ZS_SHIELD");
				oCNpc_UnequipItem(slf, prevshield_ptr);
			};
			//MEM_DEBUG("Equipped");
			oCNpc_Equip(MEM_InstToPtr(slf), shield_ptr);
			//EquipItem �� �����, �� ������� ����� ��������� ����
		};
	};
	//���� ������ ������ �������� ������, ��� ��������
};

//======================================================

func void Shields_Init1() {
	const int ShieldsHooked = 0;
	if (!ShieldsHooked)	{	// ������ ��� �� ������� ������! ����� - �����
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

