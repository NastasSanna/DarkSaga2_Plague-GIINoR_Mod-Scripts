
prototype Mst_Skeleton_Lord(C_Npc)
{
	name[0] = "Теневой воин";
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	level = 35;
	B_DS_SetMst_Attribute(cMst_Skeleton_Lord);
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = -1;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 120;
	protection[PROT_MAGIC] = 30;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	//EquipItem(self,ItMw_Zweihaender2);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_Skeleton_Lord()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	B_SetNpcVisual(self,MALE,"Ske_Head",0,0,itar_pal_skel);
};

instance Skeleton_Lord(Mst_Skeleton_Lord)
{
	B_SetVisuals_Skeleton_Lord();
	EquipItem(self,ItMw_Zweihaender2);
};

instance Skeleton_Ghost_Lord(Mst_Skeleton_Lord)
{
	flags = NPC_FLAG_GHOST;
	effect = "SPELLFX_VIOLETFIREARMOR";
	B_SetVisuals_Skeleton_Lord();
	EquipItem(self,ItMw_Zweihaender2);
};
instance Skeleton_l2_Ghost_Lord(Mst_Skeleton_Lord)
{
	level = 3;
	flags = NPC_FLAG_GHOST;
	effect = "SPELLFX_VIOLETFIREARMOR";
	B_SetVisuals_Skeleton_Lord();
	EquipItem(self,ItMw_Zweihaender2);
	protection[PROT_MAGIC] = -1;
};
//------------------ DARKSAGA II: Prolog --------------------
// UNFINISED добавить артефакт/оружие
instance Skeleton_Lord_DS2P_GraniteGrave(Mst_Skeleton_Lord)
{
	B_SetVisuals_Skeleton_Lord();
	EquipItem(self,ItMw_Zweihaender2);
};
// Стражи кладбища
instance Skeleton_GraveKeeper_Emerald(Mst_Skeleton_Lord)
{
	name[0] = "Призрачный страж";
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	effect = "SPELLFX_VIOLETFIREARMOR";
	B_SetVisuals_Skeleton_Lord();
	EquipItem(self,ItMw_Zweihaender2);
	protection[PROT_MAGIC] = -1;
	CreateInvItems(self,ItKe_Emerald,1);
};
instance Skeleton_GraveKeeper_Topaz(Mst_Skeleton_Lord)
{
	name[0] = "Призрачный страж";
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	effect = "SPELLFX_VIOLETFIREARMOR";
	B_SetVisuals_Skeleton_Lord();
	EquipItem(self,ItMw_Zweihaender2);
	protection[PROT_MAGIC] = -1;
	CreateInvItems(self,ItKe_Topaz,1);
};

