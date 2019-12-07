instance OUT_402_DSG_RakTarak(Npc_Default)
{
	name[0] = "Рак-Тарак";
	guild = GIL_OUT;
	id = 402;
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
	daily_routine = rtn_start_402;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"DS_OrcHead5",DEFAULT,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_03);
};
func void Rtn_Start_402()
{
};
