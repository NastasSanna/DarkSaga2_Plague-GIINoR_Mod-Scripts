
instance DIA_MARVIN_EXIT(C_Info)
{
	npc = PC_DSG_MARVIN;
	nr = 999;
	condition = dia_marvin_exit_condition;
	information = dia_marvin_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};
func int dia_marvin_exit_condition()
{
	return TRUE;
};
func void dia_marvin_exit_info()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate);
	AI_StopProcessInfos(self);
};

instance DIA_MARVIN_HELP(C_Info)
{
	npc = PC_DSG_MARVIN;
	nr = 100;
	condition = dia_marvin_help_condition;
	information = dia_marvin_help_info;
	permanent = TRUE;
	description = "Помощь";
};
func int dia_marvin_help_condition()
{
	return TRUE;
};
func void dia_marvin_help_info()
{
	Info_ClearChoices(dia_marvin_help);
	Info_AddChoice(dia_marvin_help,"Закончить помогать.",dia_marvin_help_end);
	Info_AddChoice(dia_marvin_help,"Стать наемником",dia_marvin_help_end);
	Info_AddChoice(dia_marvin_help,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_DEXTERITY,5,-1),dia_marvin_help_end);
	Info_AddChoice(dia_marvin_help,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_ALCHEMY,POTION_Perm_STR,-1),dia_marvin_help_end);
};
func void dia_marvin_help_end()
{
	AI_StopProcessInfos(self);
};

/* TESTING B_DS_WldSpawnItems
instance DIA_MARVIN_Mushroom01(C_Info)
{
	npc = PC_DSG_MARVIN;
	nr = 100;
	condition = dia_marvin_Mushroom01_condition;
	information = dia_marvin_Mushroom01_info;
	permanent = TRUE;
	description = "Вырастить темные грибы";
};
func int dia_marvin_Mushroom01_condition()
{
	return TRUE;
};
func void dia_marvin_Mushroom01_info()
{
	B_DS_WldSpawnItems(ItPl_Mushroom_01, "MUSHROOM01", 1, 25, 8);
};

instance DIA_MARVIN_Mushroom01_All(C_Info)
{
	npc = PC_DSG_MARVIN;
	nr = 100;
	condition = dia_marvin_Mushroom01_All_condition;
	information = dia_marvin_Mushroom01_All_info;
	permanent = TRUE;
	description = "Вырастить все темные грибы";
};
func int dia_marvin_Mushroom01_All_condition()
{
	return TRUE;
};
func void dia_marvin_Mushroom01_All_info()
{
	B_DS_WldSpawnItems(ItPl_Mushroom_01, "MUSHROOM01", 1, 25, 25);
};
//*/
