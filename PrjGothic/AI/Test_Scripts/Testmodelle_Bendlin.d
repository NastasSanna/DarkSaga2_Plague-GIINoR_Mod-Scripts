
const int Value_Sc_SummonMud = 300;

instance ItSc_SummonMud(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = Value_Sc_SummonMud;
	visual = "ItSc_SumDemon.3DS";
	material = MAT_LEATHER;
	spell = SPL_SummonMud;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_SummonMud;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Aya_Testmodell(Npc_Default)
{
	name[0] = "Aya";
	guild = GIL_NONE;
	id = 55555;
	voice = 16;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	fight_tactic = FAI_HUMAN_MASTER;
	daily_routine = Rtn_Start_55555;
	bodyStateInterruptableOverride = TRUE;
	aivar[AIV_RANSACKED] = TRUE;
	aivar[AIV_DeathInvGiven] = TRUE;
	aivar[AIV_VictoryXPGiven] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	B_SetAttributesToChapter(self,6);
	B_SetFightSkills(self,100);
	B_GiveNpcTalents(self);
	EquipItem(self,ItMw_BeliarWeapon_Fire);
	CreateInvItems(self,ITAR_BauBabe_L,1);
	CreateInvItems(self,ITAR_BauBabe_M,1);
	CreateInvItems(self,ITAR_VlkBabe_L,1);
	CreateInvItems(self,ITAR_VlkBabe_M,1);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe",FaceBabe_N_BlackHair,BodyTexBabe_S,ITAR_VlkBabe_H);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
};
func void Rtn_Start_55555()
{
	TA_Stand_ArmsCrossed(6,0,23,0,"XXX");
	TA_Stand_ArmsCrossed(23,0,6,0,"XXX");
};
func void Rtn_Follow_55555()
{
	TA_Follow_Player(8,0,23,0,"XXX");
	TA_Follow_Player(23,0,8,0,"XXX");
};

