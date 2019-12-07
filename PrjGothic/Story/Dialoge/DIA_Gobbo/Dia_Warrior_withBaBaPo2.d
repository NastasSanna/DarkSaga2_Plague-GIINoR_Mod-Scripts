instance DIA_Warrior_withBaBaPo2_EXIT(C_Info)
{
	npc = Gobbo_withBaBaPo_2;
	nr = 999;
	permanent = TRUE;
	condition = DIA_BaBaPoWarrior2_EXIT_condition;	
	information = DIA_BaBaPoWarrior2_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_BaBaPoWarrior2_EXIT_condition(){	return TRUE;};
func void DIA_BaBaPoWarrior2_EXIT_info(){	AI_StopProcessInfos(self);};

//NS - 14/06/2013 ===========
// Кто ты?
//===========================
instance DIA_Warrior_withBaBaPo2_TalkingGobbo(C_Info)
{
	npc = Gobbo_withBaBaPo_2;
	nr = 0;
	condition = DIA_BaBaPoWarrior2_TalkingGobbo_condition;	
	information = DIA_BaBaPoWarrior2_TalkingGobbo_info;
	description = "Говорящий гоблин?";
	permanent = TRUE;
};
func int DIA_BaBaPoWarrior2_TalkingGobbo_condition(){	return TRUE;};
func void DIA_BaBaPoWarrior2_TalkingGobbo_info()
{
	AI_Output(other,self,"DIA_BaBaPoWarrior2_TalkingGobbo_15_00");	//Говорящий гоблин?
		AI_Output(self,other,"DIA_BaBaPoWarrior2_TalkingGobbo_18_01");	//Чих-пых! Ухыхх!
	AI_StopProcessInfos(self);
};