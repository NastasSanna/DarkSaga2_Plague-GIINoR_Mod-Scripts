/**************************************************************
				������������� �� ����������

  � ����� ��� ���������, ��� ����. ���� ������ ����, ���������
������� ���.
 
  �� ���� ��� �������! ���������� �� ������ ������, �� � ���,
��� ��������� �� ����.
  ���� ������ ��������, ��� �� �� ����� ����� ����� ������,
 �� �� ����� ���� �� ����� ���� � ����� �� ������!
 
  self.aivar[AIV_TAPOSITION] ����������� ��������.
  
NS - 08-09/07/13
**************************************************************/

func void ZS_DSG_Practice_RangedWeapon()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
		AI_AlignToWP(self);
	};
	// ��� �� �����������
	AI_EquipBestRangedWeapon(self);
	B_CreateAmmo(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_DSG_Practice_RangedWeapon_Loop()
{
	// ��� ��������� ������?
	Npc_PerceiveAll(self);
	if (!Wld_DetectNpc(self,-1,ZS_BeingTarget,GIL_PUBLIC))
	{
		/* DEBUG INFO
		Print(ConcatStrings(self.name, ": Target NOT found!"));
		//*/
		self.aivar[AIV_LASTTARGET] = 0;
		return ZS_Stand_WP_loop();		//���� - ������ �����, �����
	};
	self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
	/* DEBUG INFO
	Print(ConcatStrings(self.name, ": Target found!"));
	//*/
	// �� �� ����� ����!
	if (Npc_GetDistToPlayer(other) < 250)
	{
		AI_StopAim(self);
		AI_StopLookAt(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
		return LOOP_CONTINUE;
	};
	// ��������� � ��������
	if(self.aivar[AIV_TAPOSITION] <= NOTINPOS)
	{
		if(!Npc_HasEquippedRangedWeapon(self))
		{
			CreateInvItems(self,ItRw_Sld_Bow,1);
			AI_EquipBestRangedWeapon(self);
		};
		AI_TurnToNpc(self, other);	//? ������ �� �� ����� ��������������
		AI_WhirlAround(self, other);	//� ���� ����� �����
		AI_LookAtNpc(self,other);
		AI_ReadyRangedWeapon(self);
		AI_AimAt(self, other);
	};
	B_CreateAmmo(self);
	// �������� ��������� �� 10-20 ���������
	if (self.aivar[AIV_TAPOSITION] < NOTINPOS + 10 + Hlp_Random(10))
	{
		B_DSG_WaitRandom(self);	//�� �� ��� �������
		AI_ShootAt(self, other);
		self.aivar[AIV_TAPOSITION] += 1;
	}
	// �������
	else
	{
		AI_StopAim(self);
		// ������ ������ �� ������
		if (Hlp_Random(10) < 3)
		{
			/*FOR SHIELD*///	AI_RemoveWeapon_ds(slf);
			AI_RemoveWeapon(self);
			AI_SetWalkMode(self,NPC_WALK);	//? ���-�� ������������
			AI_GotoNpc(self,other);
			AI_LookAtNpc(self, other);
			B_DSG_WaitRandom(self);
			AI_GotoWP(self,self.wp);
			AI_AlignToWP(self);
		};
		AI_StopLookAt(self);
		B_DSG_WaitRandom(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
	};
	/* DEBUG INFO
	Print(ConcatStrings("AIV_TAPOSITION = ", IntToString(self.aivar[AIV_TAPOSITION])));
	//*/
	return LOOP_CONTINUE;
};

func void ZS_DSG_Practice_RangedWeapon_End()
{
	/* DEBUG INFO
	Print(ConcatStrings(self.name, ": End practice."));
	//*/
	// ����� ����������
	AI_StopAim(self);
	AI_StopLookAt(self);
	/*FOR SHIELD*///	AI_RemoveWeapon_ds(slf);
	AI_RemoveWeapon(self);
};

// ========================================================
// � ��� ������ ������? �� ������, �� ���� � ��� ��� ZS, ����� ����.
// ����� ����������� ������ ���������� �� WP.
// ����� ��� ���������� �����-�� ����. ����������
// ��������, ���� � ������, ����� ����� ���� ��������� ��������� ��

func void ZS_BeingTarget()
{
	B_ClearPerceptions(self);
	//����. �������� ��������
	Vob_SetCollDetStat(_@(self), FALSE);
	//������������, ���� ���� WP
	if (!Hlp_StrCmp(self.wp, ""))
	{
		AI_AlignToWP(self);
		var int ptr_self_wp;	ptr_self_wp = zCWayNet_GetWaypoint(self.wp);
		if (ptr_self_wp > 0)
		{
			var zCWaypoint self_wp;	self_wp = _^(ptr_self_wp);
			var oCNPC self_vob;		self_vob = _^(_@(self));
			/*Vob_MoveWorld(_@(self), self_wp[0], self_wp[2], self_wp[1]); ������ �����
			MEM_Debug(self_wp.name);
			Vob_SetDrawBBox3D(_@(self),TRUE);*/
			self_vob._zCVob_trafoObjToWorld[3]=self_wp.pos[0];
			self_vob._zCVob_trafoObjToWorld[7]=addf(self_wp.pos[1], mkf(40));	//���� ������������ ��� wp
			self_vob._zCVob_trafoObjToWorld[11]=self_wp.pos[2];
			/* �������� ������� �� ����, bbox3D ��� �����������
			self_vob._zCVob_bbox3D_maxs[0]=addf(self_wp.pos[0], mkf(5));
			self_vob._zCVob_bbox3D_maxs[1]=addf(self_wp.pos[1], mkf(5));
			self_vob._zCVob_bbox3D_maxs[2]=addf(self_wp.pos[2], mkf(5));
			self_vob._zCVob_bbox3D_mins[0]=subf(self_wp.pos[0], mkf(5));
			self_vob._zCVob_bbox3D_mins[1]=subf(self_wp.pos[1], mkf(5));
			self_vob._zCVob_bbox3D_mins[2]=subf(self_wp.pos[2], mkf(5));*/
			
		};
	};
};
func int ZS_BeingTarget_loop()	{return LOOP_CONTINUE;};
func void ZS_BeingTarget_end()	{};


