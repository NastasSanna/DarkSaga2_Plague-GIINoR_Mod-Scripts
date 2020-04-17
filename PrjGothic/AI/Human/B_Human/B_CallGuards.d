
func int C_WantToCallGuards(var C_Npc slf)
{
	if(self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		if((slf.guild == GIL_BAU) || (slf.guild == GIL_PIR) || (slf.guild == GIL_PIR2))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func void B_CallGuards()
{
	if(!C_WantToCallGuards(self))
	{
		return;
	};
	if((self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToKill) || (self.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight) || (self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToThief) || (self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToRoom))
	{
		B_Say_Overlay(self,other,"$ALARM");
		return;
	};
	if((self.aivar[AIV_ATTACKREASON] == AR_GuildEnemy) || (self.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman))
	{
		if((self.guild == GIL_PIR) || (self.guild == GIL_PIR2))
		{
			B_Say_Overlay(self,other,"$ALARM");
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
			return;
		};
		if(!C_NpcIsToughGuy(self))
		{
			B_Say_Overlay(self,other,"$GUARDS");
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
			return;
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder)
	{
		B_Say_Overlay(self,other,"$ALARM");
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		return;
	};
	if((self.aivar[AIV_ATTACKREASON] == AR_Theft) || (self.aivar[AIV_ATTACKREASON] == AR_UseMob))
	{
		if(!C_NpcIsToughGuy(self))
		{
			B_Say_Overlay(self,other,"$GUARDS");
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon)
	{
		if(!C_NpcIsToughGuy(self))
		{
			B_Say_Overlay(self,other,"$GUARDS");
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_ClearRoom)
	{
		if((self.guild == GIL_PIR) || (self.guild == GIL_PIR2))
		{
			B_Say_Overlay(self,other,"$ALARM");
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
			return;
		};
		if(!C_NpcIsToughGuy(self))
		{
			B_Say_Overlay(self,other,"$GUARDS");
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
			return;
		};
		return;
	};
};

