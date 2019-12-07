
func int B_GetTotalPetzCounter(var C_Npc slf)
{
	if(C_NpcBelongsToPir(slf))
	{
		return PETZCOUNTER_PIR_MURDER + PETZCOUNTER_PIR_THEFT + PETZCOUNTER_PIR_ATTACK;
	};
	if(C_NpcBelongsToBau(slf))
	{
		return PETZCOUNTER_PIR_MURDER + PETZCOUNTER_BAU_THEFT + PETZCOUNTER_BAU_ATTACK + PETZCOUNTER_BAU_SheepKiller;
	};
	if(C_NpcBelongsToPAL(slf))
	{
		return PETZCOUNTER_PAL_MURDER + PETZCOUNTER_PAL_THEFT + PETZCOUNTER_PAL_ATTACK;
	};
	return 0;
};

