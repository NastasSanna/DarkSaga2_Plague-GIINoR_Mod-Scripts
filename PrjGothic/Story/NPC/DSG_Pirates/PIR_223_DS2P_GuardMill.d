//*NS - 09/05/16
// охранник у мельницы, сторожит муку от гоблинов
instance PIR_223_DS2P_GuardMill(Npc_Default)
{
	name[0] = "Охранник";
	guild = GIL_PIR;
	id = 223;
	voice = 13;
	npcType = NPCTYPE_PIR_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Addon_PIR1hSword);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Tough_Drago,BodyTex_P,ITAR_PIR_M_DS);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_223;
};
func void Rtn_Start_223()
{
	//днем спит
	TA_Sleep(8,30,19,0,"DP_FORT_TOWN_HOUSE03_IN_BED01");
	//ночью сторожит мельницу
	TA_Stand_Guarding(19,0,8,30,"DP_FORT_TOWN_MILL_ENTRANCE");
};