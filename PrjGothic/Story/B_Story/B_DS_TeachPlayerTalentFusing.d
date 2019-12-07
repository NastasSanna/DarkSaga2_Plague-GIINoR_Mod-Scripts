
func int B_DS_TeachPlayerTalentFusing(var C_Npc slf,var C_Npc oth,var int skill)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_FUSING,skill);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	b_dsg_log_openclose(TOPIC_TALENTFUSING,LOG_NOTE,-1,"Чтобы плавить самородки, прежде всего мне нужна форма для плавки. Я должен докрасна нагреть металл в огне плавильни, а затем перелить расплав в форму. Заготовки обрабатываются специальным молотом на станке для чеканки.");
	if(skill == FUSING_GOLD)
	{
		PLAYER_TALENT_FUSING[FUSING_GOLD] = TRUE;		
		Log_AddEntry(TOPIC_TALENTFUSING,"Из золотого самородка получается 10 заготовок. А из каждой заготовки можно отчеканить 4 монеты.");
	};
	if(skill == FUSING_MAGICORE)
	{
		PLAYER_TALENT_FUSING[FUSING_MAGICORE] = TRUE;
		Log_AddEntry(TOPIC_TALENTFUSING,"Из одного куска магической руды получается 10 заготовок для наконечников.");
	};
	if(skill == FUSING_SILVERORE)
	{
		PLAYER_TALENT_FUSING[FUSING_SILVERORE] = TRUE;
		Log_AddEntry(TOPIC_TALENTFUSING,"Из серебряного самородка получается 10 заготовок. А из каждой заготовки можно отчеканить 4 монеты или изготовить один наконечник.");
	};
	if(skill == FUSING_IRONORE)
	{
		PLAYER_TALENT_FUSING[FUSING_IRONORE] = TRUE;
		Log_AddEntry(TOPIC_TALENTFUSING,"Из одного куска железной руды можно выплавить 10 заготовок для наконечников, 3 прута сырой стали или 2 пластины для доспехов.");
	};
	if(skill == FUSING_BLACKORE)
	{
		PLAYER_TALENT_FUSING[FUSING_BLACKORE] = TRUE;
		Log_AddEntry(TOPIC_TALENTFUSING,"Из одного куска черной руды получается 10 заготовок для наконечников.");
	};
	if(Npc_GetTalentSkill(oth,NPC_TALENT_FUSING) == 0)
	{
		PrintScreen(PRINT_DS_LEARNFUSING,-1,YPOS_LOGENTRY - 4,FONT_Screen,3);
	};
	Npc_SetTalentSkill(oth,NPC_TALENT_FUSING,1);
	return TRUE;
};

