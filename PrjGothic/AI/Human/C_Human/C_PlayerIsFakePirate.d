
func int C_PlayerIsFakePirate(var C_Npc slf,var C_Npc oth)
{
	var C_Item itm;
	if(slf.aivar[AIV_IgnoresArmor] == TRUE)
	{
		return FALSE;
	};
	if(slf.aivar[AIV_IgnoresFakeGuild] == TRUE)
	{
		return FALSE;
	};
	if(Npc_HasEquippedArmor(other) == TRUE)
	{
		itm = Npc_GetEquippedArmor(oth);
		if((Hlp_IsItem(itm,ITAR_PIR_L_DS) == TRUE) || (Hlp_IsItem(itm,ITAR_PIR_M_DS) == TRUE) || (Hlp_IsItem(itm,ITAR_PIR_H_Addon) == TRUE)
		|| (Hlp_IsItem(itm,ITAR_PIR_H_NOHEAD) == TRUE) || (Hlp_IsItem(itm,ITAR_PIR_H_Retex) == TRUE)	
		|| (Hlp_IsItem(itm,ITAR_PIR_M_DS) == TRUE) || (Hlp_IsItem(itm,ITAR_PIR_LL_DS) == TRUE) || (Hlp_IsItem(itm,ITAR_PIR_L_DS) == TRUE))
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	return FALSE;
};



