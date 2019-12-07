
//====================================================
// для ТРИАЛОГОВ без LeGo
//      (или говорить, не поворачиваясь к ГГ)
// aivar[AIV_TALK_TRIA] = Hlp_GetInstanceID( <с кем говорим> );
//   можно в condition диалога
// завершение состояния только, когда self.aivar[AIV_INVINCIBLE] <= 0 !!!

var int zsTalkBugfix;

func void ZS_Talk()
{
	MEM_zCViewDialogChoice_Ptr = MEM_InformationMan.DlgChoice;
	var C_Npc target;
	var C_Npc TalkTo;	//с кем говорим (other или AIV_TALK_TRIA)
	TalkTo = Hlp_GetNpc(other);	//default
	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		return;
	};
	self.aivar[AIV_INVINCIBLE] = TRUE;
	other.aivar[AIV_INVINCIBLE] = TRUE;
	//NS (июл/2014) если говорим не с ГГ, то поворачиваемся к нему
	if (self.aivar[AIV_TALK_TRIA] > 0)
	{
		TalkTo = Hlp_GetNpc(self.aivar[AIV_TALK_TRIA]);	// а с кем?
	};
	//*/
	//*NS - 10/07/13
	if (C_NpcIs(self, Pir_204_DS2P_Karah) && !Npc_KnowsInfo(other,DIA_Karah_Start))
	{
		If((Npc_WasInState(self,ZS_DSG_Practice_RangedWeapon) && (self.aivar[AIV_LASTTARGET] != 0)))
		{
			pos_y_ds_log = 0;
			AI_ProcessInfos(self);
			zsTalkBugfix = FALSE;
			AI_ProcessInfos(self);
			return;
		};
	};
	//*/
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		AI_RemoveWeapon(self);
		if(C_BodyStateContains(self,BS_SIT))
		{
			target = Npc_GetLookAtTarget(self);
			if(!Hlp_IsValidNpc(target))
			{
				AI_LookAtNpc(self,TalkTo);
			};
		}
		else
		{
			B_LookAtNpc(self,TalkTo);
		};		
	};
	if(!C_BodyStateContains(self,BS_SIT))
	{
		B_TurnToNpc(self,TalkTo);
	};
	if(!C_BodyStateContains(TalkTo,BS_SIT))
	{
		B_TurnToNpc(TalkTo,self);
		if(Npc_GetDistToNpc(TalkTo,self) < 80)
		{
			AI_Dodge(TalkTo);
		};
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		if((Npc_GetAttitude(self,other) == ATT_ANGRY) || (Npc_GetAttitude(self,other) == ATT_HOSTILE))
		{
			if(!C_PlayerIsFakeBandit(self,other) || (self.guild != GIL_BDT))
			{
				Mdl_StartFaceAni(self,"S_ANGRY",1,-1);
			};
		};
		if((self.npcType == NPCTYPE_AMBIENT) || (self.npcType == NPCTYPE_PIR_AMBIENT) || (self.npcType == NPCTYPE_BAU_AMBIENT))
		{
			B_AssignAmbientInfos(self);			
		};
		if(self.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			B_Addon_GivePotion(self);
		};
		if(C_NpcIsToughGuy(self) && (self.aivar[AIV_ToughGuyNewsOverride] == FALSE))
		{
			B_AssignToughGuyNEWS(self);
		};
		if(C_NpcHasAmbientNews(self))
		{
			B_AssignAmbientNEWS(self);
		};
		//По Саге ===========================================
		if((self.npcType == npctype_main) && (self.guild != GIL_DMT))
		{
			B_DS_AssignTheftDialog(self);
		};
		//DSG ===============================================
		if(C_DS2P_HasPirateNews())
		{
			B_DSG_AssignAmbientNews_PIR(self);
		};
		//B_DS_AssignTestDialog(self,other);
	};
	pos_y_ds_log = 0;
	AI_ProcessInfos(self);
	zsTalkBugfix = FALSE;
};

func int ZS_Talk_Loop()
{
	var C_Npc target;
	if(InfoManager_HasFinished() && (zsTalkBugfix == TRUE))
	{
		/*
		if (Npc_CheckInfo(self,TRUE))
		{
			AI_ProcessInfos(self);
			zsTalkBugfix = FALSE;
			return LOOP_CONTINUE;
		};
		//*/
		// пока не закончился ТРИАЛОГ, не выходим из состояния
		other.aivar[AIV_INVINCIBLE] = FALSE;	//но ГГ свободен, может заговорить другой NPC
		if (self.aivar[AIV_TALK_TRIA] <= 0)	{
			self.aivar[AIV_INVINCIBLE] = FALSE;
			self.aivar[AIV_NpcStartedTalk] = FALSE;
			self.aivar[AIV_TalkedToPlayer] = TRUE;
			if(self.guild < GIL_SEPERATOR_HUM)
			{
				B_StopLookAt(self);
				Mdl_StartFaceAni(self,"S_NEUTRAL",1,-1);
			};
			if(self.guild == GIL_DRAGON)
			{
				AI_PlayAni(self,"T_TALK_2_STAND");
			};
			return LOOP_END;
		}
		else
		{
			return LOOP_CONTINUE;
		};		
	}
	else
	{
		zsTalkBugfix = TRUE;
		return LOOP_CONTINUE;
	};
};
func void ZS_Talk_End()
{
	B_DS2P_Talk_End(self,other);
	pos_y_ds_log = 0;
	Npc_SetRefuseTalk(other,20);
	if(C_NpcIsBotheredByPlayerRoomGuild(self) || ((Wld_GetPlayerPortalGuild() == GIL_PUBLIC) && (Npc_GetAttitude(self,other) != ATT_FRIENDLY)))
	{
		AI_StartState(self,ZS_ObservePlayer,0,"");
	}
	else
	{
	};
};


