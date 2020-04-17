
func void B_AssessTalk()
{
	var int rnd;
	if(self.guild > GIL_SEPERATOR_HUM)
	{
		if(Npc_CheckInfo(self,1) == FALSE)
		{
			if(Npc_CheckInfo(self,0) == FALSE)
			{
				return;
			};
		};
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		if(B_AssessEnemy())
		{
			return;
		};
		if((B_GetPlayerCrime(self) == CRIME_MURDER) && C_WantToAttackMurder(self,other))
		{
			B_Attack(self,other,AR_HumanMurderedHuman,0);
			return;
		};
		if(C_PlayerIsFakeBandit(self,other) && (self.guild != GIL_BDT))
		{
			B_Attack(self,other,AR_GuildEnemy,0);
			return;
		};
		if(C_RefuseTalk(self,other))
		{
			B_Say(self,other,"$NOTNOW");
		};
	};
	if(self.aivar[AIV_NpcStartedTalk] == FALSE)
	{
		if(C_BodyStateContains(self,BS_WALK) || C_BodyStateContains(self,BS_RUN))
		{
			B_Say(other,self,"$SC_HEYWAITASECOND");
		}
		else if(!Npc_CanSeeNpc(self,other))
		{
			rnd = Hlp_Random(100);
			if(rnd <= 25)
			{
				B_Say(other,self,"$SC_HEYTURNAROUND");
			}
			else if(rnd <= 50)
			{
				B_Say(other,self,"$SC_HEYTURNAROUND02");
			}
			else if(rnd <= 75)
			{
				B_Say(other,self,"$SC_HEYTURNAROUND03");
			}
			else if(rnd <= 99)
			{
				B_Say(other,self,"$SC_HEYTURNAROUND04");
			};
		};
	};	
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	if(C_BodyStateContains(self,BS_SIT))
	{
		if(self.aivar[AIV_NpcStartedTalk] == TRUE)
		{
			AI_StandupQuick(other);
		}
		else
		{
			AI_Standup(other);
		};
		if(Npc_CanSeeNpc(self,other))
		{
			AI_StartState(self,ZS_Talk,0,"");
		}
		else
		{
			if(Npc_IsInState(self,ZS_ObservePlayer))
			{
				AI_Standup(self);
			};
			AI_StartState(self,ZS_Talk,1,"");
		};
		return;
	}
	else
	{
		if(self.aivar[AIV_NpcStartedTalk] == TRUE)
		{
			AI_StandupQuick(self);
			AI_StandupQuick(other);
		}
		else
		{
			AI_Standup(self);
			AI_Standup(other);
		};
		AI_StartState(self,ZS_Talk,0,"");
		return;
	};
};

