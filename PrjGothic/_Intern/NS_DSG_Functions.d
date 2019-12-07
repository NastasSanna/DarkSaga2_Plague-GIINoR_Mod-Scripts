/**************************************************************************

func void Print_DSG_OnMob(var string txt, var string FONT, var int line)
	������� ��������� ��� ������ � mob'�� (��� ����� �������)

func void Print_DSG_InInventory(var string txt, var string FONT, var int line)
	������� ��������� ��� ������ � mob'�� (��� ����� �������)

 //* NS
  
***************************************************************************/


// ���� ��������� �����, �� 0.2 �� 0.8 ���. (������ - �������� �����)
// ������ B_MM_DeSynchronize(), ������� �� �������� (��������� AI_Waitms)
func void B_DSG_WaitRandom(var C_NPC slf)
{
	var int rnd;	rnd = Hlp_Random(80);
	if (rnd < 20)	{	AI_Wait(slf,0.2);	}
	else if (rnd < 30)	{	AI_Wait(slf,0.3);	}
	else if (rnd < 40)	{	AI_Wait(slf,0.4);	}
	else if (rnd < 50)	{	AI_Wait(slf,0.5);	}
	else if (rnd < 60)	{	AI_Wait(slf,0.6);	}
	else if (rnd < 70)	{	AI_Wait(slf,0.7);	}
	else				{	AI_Wait(slf,0.8);	};
};

// =========================================================================
// ������� ��������� ��� ������ � mob'��
// =========================================================================
// (��� ����� �������)
func void Print_DSG_OnMob(var string txt, var string FONT, var int line)
{
	PrintScreen(txt, -1, 75 + 2*line, FONT, 4);
};

// =========================================================================
// ������� ��������� � ���������
// =========================================================================
// �� ������ �������� �� �� ���������, �� �� ������� Print
func void Print_DSG_InInventory(var string txt, var string FONT, var int line)
{
	PrintScreen(txt, -1, 12 + 2*line, FONT, 4);
};

// =========================================================================
// �����, ��������� � ������ ���� (������� �����)
// =========================================================================
/* ������� =C_GetTime_Plus(0,0,0) =Wld_GetPassedTime(0)
func int C_GetTime_Now()
{
	// Ikarus/LeGo Needed
	return Wld_GetPassedTime(0);
};
//*/
// ����� h ����� m ����� �� ��������, + �������� rand_min �����
// ��� ��������, ����� ���-�� ����� ������
func int C_GetTime_Plus(var int h, var int m, var int rand_min)
{
	// Ikarus/LeGo Needed
	return Wld_GetPassedTime(0) + h * 60 + m + Hlp_Random(rand_min);
};

// ����� ������� ����, ���� �������, ��� �� ���������� �� � 0, � � h �����
func int Wld_GetDay_Plus(var int h)
{
	var int d;	d = Wld_GetDay();
	if ((d > 0) && Wld_IsTime(0,0,h,0))	{
		d -= 1;
	};
	return d;
};

// ������� ������ ������� ����� ������ � ������ ����
func int Wld_GetFullHours()
{
	Wld_GetTime();
	return time_Get[0] * 24 + time_Get[1];
};

// =========================================================================
// �������� � ��������
// =========================================================================
// �������� � ����� (slf - ��������� ���, oth - ����������, �� ����������� ��� � �������)
func void B_DIA_UseMob(var C_NPC slf, var C_NPC oth, var string MobName, var float WaitTime)
{
	AI_StopLookAt(slf);
	AI_UseMob(slf,MobName,1);
	AI_Wait(slf,WaitTime);
	AI_UseMob(slf,MobName,-1);
	AI_GotoNpc(slf, oth);
	AI_TurnToNpc(slf, oth);	AI_LookAtNpc(slf,oth);
	AI_TurnToNpc(oth,slf);
};
// �������� � ��������� (slf - ��������� �������, oth - ����������, �� ����������� ��� � �������)
// ������� �� ��������� ����� �������������
func void B_DIA_UseItem_Wait(var C_NPC slf, var C_NPC oth, var int ItemInstance, var float WaitTime)
{
	CreateInvItem(slf, ItemInstance);
	AI_StopLookAt(slf);
	AI_UseItemToState(slf,ItemInstance,1);
	AI_Wait(slf,WaitTime);
	AI_UseItemToState(slf,ItemInstance,-1);
	AI_LookAtNpc(slf,oth);
};

// =========================================================================
// ������
// NS - 09-10/07/2013 
// Ikarus/LeGo Needed
// =========================================================================
var string AllTargetWPs; //������������� ���������� � B_DSG_InsertAllTargets
	const string AllTargetWPs_delim =";";

/// �������� ������ �� WP � ��������� ��� ��� � AllTargetWPs
func void Wld_DSG_InsertTarget(var int tgt_inst, var string WPname)
{
	//MEM_Debug(WPName);
	Wld_InsertNpc(tgt_inst, WPName);
	
	if (Hlp_StrCmp(AllTargetWPs,""))	{
		AllTargetWPs = WPname;
	}
	else 	{
		AllTargetWPs = ConcatStrings(AllTargetWPs, AllTargetWPs_delim);
		AllTargetWPs = ConcatStrings(AllTargetWPs, WPname);
	};
};


// �������������� ������� ������� �� ��� ���������� WP
func void B_DSG_InsertAllTargets()
{
	var string WPName;
	VAR zCWaypoint curWp;
	// ���������� ��� WP
	VAR zCListSort curItem;	curItem = _^(MEM_Waynet.wplist_next);
	
	// while (curItem.data);
	var int label;	label = MEM_StackPos.position;
	if (curItem.data)
	{
		curWp = _^(curItem.data);
		WPName = curWp.name;
		// ���� ��� WP �������� ���������� �������� - ������ ���� ������
		if (STR_IndexOf(WPName, "_TARGETINVIS_POS_") != -1)		{		Wld_DSG_InsertTarget(TargetInvis,WPName);		};
		if (STR_IndexOf(WPName, "_TARGETFACE_POS_") != -1)		{		Wld_DSG_InsertTarget(TargetFace,WPName);		};
		if (STR_IndexOf(WPName, "_TARGETFULL_POS_") != -1)		{		Wld_DSG_InsertTarget(TargetFull,WPName);		};
		curItem = _^(curItem.next);
		MEM_StackPos.position = label;
	};
	//end;
};

// Npc ��������� �� ���������� ?
// ����� WP �������� � �����, ��� �������� ���������� �� ����� NPC-�������
func int C_DSG_NpcIsOnTrainingGround_Ranged(var C_NPC npc)
{
	// ���� ����� ������� ������� ��� �����-�� ��������
	// ����������:
	// �������� �� AllTargetWPs ��� ����� WP
	var int AllTargetWPs_cnt; AllTargetWPs_cnt = STR_SplitCount(AllTargetWPs, AllTargetWPs_delim);
	var int i; i = 0;
	while (i < AllTargetWPs_cnt);
		// ���� ���� ���������� - �� �� ����������
		If (Npc_GetDistToWP(npc, STR_Split(AllTargetWPs, AllTargetWPs_delim, i)) < FIGHT_DIST_RANGED_OUTER)
		{
			return TRUE;
		};
		i += 1;
	end;
	// �� ������� ����������� - ������ �� �� ����������
	return FALSE;
};


// =========================================================================
// ���������/�����/����� �� - ���?
// �������� ������ �������� � ������������ NPC:
//��� �������� ���� �� ��� �� �������� � ��� Npc_GetNearestWP(hero) �� ���������
//��������� string-���������� � ����� ���� ������
// =========================================================================

//������� �� ��
func string C_GetFollowPlayerWP(var string DefaultWP)
{
	//���� � �� ���� ����� WP
	if (!Hlp_StrCmp(Npc_GetNearestWP(hero),""))	{
		return Npc_GetNearestWP(hero);
	} 
	//����� - ���������, �������� �� WP � ���
	else if (!Hlp_StrCmp(self.wp,""))	{
		return self.wp;
	};
	//����� - WP �� ���������
	return DefaultWP;
};

//���� ��
func string C_GetWaitPlayerWP(var string DefaultWP)
{
	//���������, �������� �� WP � ���
	if (!Hlp_StrCmp(self.wp,""))	{
		return self.wp;
	};
	//����� - WP ����� � ��
	if (!Hlp_StrCmp(Npc_GetNearestWP(hero),""))	{
		return Npc_GetNearestWP(hero);
	}; 
	//����� - WP �� ���������
	return DefaultWP;
};

//����� ��
func string C_GetGuidePlayerWP(var string DefaultWP)
{
	//WP ����� � ��
	if (!Hlp_StrCmp(Npc_GetNearestWP(hero),""))	{
		return Npc_GetNearestWP(hero);
	}; 
	//����� - ���������, �������� �� WP � ���
	if (!Hlp_StrCmp(self.wp,""))	{
		return self.wp;
	};
	//����� - WP �� ���������
	return DefaultWP;
};
