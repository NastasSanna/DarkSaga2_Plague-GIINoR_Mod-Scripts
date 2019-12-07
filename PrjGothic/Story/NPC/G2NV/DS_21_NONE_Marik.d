
instance DS_21_MARIK(Npc_Default)
{
	name[0] = "Марик";
	guild = GIL_NONE;
	id = 21;
	voice = 9;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_FollowDist] = 700;
	B_SetAttributesToChapter(self,4);
	protection[PROT_FALL] = -1;
	fight_tactic = FAI_HUMAN_STRONG;
	CreateInvItems(self,ItMi_OldCoin,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Lares,BodyTex_N,itar_ds_prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = rtn_prestart_21;
};
func void rtn_prestart_21()
{
	TA_Follow_Player(8,0,20,0,"OM_PLATFORM_MARIK_START");
	TA_Follow_Player(20,0,8,0,"OM_PLATFORM_MARIK_START");
};

