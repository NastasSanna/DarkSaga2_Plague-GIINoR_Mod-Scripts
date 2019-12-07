
func void ZS_HealSelf()
{
	Perception_Set_Minimal();
};

func int ZS_HealSelf_Loop()
{
	if(self.attribute[ATR_HITPOINTS] == self.attribute[ATR_HITPOINTS_MAX])
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	//NS: орки не будут лечиться, иначе зависают - не могут использовать зелья
	if ((self.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR) || (self.aivar[AIV_MM_REAL_ID] == ID_ORCELITE)
		|| (self.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN) || (self.aivar[AIV_MM_REAL_ID] == ID_ORCTOWER))
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	// на всякий пожарный
	if (Npc_GetStateTime(self) > 15)
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	if(Npc_HasItems(self,ItPo_Health_03))
	{
		AI_UseItem(self,ItPo_Health_03);
		return LOOP_CONTINUE;
	}
	else if(Npc_HasItems(self,ItPo_Health_02))
	{
		AI_UseItem(self,ItPo_Health_02);
		return LOOP_CONTINUE;
	}
	else if(Npc_HasItems(self,ItPo_Health_01))
	{
		AI_UseItem(self,ItPo_Health_01);
		return LOOP_CONTINUE;
	}
	else if(Npc_HasItems(self,ItFo_DS_WaterMega))
	{
		AI_UseItem(self,ItFo_DS_WaterMega);
		return LOOP_CONTINUE;
	}
	else
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
};

func void ZS_HealSelf_End()
{
};

