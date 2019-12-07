
instance PIR_201_DS2P_Greg(Npc_Default)
{
	name[0] = "Грег";
	guild = GIL_PIR;
	id = 201;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Piratensaebel);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_P_Greg,BodyTex_P,ITAR_PIR_H_NOHEAD);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_201;
};
func void Rtn_Start_201()	//Стоит, встречает ГГ
{
	TA_Stand_WP(8,0,20,0,"");
	TA_Stand_WP(20,0,8,0,"");
};
func void Rtn_TalkToGard_201()	//Разговор с Гардом в ратуше
{
	TA_Stand_WP(8,0,20,0,"");
	TA_Stand_WP(20,0,8,0,"");
};
func void Rtn_AfterTalkToGard_201()	//В ратуше, стоит в сторонке от Гарда
{
	TA_Stand_WP(8,0,20,0,"");
	TA_Stand_WP(20,0,8,0,"");
};
func void Rtn_TalkToHero_201()	//В отдельной комнате в ратуше, подальше от Грега
{
	TA_Stand_WP(8,0,20,0,"");
	TA_Stand_WP(20,0,8,0,"");
};
func void Rtn_Main_201()	//Обычное расписание в деревне
{
	TA_Stand_WP(8,0,20,0,"");
	TA_Stand_WP(20,0,8,0,"");
};
func void Rtn_GB_COMPETITION_201()	//Стоит смотрит соревнование ГГ и Серой Бороды
{
	TA_Stand_WP(8,0,20,0,"");
	TA_Stand_WP(20,0,8,0,"");
};

