
func void B_DS2P_InitLanSkeleton()
{
	if (Lan_BecameHuman == TRUE)
	{
		var C_NPC Lan; Lan = Hlp_GetNpc(PIR_207_DS2P_LanSkeleton);
		B_SetNpcVisual(Lan,MALE,"Hum_Head_Bald",Face_L_ToughBald01,BodyTex_L,ITAR_PIR_M_DS);
	};
};