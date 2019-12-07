
func void ZS_Stand_ReadyWeapon()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	AI_EquipBestMeleeWeapon(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Stand_ReadyWeapon_loop()
{
	var int random;
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(!Npc_HasEquippedMeleeWeapon(self))
		{
			CreateInvItems(self,ItMw_1h_Bau_Mace,1);
			AI_EquipBestMeleeWeapon(self);
		};
		/*FOR SHIELD*///	AI_ReadyMeleeWeapon_ds(slf);
		AI_ReadyMeleeWeapon(self);
		AI_PlayAni(self,"T_STAND_2_LGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if((Npc_GetStateTime(self) > 5) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		random = Hlp_Random(20);
		if(random < 3)					{	AI_PlayAni(self,"T_LGUARD_SCRATCH");		}
		else if((random > 6) && (random < 9))		{		AI_PlayAni(self,"T_LGUARD_STRETCH");		}
		else if(random > 17)	{	AI_PlayAni(self,"T_LGUARD_CHANGELEG");	};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};
func void ZS_Stand_ReadyWeapon_end()
{
	AI_PlayAni(self,"T_LGUARD_2_STAND");
};

