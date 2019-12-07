
instance PC_PlayerSoul(Npc_Default)
{
	name[0] = "Душа";
	guild = GIL_NONE;
	id = 77777;
	voice = 15;
	level = 0;
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	bodyStateInterruptableOverride = TRUE;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	attribute[ATR_HITPOINTS_MAX] = 50;
	attribute[ATR_HITPOINTS] = 50;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",9,0,"DS_Head",0,0,FALSE);
};