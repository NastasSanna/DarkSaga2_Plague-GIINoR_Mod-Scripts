
//������� ������� ��-�� ������� �� ������, ����� ������ ��� �� ������� ��� ������
// ������ ����� ��������� � ����������� EquipItem, � EquipItem_DS
func void B_DS_EquipItem(var C_NPC npc, var int ItemInst)
{
	EquipItem(npc, ItemInst);
	//S_Shield_01();	//UNFINISHED - ���������, ��� ItemInst - ��� ���! ���� ���������� ������ ��� �����
};
//
//������� �������� ������������� ������ �� ����� ����� �������� ��� ������, ���� ��� �� ��� ������� ��-�� �����.
//
func void B_DS_UnequipWeapons(var C_NPC slf)
{
	AI_UnequipWeapons(slf);
	if(!Npc_IsSlotFree(slf,"ZS_SHIELD"))
	{
		var int shield_ptr;
		shield_ptr = Npc_GetSlotItem(slf,"ZS_SHIELD");
		oCNpc_UnequipItem(slf, shield_ptr);
	};
};

