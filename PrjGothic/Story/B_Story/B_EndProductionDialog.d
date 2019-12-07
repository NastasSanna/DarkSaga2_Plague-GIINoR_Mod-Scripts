
func void B_EndProductionDialog()
{
	AI_StopProcessInfos(self);
	AI_StopProcessInfos(hero);
	Wld_StopEffect("DEMENTOR_FX");
	self.aivar[AIV_INVINCIBLE] = FALSE;
	hero.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};

