
func void B_StartOtherRoutine(var C_Npc slf,var string newRoutine)
{
//	B_MM_DeSynchronize();
	var int msec;	msec = Hlp_Random(1000);
	AI_Waitms(slf,msec);
	AI_Standup(slf);
	if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(slf))
	{
		if(Hlp_IsValidNpc(slf) && !Npc_IsDead(slf))
		{
			Npc_ExchangeRoutine(slf,newRoutine);
			AI_ContinueRoutine(slf);
		};
	}
	else
	{
		Npc_ExchangeRoutine(slf,newRoutine);
	};
};

