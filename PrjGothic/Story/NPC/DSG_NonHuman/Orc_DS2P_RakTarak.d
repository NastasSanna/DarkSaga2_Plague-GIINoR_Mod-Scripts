
//говорит по-человечески
//позже может уйти к гоблинам
instance Orc_DS2P_RakTarak(Npc_Default)
{
	name[0] = "Рак-Тарак";
	guild = GIL_FRIENDLY_ORC;
	id = 1601;
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
	daily_routine = Rtn_Guarding_1601;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"DS_OrcHead5",DEFAULT,DEFAULT,-1);
	EquipItem(self,ItMw_DSP_RakTarakAxe);
};
const string WP_RakTarak_Wait = "DP_WAIT_ORCS";	//UNFINISHED - где орки ждут ГГ

func void Rtn_Guarding_1601() //охраняет больного друга
{
	self.aivar[AIV_MaxDistToWp] = 3000;
	TA_Stand_Guarding(8,0,22,0,"");
	TA_Stand_Guarding(22,0,8,0,"");
};
func void Rtn_Start_1601() //друг вылечен, живут в лесу
{
	self.aivar[AIV_MaxDistToWp] = 0;
	TA_Stand_WP(7,35,12,21,"");
	TA_Smalltalk(12,21,14,45,""); //с Orc_DS2P_ArTush
	TA_Stand_WP(14,45,21,15,"");
	TA_sleeporc_campfire(21,15,7,35,"");
};
func void Rtn_Follow_1601()
{
	TA_Follow_Player(8,0,22,0, WP_RakTarak_Wait);
	TA_Follow_Player(22,0,8,0, WP_RakTarak_Wait);
};
func void Rtn_Wait_1601()
{
	TA_Stand_WP(8,0,22,0, WP_RakTarak_Wait);
	TA_Stand_WP(22,0,8,0, WP_RakTarak_Wait);
};
func void Rtn_GobboCamp_1601() //у гоблинов
{
};

