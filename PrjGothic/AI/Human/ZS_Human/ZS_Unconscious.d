
func void ZS_Unconscious()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	if(C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_Dead,0,"");
		return;
	};
	//NS - 18/07/2013
	B_DS2P_CheckLog_OnUnconscious(self);	//сюда пишем все квестовые проверки

	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	Npc_SetRefuseTalk(self,0);
	Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
	B_StopLookAt(self);
	AI_StopPointAt(self);
	if((self.guild < GIL_SEPERATOR_HUM) && Npc_IsPlayer(other))
	{
		/*FOR SHIELD*///AI_DropShield(self);//по идеи должно быть тут.
		self.aivar[AIV_DefeatedByPlayer] = TRUE;
		self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_LOST;
		if(self.aivar[AIV_ArenaFight] == AF_RUNNING)
		{
			self.aivar[AIV_ArenaFight] = AF_AFTER;
		};		
	};
	if(Npc_IsPlayer(self))
	{
		other.aivar[AIV_LastFightAgainstPlayer] = FIGHT_WON;
		if(other.aivar[AIV_ArenaFight] == AF_RUNNING)
		{
			other.aivar[AIV_ArenaFight] = AF_AFTER;
		};
	};
	//B_GiveTradeInv(self);	//NS - янв. 2014, больше не надо чистить инвентарь
	B_ClearRuneInv(self);
	//NS - 26/10/2013 я не понимаю, откуда они берутся!
	B_DS_RemoveFakeItems(self);
	if(Npc_IsPlayer(other) && (Npc_HasItems(self,ItMi_Nugget) >= 3))
	{
		Npc_RemoveInvItems(self,ItMi_Nugget,Npc_HasItems(self,ItMi_Nugget) - 3);
	};
	if((Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)) && Hlp_IsValidNpc(other) && (self.aivar[AIV_VictoryXPGiven] == FALSE))
	{
		B_GivePlayerXP(self.level * XP_PER_VICTORY);
		self.aivar[AIV_VictoryXPGiven] = TRUE;
	};
	B_DS_UnequipWeapons(self);	//Здесь было AI_UnequipWeapons(self);
	if(Npc_HasItems(self,ItMw_2H_Axe_L_02))
	{
		Npc_RemoveInvItems(self,ItMw_2H_Axe_L_02,Npc_HasItems(self,ItMw_2H_Axe_L_02));
	};
	self.aivar[AIV_Spell_4_Uncon] = FALSE;
};

func int ZS_Unconscious_Loop()
{
	if(Npc_GetStateTime(self) < self.aivar[AIV_TIME_UNCONSCIOUS])
	{
		return LOOP_CONTINUE;
	}
	else
	{
		return LOOP_END;
	};
};

func void ZS_Unconscious_End()
{
	self.aivar[AIV_RANSACKED] = FALSE;
	AI_Standup(self);
	if(Npc_IsPlayer(self))
	{
		return;
	};
	if(Npc_CanSeeNpcFreeLOS(self,other) && (Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT))
	{
		B_TurnToNpc(self,other);
			if(C_NpcIsToughGuy(self) && (Npc_GetPermAttitude(self,other) != ATT_HOSTILE) && (self.npcType != NPCTYPE_FRIEND))
			{
				B_Say_Overlay(self,other,"$NEXTTIMEYOUREINFORIT");
			}
			else
			{
				B_Say_Overlay(self,other,"$OHMYHEAD");
			};
	};
	Npc_PerceiveAll(self);
	if(Wld_DetectItem(self,ITEM_KAT_NF) || Wld_DetectItem(self,ITEM_KAT_FF))
	{
		if(Hlp_IsValidItem(item))	{
			if(Npc_GetDistToItem(self,item) <= 500)	{	AI_TakeItem(self,item);	};
		};
	};
	Npc_PerceiveAll(self);
	if(Wld_DetectItem(self,ITEM_KAT_NF) || Wld_DetectItem(self,ITEM_KAT_FF))
	{
		if(Hlp_IsValidItem(item))	{
			if(Npc_GetDistToItem(self,item) <= 500)	{	AI_TakeItem(self,item);	};
		};
	};
	AI_EquipBestMeleeWeapon(self);
	AI_EquipBestRangedWeapon(self);
	//NS - 02/07/2013 идем к ГГ, чтобы поговорить 
	if(Npc_CheckInfo(self,1) && Npc_IsPlayer(other))
	{
		AI_GotoNpc(self,other);
	};
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_StartState(self,ZS_HealSelf,0,"");
	};
};

