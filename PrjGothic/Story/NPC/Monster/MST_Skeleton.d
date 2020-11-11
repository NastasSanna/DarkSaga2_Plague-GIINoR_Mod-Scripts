
prototype Mst_Default_Skeleton(C_Npc)
{
	name[0] = "Скелет";
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	level = 25;
	B_DS_SetMst_Attribute(cMst_Default_Skeleton);
	protection[PROT_BLUNT] = 130;
	protection[PROT_EDGE] = 130;
	protection[PROT_POINT] = -1; //175;
	protection[PROT_FIRE] = 130;
	protection[PROT_FLY] = 130;
	protection[PROT_MAGIC] = 10;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_Skeleton()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Skeleton_DS_L",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Lesser_Skeleton()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Skeleton_DS_L",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_NewDs01_Skeleton()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Skeleton_DS_M",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_NewDs02_Skeleton()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Skeleton_DS_H",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Skeleton_ds_01(Mst_Default_Skeleton)
{
	B_SetVisuals_NewDs01_Skeleton();
	EquipItem(self,ItMw_2H_Sword_M_01);
};
instance Skeleton_ds_Shield_01(Mst_Default_Skeleton)
{
	attribute[ATR_REGENERATEMANA] = 100;
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Skeleton_DS_M",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	EquipItem(self,ItMw_1h_MISC_Sword);
	EquipItem(self,ITMW_DarkSaga_Shield_ds_04);
};
instance Skeleton_ds_Ghost_Shield_01(Mst_Default_Skeleton)
{
	flags = NPC_FLAG_GHOST;
	effect = "SPELLFX_VIOLETFIREARMOR";
	attribute[ATR_REGENERATEMANA] = 100;
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Skeleton_DS_M",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	EquipItem(self,ItMw_1h_MISC_Sword);
	EquipItem(self,ITMW_DarkSaga_Shield_ds_04);
};
instance Skeleton_l1_ds_Ghost_Shield_01(Mst_Default_Skeleton)
{
	level = 1;
	flags = NPC_FLAG_GHOST;
	effect = "SPELLFX_VIOLETFIREARMOR";
	attribute[ATR_REGENERATEMANA] = 100;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 380;
	attribute[ATR_HITPOINTS] = 380;
	protection[PROT_MAGIC] = -1;
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Skeleton_DS_M",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	EquipItem(self,ItMw_1h_MISC_Sword);
	EquipItem(self,ITMW_DarkSaga_Shield_ds_04);
};

instance Skeleton_ds_02(Mst_Default_Skeleton)
{
	B_SetVisuals_NewDs02_Skeleton();
	EquipItem(self,ItMw_2H_Sword_M_01);
};
instance Skeleton_ds_Shield_02(Mst_Default_Skeleton)
{
	attribute[ATR_REGENERATEMANA] = 100;
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Skeleton_DS_H",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	EquipItem(self,ItMw_Schwert);
	EquipItem(self,ITMW_DarkSaga_Shield_ds_04);
};

instance Skeleton(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_ShortSword3);
};
instance Skeleton_Amul(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_ShortSword3);
	CreateInvItem(self,ItAm_DS_Artefact_DarkWarrior_02);
};

instance Summoned_Skeleton(Mst_Default_Skeleton)
{
	name[0] = "Вызванный скелет";
	guild = gil_summoned_skeleton;
	aivar[AIV_MM_REAL_ID] = id_summoned_skeleton;
	level = 0;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 175;
	protection[PROT_FIRE] = 35;
	protection[PROT_FLY] = 125;
	fight_tactic = FAI_HUMAN_NORMAL;
	B_SetVisuals_Lesser_Skeleton();
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Lesser_Skeleton();
	EquipItem(self,ItMw_ShortSword3);
};

instance Lesser_Skeleton(Mst_Default_Skeleton)
{
	name[0] = "Малый скелет";
	level = 15;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 80;
	protection[PROT_EDGE] = 80;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 80;
	fight_tactic = FAI_HUMAN_NORMAL;
	B_SetVisuals_Lesser_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword);
};

//********************************
// Скелеты по квесту про пиратов
//********************************

prototype Mst_Default_Skeleton_Pirates(C_Npc)
{
	name[0] = "Мертвый пират";
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	level = 35;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 145;
	protection[PROT_EDGE] = 145;
	protection[PROT_POINT] = -1;
	protection[PROT_FIRE] = 45;
	protection[PROT_FLY] = 145;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_PirCap_Skeleton()
{
  Mdl_SetVisual(self,"HumanS.mds");
  Mdl_ApplyOverlayMds(self,"Hum_PirSab2.mds");
  Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
  Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
  Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
  Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
  Mdl_SetVisualBody(self,"Ske_PirCap_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_PirSail_Skeleton()
{
  Mdl_SetVisual(self,"HumanS.mds");
  Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
  Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
  Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
  Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
  Mdl_SetVisualBody(self,"Ske_PirSail_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Skeleton_Shard(Mst_Default_Skeleton_Pirates)
{
  name[0] = "Капитан Шард";
  aivar[AIV_EnemyOverride] = TRUE;
  fight_tactic = FAI_HUMAN_MASTER;
  B_SetVisuals_PirCap_Skeleton();
  EquipItem(self,ItMw_DS_Piratensaebel);
};

instance Skeleton_Sailor(Mst_Default_Skeleton_Pirates)
{
  name[0] = "Мертвый пират";
  fight_tactic = FAI_HUMAN_STRONG;
  B_SetVisuals_PirSail_Skeleton();
  EquipItem(self,ItMw_2H_Sword_M_01);
};

instance Skeleton_Sailor2x2(Mst_Default_Skeleton_Pirates)
{
	name[0] = "Мертвый пират";
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetVisuals_PirSail_Skeleton();
	Mdl_ApplyOverlayMds(self,"Hum_2x2L2.MDS");
	EquipItem(self,ItMw_Schwert);
	EquipItem(self,ITMW_DarkSaga_Sword_2x2_04);
};


// скелеты в храме-подвале паладинов с киркой

instance Axe_Skeleton(Mst_Default_Skeleton)
{
	name[0] = "Скелет рудокопа";
	level = 15;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 65;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 80;
	protection[PROT_POINT] = 330;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 30;
	fight_tactic = FAI_HUMAN_NORMAL;
	B_SetVisuals_NewDs01_Skeleton();
	EquipItem(self,ItMw_2H_Axe_L_01);
	CreateInvItems(self,ItMw_2H_Axe_L_01,1);
};

// from Mushroomers ============================================

instance Skeleton_Bow(Mst_Default_Skeleton)
{
	name[0] = "Скелет-лучник";
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_1h_MISC_Sword);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow, 10);
	CreateInvItems(self,ItAt_SkeletonBone,1);
};

instance Skeleton_CBow(Mst_Default_Skeleton)
{
	name[0] = "Скелет-арбалетчик";
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_1h_Misc_Axe);
	EquipItem(self,ItRw_Crossbow_M_01);
	CreateInvItems(self,ItRw_Bolt_01, 10);
	CreateInvItems(self,ItAt_SkeletonBone,1);
};

instance Skeleton_Miner(Mst_Default_Skeleton)
{
	name[0] = "Скелет шахтера";
	protection[PROT_BLUNT] += 20;
	protection[PROT_EDGE] += 20;
	protection[PROT_POINT] += 20;
	B_SetVisuals_Lesser_Skeleton();
	Mdl_SetVisualBody(self,"Ske_Prisoner",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	EquipItem(self,ItMw_2H_Axe_L_01);
	CreateInvItems(self,ItAt_SkeletonBone,1);
};

//new from redleha

func void ZS_Skel_ZOMBIE()
{
	self.senses = SENSE_SMELL;
	self.senses_range = 2000;
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_Skel_ZOMBIE_RISE);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};
func int ZS_Skel_ZOMBIE_Loop()
{
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni(self,"T_DOWN");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};
func void ZS_Skel_ZOMBIE_END()
{
};
func void B_Skel_ZOMBIE_RISE()
{
	if((Npc_GetDistToNpc(self,hero) <= 500) && Npc_CanSeeNpc(self,hero))
	{
		AI_PlayAni(self,"T_SPAWN");
		AI_StartState(self,ZS_MM_Attack,0,"");
		self.bodyStateInterruptableOverride = FALSE;
		self.start_aistate = ZS_MM_AllScheduler;
		self.aivar[AIV_MM_RestStart] = OnlyRoutine;
	};
};
instance Skel_Zombie01(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();
	EquipItem(self,ItMw_ShortSword3);
	start_aistate = ZS_Skel_ZOMBIE;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};
instance Skel_Zombie02(Mst_Default_Skeleton)
{
	B_SetVisuals_NewDs02_Skeleton();
	EquipItem(self,ItMw_2H_Sword_M_01);
	start_aistate = ZS_Skel_ZOMBIE;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

// финал
instance Skeleton_ds_FIN_01(Mst_Default_Skeleton)
{
	flags = NPC_FLAG_IMMORTAL;
	effect = "SPELLFX_VIOLETFIREARMOR";
	attribute[ATR_REGENERATEMANA] = 100;
	attribute[ATR_STRENGTH] = 480;
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Skeleton_DS_M",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	EquipItem(self,ItMw_1h_MISC_Sword);
	EquipItem(self,ITMW_DarkSaga_Shield_ds_04);
};
instance Skeleton_ds_FIN_02(Mst_Default_Skeleton)
{
	flags = NPC_FLAG_IMMORTAL;
	effect = "SPELLFX_VIOLETFIREARMOR";
	attribute[ATR_REGENERATEMANA] = 100;
	attribute[ATR_STRENGTH] = 580;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 380;
	attribute[ATR_HITPOINTS] = 380;
	protection[PROT_MAGIC] = -1;
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Skeleton_DS_M",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	EquipItem(self,ItMw_1h_MISC_Sword);
	EquipItem(self,ITMW_DarkSaga_Shield_ds_04);
};
