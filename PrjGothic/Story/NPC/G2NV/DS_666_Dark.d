
instance DS_666_Dark(Npc_Default)
{
	name[0] = "Темный";
	guild = GIL_NONE;
	level = 40;
	id = 666;
	voice = 1;
//	flags = NPC_FLAG_GHOST;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_IgnoresArmor] = TRUE;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	attribute[ATR_HITPOINTS_MAX] = 999;
	attribute[ATR_HITPOINTS] = 999;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_ImportantOld,BodyTex_L,ITAR_XARDAS);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_AddFightSkill(self,NPC_TALENT_1H,75);
	B_AddFightSkill(self,NPC_TALENT_2H,85);
	B_AddFightSkill(self,NPC_TALENT_BOW,75);
	B_AddFightSkill(self,NPC_TALENT_CROSSBOW,75);
	protection[PROT_BLUNT] = -1000;
	protection[PROT_EDGE] = -1000;
	protection[PROT_POINT] = -1000;
	protection[PROT_FIRE] = -1000;
	protection[PROT_FLY] = -1000;
	protection[PROT_MAGIC] = -1000;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_Start_666;
};
//в стартовой локации
func void Rtn_Start_666()
{
	TA_Stand_WP(7,55,19,55,"");
	TA_Stand_WP(19,55,7,55,"");
};

