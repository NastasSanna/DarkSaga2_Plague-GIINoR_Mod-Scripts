
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

/*
//===================================================
instance DIA_Who_What(C_Info)
{
	npc = Who;								nr = 1;
	condition = DIA_Who_What_Cond;
	information = DIA_Who_What_Info;
	description = "";
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Who_What_Cond()
{
	if ()	{
		return TRUE;
	};
};
func void DIA_Who_What_Info()
{
		AI_Output(other,self,"DIA_Who_What_15_00");	//
	AI_Output(self,other,"DIA_Who_What_99_01");	//
	B_DSG_Log_OpenClose(TOPIC_Topik,LOG_MISSION,LOG_Running,TOPIC_Topik_Entry);
	B_LogNote(TOPIC_Topik,TOPIC_Topik_Note);
};
*/


/*
//===================================================
instance DIA_Who_Trade(C_Info)
{
	npc = Who;								nr = 1000;
	condition = DIA_Who_Trade_Cond;
	information = DIA_Who_Trade_Info;
	description = "";
	trade = TRUE;

};
func int DIA_Who_Trade_Cond()
{
	if (Who_Trade)	{
		return TRUE;
	};
};
func void DIA_Who_Trade_Info()
{
		AI_Output(other,self,"DIA_Who_Trade_15_00");	//
	AI_Output(self,other,"DIA_Who_Trade_99_01");	//
};
*/

/*
func void DIA_Who_What_Menu() {
	//Выбор варианта (несколько):
	Info_ClearChoices(DIA_Who_What);
	Info_AddChoice(DIA_Who_What, Dialog_Back, DIA_Who_What_Back);
	if () {
		Info_AddChoice(DIA_Who_What, "Option 3", DIA_Who_What_Option3);
	};
	Info_AddChoice(DIA_Who_What, "Option 2", DIA_Who_What_Option2);
	Info_AddChoice(DIA_Who_What, "Option 1", DIA_Who_What_Option1);
}
func void DIA_Who_What_Back() {
	Info_ClearChoices(DIA_Who_What);
}
*/