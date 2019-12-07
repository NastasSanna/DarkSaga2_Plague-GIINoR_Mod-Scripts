instance DIA_YahYah_EXIT(C_Info)
{
	npc = Gobbo_DS2P_YahYah;
	nr = 999;
	permanent = TRUE;
	condition = DIA_YahYah_EXIT_condition;	
	information = DIA_YahYah_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_YahYah_EXIT_condition(){	return TRUE;};
func void DIA_YahYah_EXIT_info(){	AI_StopProcessInfos(self);};

//NS - 06/03/2016 ===========
// Знакомство 
//===========================
//заговаривает сам при первой встрече
instance DIA_YahYah_Hello(C_Info)
{
	npc = Gobbo_DS2P_YahYah;					nr = 1;
	condition = DIA_YahYah_Hello_condition;	
	information = DIA_YahYah_Hello_info;
	important = TRUE;
};
func int DIA_YahYah_Hello_condition(){	return TRUE;};
func void DIA_YahYah_Hello_info()
{	
		AI_Output(self,other,"DIA_YahYah_Hello_18_01");	//(угрожающе) Ухых! Цых-вах-ухых!
	AI_Output(other,self,"DIA_YahYah_Hello_15_02");	//Эй, я не причиню тебе вреда. Убери топор.
		AI_Output(self,other,"DIA_YahYah_Hello_18_03");	//Чихач! Уходи, чужак. Тебе нет места в наш деревня.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage,LOG_MISSION,LOG_Running,TOPIC_DS2P_EnterGobboVillage_Start);
};
//----------------------------------
instance DIA_YahYah_WowTalkingGobbo(C_Info)
{
	npc = Gobbo_DS2P_YahYah;					nr = 2;
	condition = DIA_YahYah_WowTalkingGobbo_condition;	
	information = DIA_YahYah_WowTalkingGobbo_info;
	description = "Ух ты! Говорящий гоблин!";
};
func int DIA_YahYah_WowTalkingGobbo_condition(){	return TRUE;};
func void DIA_YahYah_WowTalkingGobbo_info()
{	
	AI_Output(other,self,"DIA_YahYah_WowTalkingGobbo_15_01");	//Ух ты! Говорящий гоблин!
		AI_Output(self,other,"DIA_YahYah_WowTalkingGobbo_18_02");	//Ух ты! Говорящий человек!
};
//----------------------------------
instance DIA_YahYah_WhoAU(C_Info)
{
	npc = Gobbo_DS2P_YahYah;					nr = 3;
	condition = DIA_YahYah_WhoAU_condition;	
	information = DIA_YahYah_WhoAU_info;
	description = "Кто ты?";
};
func int DIA_YahYah_WhoAU_condition(){	return TRUE;};
func void DIA_YahYah_WhoAU_info()
{	
	AI_Output(other,self,"DIA_YahYah_WhoAU_15_01");	//Кто ты?
		AI_Output(self,other,"DIA_YahYah_WhoAU_18_02");	//Ях-Ях - охранник. Охранять деревня.
};
//----------------------------------
instance DIA_YahYah_HumanSpeech(C_Info)
{
	npc = Gobbo_DS2P_YahYah;					nr = 4;
	condition = DIA_YahYah_HumanSpeech_condition;	
	information = DIA_YahYah_HumanSpeech_info;
	description = "Откуда ты знаешь наш язык?";
};
func int DIA_YahYah_HumanSpeech_condition(){	return TRUE;};
func void DIA_YahYah_HumanSpeech_info()
{	
	AI_Output(other,self,"DIA_YahYah_HumanSpeech_15_01");	//Откуда ты знаешь наш язык?
		AI_Output(self,other,"DIA_YahYah_HumanSpeech_18_02");	//Ях-Ях много знать. Ях-Ях научить Ра-Да-По.
	AI_Output(other,self,"DIA_YahYah_HumanSpeech_15_03");	//А Ра-Да-По это?..
		AI_Output(self,other,"DIA_YahYah_HumanSpeech_18_04");	//Ра-Да-По есть великий шаман.
};


//NS - 10/03/2016 ===========
// Вход в деревню 
//===========================
//----------------------------------
instance DIA_YahYah_FromBaBaPo(C_Info)
{
	npc = Gobbo_DS2P_YahYah;					nr = 11;
	condition = DIA_YahYah_FromBaBaPo_condition;	
	information = DIA_YahYah_FromBaBaPo_info;
	description = "Я пришел от Ба-Ба-По.";
};
func int DIA_YahYah_FromBaBaPo_condition()
{
	if ((Gobbos_Attitude == Gobbos_Attitude_None)
		&& (MIS_DS2P_FigurinesGurun == LOG_SUCCESS))	{
		return TRUE;
	};
};
func void DIA_YahYah_FromBaBaPo_info()
{	
	AI_Output(other,self,"DIA_YahYah_FromBaBaPo_15_01");	//Я пришел от Ба-Ба-По. Он сказал, что ты меня пропустишь.
		AI_Output(self,other,"DIA_YahYah_FromBaBaPo_18_02");	//Ба-Ба-По хороший охотник. Ях-Ях пропустить чужак. В деревня находится Ца-Ха-Наух, наш вождь. Чужак говорить с ним.
	Gobbos_Attitude = Gobbos_Attitude_Friendly;
	self.aivar[AIV_PASSGATE] = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_EnterGobboVillage_Success2);
	B_GivePlayerXP(XP_MIS_EnterGobboVillage_Gurun);
};
//----------------------------------
instance DIA_YahYah_LetMeIn(C_Info)
{
	npc = Gobbo_DS2P_YahYah;					nr = 12;
	condition = DIA_YahYah_LetMeIn_condition;	
	information = DIA_YahYah_LetMeIn_info;
	description = "Я хочу пройти.";
	permanent = TRUE;
};
func int DIA_YahYah_LetMeIn_condition()
{
	if (Gobbos_Attitude == Gobbos_Attitude_None)	{
		return TRUE;
	};
};
func void DIA_YahYah_LetMeIn_info()
{	
	AI_Output(other,self,"DIA_YahYah_LetMeIn_15_01");	//Я хочу пройти.
		AI_Output(self,other,"DIA_YahYah_LetMeIn_18_02");	//Нельзя чужак. Чужак уходить.
	Info_ClearChoices(DIA_YahYah_LetMeIn);
	Info_AddChoice(DIA_YahYah_LetMeIn,"Что я должен сделать, чтобы ты меня пропустил?",DIA_YahYah_LetMeIn_What);
	Info_AddChoice(DIA_YahYah_LetMeIn,"Я могу дать тебе вот это ожерелье.",DIA_YahYah_LetMeIn_Necklace);
	Info_AddChoice(DIA_YahYah_LetMeIn,"Давай так: ты меня не видел, меня тут не было.",DIA_YahYah_LetMeIn_NoSee);
	Info_AddChoice(DIA_YahYah_LetMeIn,"О, смотри, какая гоблинша идет!",DIA_YahYah_LetMeIn_Female);
	Info_AddChoice(DIA_YahYah_LetMeIn,"Вот тебе сто золотых. Пропусти меня.",DIA_YahYah_LetMeIn_100Gold);
};
func void DIA_YahYah_LetMeIn_100Gold()
{	
	AI_Output(other,self,"DIA_YahYah_LetMeIn_100Gold_15_01");	//Вот тебе сто золотых. Пропусти меня.
		AI_Output(self,other,"DIA_YahYah_LetMeIn_100Gold_18_02");	//Чужак уходить. Ях-Ях не брать деньги.
};
func void DIA_YahYah_LetMeIn_Female()
{	
	AI_PointAt(other,WP_GobboEntrance_Checkpoint);
	AI_Output(other,self,"DIA_YahYah_LetMeIn_Female_15_01");	//О, смотри, какая гоблинша идет!
		AI_Output(self,other,"DIA_YahYah_LetMeIn_Female_18_02");	//Ях-Ях есть жена.
	AI_StopPointAt(other);
};
func void DIA_YahYah_LetMeIn_NoSee()
{	
	AI_Output(other,self,"DIA_YahYah_LetMeIn_NoSee_15_01");	//Давай так: ты меня не видел, меня тут не было.
		AI_Output(self,other,"DIA_YahYah_LetMeIn_NoSee_18_02");	//Чужак есть. Чужак уходить.
};
func void DIA_YahYah_LetMeIn_Necklace()
{	
	AI_Output(other,self,"DIA_YahYah_LetMeIn_Necklace_15_01");	//Я могу дать тебе вот это ожерелье. Оно сделано из клыков дракона. Только представь себе, какое уважение ты примешь в своем племени.
		AI_Output(self,other,"DIA_YahYah_LetMeIn_Necklace_18_02");	//Нет. Ях-Ях сильный охотник, старый охотник. Ях-Ях не надо уважение, надо покой. Чужак уходить.
	AI_Output(other,self,"DIA_YahYah_LetMeIn_Necklace_15_03");	//(про себя) Вот непробиваемый.
};
func void DIA_YahYah_LetMeIn_What()
{	
	AI_Output(other,self,"DIA_YahYah_LetMeIn_What_15_01");	//Что я должен сделать, чтобы ты меня пропустил?
		AI_Output(self,other,"DIA_YahYah_LetMeIn_What_18_02");	//Ничего. Чужак уходить.
	AI_Output(other,self,"DIA_YahYah_LetMeIn_15_What_03");	// Да ладно, по твоим глазам вижу, что вам ОЧЕНЬ нужна помощь.
		AI_Output(self,other,"DIA_YahYah_LetMeIn_What_18_04");	//Ладно, чужак прав. Наша нужна помощь. Наша деревня атаковать болотный змей. Много змей. 
		AI_Output(self,other,"DIA_YahYah_LetMeIn_What_18_05");	//Чужак убить три змей, приносить Ях-Ях их клык, и Ях-Ях пропускать чужак.
	B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage,LOG_MISSION,LOG_Running,TOPIC_DS2P_EnterGobboVillage_SharkTeeth);
	Info_ClearChoices(DIA_YahYah_LetMeIn);
	MIS_DS2P_EnterGobboVillage_SharkTeeth = TRUE;
	//спауним акул
	Wld_InsertNpc(Swampshark,WP_GobboEntrance_Shark1);
	Wld_InsertNpc(Swampshark,WP_GobboEntrance_Shark1);
	Wld_InsertNpc(Swampshark,WP_GobboEntrance_Shark1);
};
//сдаем квест ------------------------------
instance DIA_YahYah_SharksKilled(C_Info)
{
	npc = Gobbo_DS2P_YahYah;					nr = 13;
	condition = DIA_YahYah_SharksKilled_condition;	
	information = DIA_YahYah_SharksKilled_info;
	description = "Вот, я принес клыки.";
};
func int DIA_YahYah_SharksKilled_condition()
{
	if ((MIS_DS2P_EnterGobboVillage == LOG_Running) && MIS_DS2P_EnterGobboVillage_SharkTeeth
		 && (Npc_HasItems(other,ItAt_SharkTeeth) >= 3))
	{
		return TRUE;
	};
};
func void DIA_YahYah_SharksKilled_info()
{	
	AI_Output(other,self,"DIA_YahYah_SharksKilled_15_01");	//Вот, я принес клыки.
	//Даем клыки
	B_DS_GiveRemoveItems(other,self, ItAt_SharkTeeth, 3);
	AI_Output(other,self,"DIA_YahYah_SharksKilled_15_02");	//Теперь ты меня пропустишь?
		AI_Output(self,other,"DIA_YahYah_SharksKilled_18_03");	//Да, теперь Ях-Ях пропустить чужак. Чужак доказать, что друг гоблин. Чужак проходить, говорить с Ца-Ха-Наух, наш вождь.
	Gobbos_Attitude = Gobbos_Attitude_Friendly;
	self.aivar[AIV_PASSGATE] = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_EnterGobboVillage_Success);
	B_GivePlayerXP(XP_MIS_EnterGobboVillage);
};

//NS - 11/03/2016 ===========
// Вход запрещен 
//===========================
//первое предупреждение ------------------------------
instance DIA_YahYah_FirstWarn(C_Info)
{
	npc = Gobbo_DS2P_YahYah;					nr = 20;
	condition = DIA_YahYah_FirstWarn_condition;	
	information = DIA_YahYah_FirstWarn_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_YahYah_FirstWarn_condition()
{
	if ((Gobbos_Attitude == Gobbos_Attitude_None)
		 && (self.aivar[AIV_Guardpassage_Status] == GP_NONE)
		 && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE))
	{
		return TRUE;
	};
};
func void DIA_YahYah_FirstWarn_info()
{	
		AI_Output(self,other,"DIA_YahYah_FirstWarn_18_01");	//Ррр, дальше нельзя, чужак.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};
//второе предупреждение ------------------------------
instance DIA_YahYah_SecondWarn(C_Info)
{
	npc = Gobbo_DS2P_YahYah;					nr = 21;
	condition = DIA_YahYah_SecondWarn_condition;	
	information = DIA_YahYah_SecondWarn_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_YahYah_SecondWarn_condition()
{
	if ((Gobbos_Attitude == Gobbos_Attitude_None)
		 && (self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
		 && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
		 && (Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};
func void DIA_YahYah_SecondWarn_info()
{	
		AI_Output(self,other,"DIA_YahYah_SecondWarn_18_01");	//Чужак, еще шаг, и Ях-Ях напасть.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
};
//сам напросился  ------------------------------
instance DIA_YahYah_Attack(C_Info)
{
	npc = Gobbo_DS2P_YahYah;					nr = 22;
	condition = DIA_YahYah_Attack_condition;	
	information = DIA_YahYah_Attack_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_YahYah_Attack_condition()
{
	if ((Gobbos_Attitude == Gobbos_Attitude_None)
		 && (self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
		 && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
		 && (Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};
func void DIA_YahYah_Attack_info()
{	
		AI_Output(self,other,"DIA_YahYah_Attack_18_01");	//Кити-ша-мо!
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_StopProcessInfos(self);
	//гоблин нападает, враждебными становятся и все остальные гоблины.
	B_Attack(self,other,AR_GuardStopsIntruder,1);
	B_Attack(Gobbo_withYahYah_1,other,AR_GuardStopsIntruder,1);
	B_Attack(Gobbo_withYahYah_2,other,AR_GuardStopsIntruder,1);
	Gobbos_Attitude = Gobbos_Attitude_Hostile;
	B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage, LOG_MISSION, LOG_FAILED, TOPIC_DS2P_EnterGobboVillage_Fail);
};
