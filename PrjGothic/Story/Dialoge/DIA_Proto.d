
func void b_endproductiondialog()
{
	AI_StopProcessInfos(self);
	AI_StopProcessInfos(hero);
	Wld_StopEffect("DEMENTOR_FX");
	self.aivar[AIV_INVINCIBLE] = FALSE;
	hero.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};
// =================================
func int DIA_NoCond_cond()
{
	return TRUE;
};
// =================================
func int DIA_WhenAsked_cond()
{
	if (Npc_IsInState(self, ZS_Talk) &&  !self.aivar[AIV_NpcStartedTalk])	{ return TRUE;};
};
// =================================
prototype DIA_Proto_End(C_INFO)
{
	nr = 999;
	condition = DIA_NoCond_cond;
	information = DIA_Proto_End_info;
	description = Dialog_Ende;
	permanent = true;
};
func void DIA_Proto_End_info()
{
	AI_StopProcessInfos(self);
};



/*

instance DIA__EXIT(DIA_Proto_End)
{
	npc = ;
};

instance DIA_Speaker_dlg(C_INFO)
{
	npc = GIL_xxx_Speaker;
	nr = 0;
	condition = DIA_Speaker_dlg_cond;
	information = DIA_Speaker_dlg_info;
	description = "";
	permanent = true;
	important = true;

};

*/