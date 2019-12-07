
func void ZS_RansackBody()
{
	Perception_Set_Normal();
	AI_Standup(self);
	AI_GotoNpc(self,other);
};

func int ZS_RansackBody_Loop()
{
	return LOOP_END;
};

func void ZS_RansackBody_End()
{
	var int x;
	var int y;
	B_TurnToNpc(self,other);
	if(self.guild == GIL_NONE)
	{
		AI_PlayAni(self,"T_PLUNDER");
		if(Npc_HasItems(other,ItMi_Nugget))
		{
			y = Npc_HasItems(other,ItMi_Nugget);
			CreateInvItems(self,ItMi_Nugget,y);
			Npc_RemoveInvItems(other,ItMi_Nugget,y);
			//B_Say(self,other,"$ABS_GOOD");
			B_Say(self,other,"$ITOOKYOURORE");
		}
		else
		{
			B_Say(self,other,"$SHITNOORE");
		};
	};
	if(other.aivar[AIV_TIME_UNCONSCIOUS] == HAI_TIME_UNCONSCIOUS)
	{
		AI_PlayAni(self,"T_PLUNDER");
		if(Npc_HasItems(other,ItMi_Gold))
		{
			x = Npc_HasItems(other,ItMi_Gold);
			CreateInvItems(self,ItMi_Gold,x);
			Npc_RemoveInvItems(other,ItMi_Gold,x);
			B_Say(self,other,"$ITOOKYOURGOLD");
		}
		else
		{
			if(self.guild != GIL_NONE)
			{
				B_Say(self,other,"$SHITNOGOLD");
			};
		};
	};	
	Npc_PerceiveAll(self);
	if(self.guild == GIL_NONE)
	{
		if(Wld_DetectItem(self,ITEM_KAT_MAGIC))
		{
			if(Hlp_IsValidItem(item))
			{
				AI_TakeItem(self,item);
				AI_EquipBestMeleeWeapon(self);
				AI_EquipBestRangedWeapon(self);
			};
		};
	}
	else if(Wld_DetectItem(self,ITEM_KAT_NF) || Wld_DetectItem(self,ITEM_KAT_FF))
	{
		if(Hlp_IsValidItem(item) && (self.guild != GIL_NONE))
		{
			if(Npc_GetDistToItem(self,item) < 500)
			{
				AI_TakeItem(self,item);
				B_Say(self,self,"$ITAKEYOURWEAPON");
				//AI_EquipBestMeleeWeapon(self);
				//AI_EquipBestRangedWeapon(self);
			};
		};
	};
	Npc_PerceiveAll(self);
	if(Wld_DetectItem(self,ITEM_KAT_NF) || Wld_DetectItem(self,ITEM_KAT_FF))
	{
		if(Hlp_IsValidItem(item) && (self.guild != GIL_NONE))	{
			if(Npc_GetDistToItem(self,item) <= 500)	{	AI_TakeItem(self,item);	};
		};
	};
	AI_EquipBestMeleeWeapon(self);
	AI_EquipBestRangedWeapon(self);
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_StartState(self,ZS_HealSelf,0,"");
		return;
	};
};

func void ZS_GetMeat()
{
	var int x;
	Perception_Set_Minimal();
	AI_Standup(self);
	AI_GotoNpc(self,other);
	AI_TurnToNPC(self,other);
	AI_PlayAni(self,"T_PLUNDER");
	x = Npc_HasItems(other,ItFoMuttonRaw);
	CreateInvItems(self,ItFoMuttonRaw,x);
	Npc_RemoveInvItems(other,ItFoMuttonRaw,x);
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_StartState(self,ZS_HealSelf,0,"");
		return;
	};
};

func void zs_getmandibles()
{
	var int x;
	Perception_Set_Minimal();
	AI_Standup(self);
	AI_GotoNpc(self,other);
	AI_TurnToNPC(self,other);
	AI_FinishingMove(self,other);
	AI_PlayAni(self,"T_PLUNDER");
	AI_FinishingMove(self,other);
	AI_PlayAni(self,"T_PLUNDER");
	x = Npc_HasItems(other,ItAt_CrawlerMandibles);
	CreateInvItems(self,ItAt_CrawlerMandibles,x);
	Npc_RemoveInvItems(other,ItAt_CrawlerMandibles,x);
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_StartState(self,ZS_HealSelf,0,"");
		return;
	};
};

