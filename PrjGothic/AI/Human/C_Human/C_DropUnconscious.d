var int Tamir_Monster_Unconscious_Count;
func int C_DropUnconscious()
{
	if(other.guild > GIL_SEPERATOR_HUM)
	{
		if((C_NpcIs(self, BAU_105_DS2P_Tamir)) && (MIS_DS2P_TamirChoice == LOG_Running))
		{
			if(Tamir_Monster_Unconscious_Count <= 2)
			{
				Tamir_Monster_Unconscious_Count += 1;
				return TRUE;
			}
			else
			{
				return FALSE;
			};			
		};			
		return FALSE;
	};
	if((other.guild == GIL_DMT) || (other.guild == GIL_BDT) || (other.aivar[AIV_DropDeadAndKill] == TRUE))
	{
		return FALSE;
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		if((self.guild != GIL_DMT) && (self.guild != GIL_BDT) && (self.aivar[AIV_DropDeadAndKill] == FALSE))
		{
			return TRUE;
		};
	};
	return FALSE;
};

