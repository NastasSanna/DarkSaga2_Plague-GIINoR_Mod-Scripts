
instance PC_DSG_MARVIN(Npc_Default)
{
	name[0] = "Марвин";
	guild = GIL_VLK;
	id = 3131;
	npcType = npctype_main;
	flags = 0;
	voice = 12;
	level = 35;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 140;
	protection[PROT_EDGE] = 140;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 140;
	protection[PROT_FLY] = 140;
	protection[PROT_MAGIC] = 75;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	HitChance[NPC_TALENT_BOW] = 70;
	HitChance[NPC_TALENT_CROSSBOW] = 70;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_MM_REAL_ID] = ID_ORCWARRIOR;
	//Mdl_SetVisual(self,"Orc.mds");
	//Mdl_SetVisualBody(self,"Orc_BodyShaman",DEFAULT,DEFAULT,"Orc_HeadShaman",DEFAULT,DEFAULT,-1);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",9,0,"DS_Head",0,0,ITAR_Vlk_H);
	//EquipItem(self,ItMw_2H_OrcAxe_02);
	daily_routine = rtn_start_3131;
	EquipItem(self,ItMw_1h_Shpaga);
};
func void rtn_start_3131()
{
	TA_Stand_WP(8,0,23,0,"");
	TA_Stand_WP(23,0,8,0,"");
};

