//NS - можно вообще снести
//const int ClearDeadTrader_Flag = 1 << 15;		//* NS - 24/01/2013 

func void B_ClearDeadTrader(var C_Npc Trader)
{
	Npc_ClearInventory(Trader);
	if(Trader.aivar[AIV_VictoryXPGiven] == FALSE)
	{
		B_CreateAmbientInv(Trader);
	};
	//Trader.aivar[AIV_ChapterInv] = Kapitel - 1;
};

