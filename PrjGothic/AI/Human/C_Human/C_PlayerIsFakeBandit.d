
func int C_PlayerIsFakeBandit(var C_Npc slf,var C_Npc oth)
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
	if(slf.guild == GIL_PIR)
	{
		return FALSE;
	};
	if(Npc_HasEquippedArmor(oth) == TRUE)
	{
		itm = Npc_GetEquippedArmor(oth);
		if((Hlp_IsItem(itm,ItAr_BDT_M) == TRUE) || (Hlp_IsItem(itm,ITAR_Thorus_Addon) == TRUE) || (Hlp_IsItem(itm,ItAr_BDT_H) == TRUE))
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

func int C_PlayerIsNotOrc(var C_Npc slf,var C_Npc oth)
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
//	if(slf.guild == GIL_PIR)
//	{
//		return FALSE;
//	};
	if(Npc_HasEquippedArmor(oth) == TRUE)
	{
		itm = Npc_GetEquippedArmor(oth);
		if((Hlp_IsItem(itm,ITAR_DS_PRISONER) == TRUE) || (Hlp_IsItem(itm,ITAR_Prisoner) == TRUE) 
		|| (Hlp_IsItem(itm,ITAR_Armor_SldOrks_01) == TRUE) || (Hlp_IsItem(itm,ITAR_Armor_SldOrks_02) == TRUE) 
		|| (Hlp_IsItem(itm,ITAR_Armor_SldOrks_03) == TRUE) || (Hlp_IsItem(itm,ITAR_Vlk_H) == TRUE)
		|| (Hlp_IsItem(itm,ITAR_PIR_BABE4_DS) == TRUE) || (Hlp_IsItem(itm,ITAR_PIR_LL_DS) == TRUE) 
		|| (Hlp_IsItem(itm,ITAR_PIR_L_DS) == TRUE) || (Hlp_IsItem(itm,ITAR_PIR_M_DS) == TRUE) 
		|| (Hlp_IsItem(itm,ITAR_PIR_H_Addon) == TRUE) || (Hlp_IsItem(itm,ITAR_PIR_H_NOHEAD) == TRUE)  
		|| (Hlp_IsItem(itm,ITAR_PIR_H_Retex) == TRUE)
		|| (Hlp_IsItem(itm,ItAr_RobePriest) == TRUE) || (Hlp_IsItem(itm,ItAr_ArmorGuard) == TRUE) 
		|| (Hlp_IsItem(itm,ITAR_KarAKam_INNOS_DS) == TRUE) || (Hlp_IsItem(itm,ITAR_KarAKam_BELIAR_DS) == TRUE)
		|| (Hlp_IsItem(itm,ItAr_RobeNecrom) == TRUE) || (Hlp_IsItem(itm,ItAr_RobestudentofPriest) == TRUE) 
		|| (Hlp_IsItem(itm,ItAr_RobeOfDarkMage) == TRUE))
		{
			return false;
		}
		else
		{
			return true;
		};
	};
	return FALSE;
};

