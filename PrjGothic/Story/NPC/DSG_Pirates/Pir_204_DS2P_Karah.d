instance Pir_204_DS2P_Karah(Npc_Default)
{
	name[0] = "Карах";
	guild = GIL_PIR;
	id = 204;
	voice = 13;
	flags = 0;
	npcType = npctype_pir_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_Tough_Santino,BodyTex_L,ITAR_PIR_LL_DS);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_PreStart_204;
	EquipItem(self,ItMw_Doppelaxt);
			CreateInvItems(self,ItRw_Bolt_01,10);
			CreateInvItems(self,ItRw_Crossbow_H_01,1);
};
func void Rtn_PreStart_204()	//Стоит, встречает ГГ
{
	TA_Practice_RangedWeapon(8,0,12,0,"WP_TARGET_TRAINPOS_01");
	TA_Practice_RangedWeapon(12,0,18,0,"WP_TARGET_TRAINPOS_02");
	TA_Practice_RangedWeapon(18,0,22,0,"WP_TARGET_TRAINPOS_03");
	TA_Stand_WP(22,0,8,0,"WP_TARGET_TRAINPOS_01");
	/*TA_Stand_WP(8,0,20,0,"");
	TA_Stand_WP(20,0,8,0,"");*/
};
func void Rtn_Start_204()	//Обычное расписание в деревне
{
	TA_Stand_WP(8,0,20,0,"");
	TA_Stand_WP(20,0,8,0,"");
};
func void Rtn_GB_COMPETITION_204()	//Смотрит соревнование ГГ и Серой Бороды
{
	TA_Stand_WP(8,0,20,0,"");
	TA_Stand_WP(20,0,8,0,"");
};