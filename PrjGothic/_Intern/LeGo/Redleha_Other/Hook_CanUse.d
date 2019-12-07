
////////////////// ������� ��� �� oCNpc__CanUse \\\\\\\\\\\\\\\\\\\\\
// �� �������� �������� ���������, G_CanNotUse ���������
// ������������ MEM_Debug, ������ �������� ����!
/////////////////////////////////////////////////////////////////////

//��������� �������� ����� �������, ������������ �� � � ����������� oCNpc__CanUse
var int My_Npc_CanUse_Result;

func void My_Npc_CanUse_before()
// ��� �� ������ ������� ������
// ����� �������� ��� ���������� ��������� � ���� � �����������
{
//MEM_Debug("My_Npc_CanUse_before");
//MEM_Debug(ConcatStrings("retAddr = ", I2S(retAddr)));
	if(ECX > 0) { //npc
		var c_npc slf; slf = _^(ECX);
//MEM_Debug(slf.name);
	}
	else	{
//MEM_Debug("No NPC in ECX");
		return;
	};
	if(MEM_ReadInt(ESP + 4) > 0) { //item
		var ocItem itm; itm = _^(MEM_ReadInt(ESP + 4));
//MEM_Debug(itm.name);
	}
	else	{
//MEM_Debug("No item in [ESP + 4]");
		return;
	};
	// ��� ��������� ��� �������� � ��������� ���������� � ���������� ����������
	My_Npc_CanUse_Result = TRUE;	//�� ��������� - �����
	// 2 ������
	if ((itm.weight & ITEM_DAG) == ITEM_DAG)	{	
		if (Npc_GetTalentSkill(slf, NPC_TALENT_2X2H) == 0)	{
			My_Npc_CanUse_Result = FALSE;
			if (Npc_IsPlayer(slf))	{
				Print(PRINT_TALENT_2x2H_MISSING);
			};
		};
	}
	else
	// ��� ������ ����, � ���� ��� ������
	if ((itm.flags & ITEM_SHIELD) == ITEM_SHIELD)	{	
		if (!Hlp_IsItem(itm, BUG_Shield))	{//������
			if (Npc_GetTalentSkill(slf, NPC_TALENT_SHIELD) == 0)	{
				My_Npc_CanUse_Result = FALSE;
				if (Npc_IsPlayer(slf))	{
					Print(PRINT_SHIELDTALENT_MISSING);
				};
			};
		};
	};
};

func void My_Npc_CanUse_after()
// ��� ����� ������ ������� ������
// �������� ���������� ���������, �� � ��� ������������� ����������. � ����� �����
// ��������� ������ ������� ������ ����� ������/�������� � HookedFunc_Result
{
//MEM_Debug("My_Npc_CanUse_after");
//MEM_Debug(ConcatStrings("HookedFunc_Result = ", I2S(HookedFunc_Result)));
	// ����� ����� �������� �������� HookedFunc_Result
	HookedFunc_Result = HookedFunc_Result && My_Npc_CanUse_Result;
};

