
func int B_GetCurrentAbsolutionLevel(var C_Npc slf)
{
	if(C_NpcBelongsToPir(slf))			{	return ABSOLUTIONLEVEL_Pir;		};
	if(C_NpcBelongsToBau(slf))			{	return ABSOLUTIONLEVEL_Bau;	};
	if(C_NpcBelongsToPal(slf))			{	return ABSOLUTIONLEVEL_Pal;	};
	return 0;
};

