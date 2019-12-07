/**********************************************************
					��������� ���������
		� ��������� ������� �� ������� �����/������

   !!!  �� �������� �� on_equip/on_unequip  !!!
 
 ==========================================================

  1. ���� �� ���� ��������� ��������� �� �������� � ��������
������� �� ������� ������ � �����.

  2. ���� � ������ ������������ ������� �� ������� ��������
�� �����������, �� ��������� ��� "�������� ������" - ������
��������� on_unequip, �������� ������ ����� � �.�.

  ��� ����� ��������� ��� �������� ��������� �� � (��-)����������
���, ����� ������� �������� �������, ������� ������������
�������� �������� ��� ��� �������.

  ��������� ��� ����� ������������ ����� ���������, ����������
������� �������� ����� ��������� ��� �������, ��� �������������
AI_Unequip, � �� ��������� ��� ������� - �������� ��������������
�������� �� ��������� � ��� �������������� ������������ (��. �.3).
  
  3. ����� (��-)���������� ���� ������ �������� ��������������
�������� ������� ���� ������������� ���������, � �������
�� �������.
 
//* NS - 26/01/2013

************************************************************/

// ���������, ����� �� ������������ �������, ���� ������� atr ��������� �� val
func void B_DSG_CheckEquippedItem(var C_NPC npc, var C_ITEM itm, var int atr, var int val)
{
	if (atr == 0)
	{
		return;
	};
	// ���� ����� ����� ������� ����� ���������
	var int NewValue; NewValue = 0;
	if (atr == ATR_DEXTERITY)
	{
		NewValue = npc.attribute[ATR_DEXTERITY] + val;
	}
	else if (atr == ATR_STRENGTH)
	{
		NewValue = npc.attribute[ATR_STRENGTH] + val;
	}
	else if (atr == ATR_MANA_MAX)
	{
		NewValue = npc.attribute[ATR_MANA_MAX] + val;
	}
	else if (atr == ATR_HITPOINTS_MAX)
	{
		NewValue = npc.attribute[ATR_HITPOINTS_MAX] + val;
	};
	// �������� ���� �������
	var int CanUse; CanUse = TRUE;
	if ((itm.cond_atr[0] == atr) && (itm.cond_value[0] > NewValue))
	{
		G_CanNotUse(true, atr, itm.cond_value[0] - val);
		CanUse = FALSE;
	};
	if ((itm.cond_atr[1] == atr) && (itm.cond_value[1] > NewValue)) 
	{
		G_CanNotUse(true, atr, itm.cond_value[1] - val);
		CanUse = FALSE;
	};
	if ((itm.cond_atr[2] == atr) && (itm.cond_value[2] > NewValue))
	{
		G_CanNotUse(true, atr, itm.cond_value[2] - val);
		CanUse = FALSE;
	};
	// ���� �����-�� ������� ��������
	if (CanUse == FALSE)
	{
		// ������������ ������ ����� �������� ��������
		var int ItmInstance;	ItmInstance = Hlp_GetInstanceID(itm);
		var int cnt;			cnt = Npc_HasItems(npc, ItmInstance);
		Npc_RemoveInvItems(npc,ItmInstance, cnt);
		CreateInvItems(npc,ItmInstance, cnt);
	};
};

// �������� ������� � ��������� ������� �� ������� ������/�����
func void B_DSG_ChangeAttribute(var C_NPC npc, var int Attribute, var int Value)
{
	// ��������
	var C_ITEM itm;
	// ������������� �����
	if (Npc_HasEquippedArmor(npc))
	{
		itm = Npc_GetEquippedArmor(npc);
		B_DSG_CheckEquippedItem(npc, itm, Attribute, Value);
	};
	// ������� ���
	if (Npc_HasEquippedMeleeWeapon(npc))
	{
		itm = Npc_GetEquippedMeleeWeapon(npc);
		B_DSG_CheckEquippedItem(npc, itm, Attribute, Value);
	};
	// ������� ���
	if (Npc_HasEquippedRangedWeapon(npc))
	{
		itm = Npc_GetEquippedRangedWeapon(npc);
		B_DSG_CheckEquippedItem(npc, itm, Attribute, Value);
	};
	
	// ���������� ��������� ���������
	Npc_ChangeAttribute(npc,Attribute,Value);
};

/*********************************************************
				������ 2 - ����� � ������ :)

  �������� ����������� ������� ����� �������� �����.

  ������������ - ������ ��� �������� ���.

 !!! ������ �������� ��� ������� � (��-)���������� ����� !!!

  �������������� �� ������ ���������� �����/������. ���
������������ �� ���������� ��������� �����. FAKEARMOR
��������� ������������.

********************************************************/

/*/

// ������� ��� �� �����
// ����� �� �����������, ����� ������� �������������� �������� ���� �������
instance FAKEARMOR(C_ITEM)
{
	name = "FAKEARMOR";	visual_change = "hum_body_Naked0.asc";
	mainflag = ITEM_KAT_ARMOR;	wear = WEAR_TORSO | WEAR_EFFECT;	material = MAT_LEATHER;
	on_equip = Equip_FAKEARMOR;
};
// ��� ���������� ����������������
func void Equip_FAKEARMOR()
{
	Npc_RemoveInvItem(self,FAKEARMOR);
};

func void B_DSG_ChangeAttribute(var C_NPC npc, var int Attribute, var int Value)
{
	// ������� ������������� �����
	var C_ITEM Armor;		
	var int ArmorInstance;	ArmorInstance = -1;
	var int cnt;
	// ���� ��� ����
	if (Npc_HasEquippedArmor(npc))
	{
		Armor = Npc_GetEquippedArmor(npc);
		ArmorInstance = Hlp_GetInstanceID(Armor);
		cnt = Npc_HasItems(npc, ArmorInstance);
		
		// ������� ����� ��� ������ ������ AI_Unequip
		Npc_RemoveInvItems(npc,ArmorInstance, cnt);
		CreateInvItems(npc,ArmorInstance, cnt);
	};
	
	// ���������� ��������� ���������� (����������� ����� ����, ��� �����-������� �����)
	Npc_ChangeAttribute(npc,Attribute,Value);
	
	// �������� ��� ������, ����� ��������� �������� ������
	// FAKEARMOR ���������������� ��� ��������� � �������� ��� ���� ��
	CreateInvItem(npc,FAKEARMOR);
	AI_EquipArmor(npc,FAKEARMOR);
//	Npc_RemoveInvItem(hero,FAKEARMOR);
	
	// �������� ������ ������� �������, ���� ��� ����
	if (ArmorInstance > -1)
	{
		AI_EquipArmor(npc,ArmorInstance);
	};
};

//*/