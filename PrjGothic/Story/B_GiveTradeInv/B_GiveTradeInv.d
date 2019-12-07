
func void B_GiveTradeInv(var C_Npc slf)
{
	//NS - 01/05/15 переделано через отдельные инвентари торговцев
	var C_Npc trd_Joseph;	trd_Joseph = Hlp_GetNpc(PIR_205_DS2P_Joseph);
	var C_Npc trd_Zedd;		trd_Zedd = Hlp_GetNpc(PIR_203_DS2P_Zedd);
	var C_Npc trd_KuLa;		trd_Zedd = Hlp_GetNpc(Gobbo_DS2P_KuLa);
	var C_Npc trd_Ekor;		trd_Ekor = Hlp_GetNpc(OUT_400_DS2P_Ekor);
	
	//B_ClearRuneInv(slf);
	if(slf.aivar[AIV_ChapterInv] <= Kapitel)
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_Joseph))
		{
			//B_ClearJunkTradeInv(slf);
			B_GivetTradeInv_DSG_Joseph(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_Zedd))
		{
			//B_ClearJunkTradeInv(slf);
			B_GivetTradeInv_DSG_Zedd(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_KuLa))
		{
			//B_ClearJunkTradeInv(slf);
			B_GivetTradeInv_DSG_KuLa(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_KuLa))
		{
			//B_ClearJunkTradeInv(slf);
			B_GivetTradeInv_DSG_KuLa(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_Ekor))
		{
			//B_ClearJunkTradeInv(slf);
			B_GivetTradeInv_DSG_Ekor(slf);
		};
		slf.aivar[AIV_ChapterInv] = Kapitel + 1;
	};
	/*
	if(Npc_IsInState(slf,ZS_Dead) || Npc_IsInState(slf,ZS_Unconscious))
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_gerard))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_Joseph))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_Zedd))
		{
			B_ClearDeadTrader(slf);
		};
	};
	*/
};
