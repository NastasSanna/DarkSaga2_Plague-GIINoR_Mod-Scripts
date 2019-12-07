
//болен. не говорит по-человечески
//позже может уйти к гоблинам
instance Orc_DS2P_ArTush(Npc_Default)
{
	name[0] = "Ар-Туш";
	guild = GIL_FRIENDLY_ORC;
	id = 1602;
	voice = 18;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	protection[PROT_BLUNT] = 100;	protection[PROT_EDGE] = 100;	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 100;		protection[PROT_FLY] = 100;	protection[PROT_MAGIC] = 25;
	B_SetFightSkills(self,70);
	fight_tactic = FAI_ORC;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_MM_REAL_ID] = ID_ORCWARRIOR;
	daily_routine = Rtn_Sick_1602;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"DS_OrcHead2",DEFAULT,DEFAULT,-1);
	Mdl_SetModelFatness(self,-1);
	EquipItem(self,ItMw_2H_OrcAxe_02);
};
const string WP_ArTush_Wait = "DP_WAIT_ORCS";	//UNFINISHED - где орки ждут ГГ

//UNFINISHED
func void Rtn_Sick_1602() //болен, без сознания
{
	TA_LIE_Always(8,0,22,0,"");
	TA_LIE_Always(22,0,8,0,"");
};

func void Rtn_Start_1602() //вылечен, с другом в лесу
{
	TA_SitOrk(7,35,12,21,"");
	TA_Smalltalk(12,21,14,45,""); //с Orc_DS2P_RakTarak
	TA_SitOrk(14,45,21,15,"");
	TA_sleeporc_campfire(21,15,7,35,"");
};
func void Rtn_Follow_1602()
{
	TA_Follow_Player(8,0,22,0, WP_ArTush_Wait);
	TA_Follow_Player(22,0,8,0, WP_ArTush_Wait);
};
func void Rtn_Wait_1602()
{
	TA_SitOrk(8,0,22,0, WP_ArTush_Wait);
	TA_SitOrk(22,0,8,0, WP_ArTush_Wait);
};
func void Rtn_GobboCamp_1602() //у гоблинов
{
};

