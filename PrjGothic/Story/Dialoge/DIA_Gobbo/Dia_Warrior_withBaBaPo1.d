instance DIA_Warrior_withBaBaPo1_EXIT(DIA_Proto_End)
{
	npc = Gobbo_withBaBaPo_1;
};

//NS - 14/06/2013 ===========
// ��� ��?
//===========================
instance DIA_Warrior_withBaBaPo1_WhoAreU(C_Info)
{
	npc = Gobbo_withBaBaPo_1;
	nr = 0;
	condition = DIA_BaBaPoWarrior1_WhoAreU_condition;	
	information = DIA_BaBaPoWarrior1_WhoAreU_info;
	description = "�� ���?";
	permanent = TRUE;
};
func int DIA_BaBaPoWarrior1_WhoAreU_condition(){	return TRUE;};
func void DIA_BaBaPoWarrior1_WhoAreU_info()
{
	AI_Output(other,self,"DIA_BaBaPoWarrior1_WhoAreU_15_00");	//��� ��?
		AI_Output(self,other,"DIA_BaBaPoWarrior1_WhoAreU_18_01");	//���-�����-���!
	AI_StopProcessInfos(self);
};