/***************************************************************
						ОХРАННИК НА МЕЛЬНИЦЕ
  Охраняет муку, которую хочет украсть гоблин Джа-Аф-Фар.
  Его надо усыпить, вырубить или споить.
***************************************************************/

instance DIA_GuardMill_EXIT(C_Info)
{
	npc = PIR_223_DS2P_GuardMill;
	nr = 999;
	permanent = TRUE;
	condition = DIA_GuardMill_EXIT_condition;	
	information = DIA_GuardMill_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_GuardMill_EXIT_condition(){	return TRUE;};
func void DIA_GuardMill_EXIT_info(){	AI_StopProcessInfos(self);};

//--------------------------
instance DIA_GuardMill_WhatGuard(C_Info)
{
	npc = PIR_223_DS2P_GuardMill;				nr = 1;
	condition = DIA_GuardMill_WhatGuard_condition;	
	information = DIA_GuardMill_WhatGuard_info;
	description = "Что ты тут делаешь?";
	permanent = TRUE;
};
func int DIA_GuardMill_WhatGuard_condition()
{
	//UNFINISHED возле мельницы
	if (Npc_GetDistToWP(self,""))	{
		return TRUE;
	};
};
func void DIA_GuardMill_WhatGuard_info()
{
		AI_Output(other,self,"DIA_GuardMill_WhatGuard_13_01");	//Что ты тут делаешь?
	AI_Output(self,other,"DIA_GuardMill_WhatGuard_13_02");	//Охраняю эту треклятую мельницу.
		AI_Output(other,self,"DIA_GuardMill_WhatGuard_13_03");	//От кого?
	AI_Output(self,other,"DIA_GuardMill_WhatGuard_13_04");	//От гоблинов, чтобы их всех разорвало! Таскают по ночам припасы, мелкие твари.
	AI_Output(self,other,"DIA_GuardMill_WhatGuard_13_05");	//Капитан и поставил меня сторожить. И теперь, вместо того, чтобы цедить пиво в таверне, я тут торчу все ночи напролет!
};

//--------------------------
instance DIA_GuardMill_NoTalk(C_Info)
{
	npc = PIR_223_DS2P_GuardMill;				nr = 2;
	condition = DIA_GuardMill_NoTalk_condition;	
	information = DIA_GuardMill_NoTalk_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_GuardMill_NoTalk_condition()
{
	if (Npc_IsInState(self,ZS_Talk) && !DIA_GuardMill_WhatGuard_condition())	{
		return TRUE;
	};
};
func void DIA_GuardMill_NoTalk_info()
{
		AI_Output(self,other,"DIA_GuardMill_NoTalk_13_01");	//Отвали! Дай отдохнуть.
	AI_StopProcessInfos(self);
};

//NS - 09/05/2016 ===========
// Квест "Ушлый вор" 
//===========================
//отвлечь охранника для кражи
//нужно 2 бутылки пива (про пиво можно узнать в постоянном диалоге)
instance DIA_GuardMill_GiveBeer(C_Info)
{
	npc = PIR_223_DS2P_GuardMill;				nr = 10;
	condition = DIA_GuardMill_GiveBeer_condition;	
	information = DIA_GuardMill_GiveBeer_info;
	description = "Давно тут стоишь? (отвлечь)";
};
func int DIA_GuardMill_GiveBeer_condition()
{
	if (Wld_IsTime(0,0,3,30) && (MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_CameTo)
		&& (Npc_HasItems(other,ItFo_Beer) >= 2))	{
		return TRUE;
	};
};
func void DIA_GuardMill_GiveBeer_info()
{
		AI_Output(other,self,"DIA_GuardMill_GiveBeer_13_01");	//Давно тут стоишь?
	AI_Output(self,other,"DIA_GuardMill_GiveBeer_13_02");	//Да почитай с вечера. Чтоб мне пусто было, если я этому рад. Вместо того, чтобы спать, комаров кормлю. У-у-у, кровопийцы проклятущие!
		AI_Output(other,self,"DIA_GuardMill_GiveBeer_13_03");	//(сочувствующе) Бывает. Выпить хочешь?
	AI_Output(self,other,"DIA_GuardMill_GiveBeer_13_04");	//А у тебя есть?
		AI_Output(other,self,"DIA_GuardMill_GiveBeer_13_05");	//Как не быть. Вот, держи.
	//ГГ передает бутылку с пивом. Охранник прикладывается к ней.
	B_GiveInvItems(other,self,ItFo_Beer,1);
	AI_UseItem(self,ItFo_Beer);
	AI_Output(self,other,"DIA_GuardMill_GiveBeer_13_06");	//(рыгает) Нет ничего лучше, чем бутылка хорошего пойла.
		AI_Output(other,self,"DIA_GuardMill_GiveBeer_13_07");	//Может, еще?
	AI_Output(self,other,"DIA_GuardMill_GiveBeer_13_08");	//Давай.
	//ГГ передает бутылку с пивом. Охранник прикладывается к ней.
	B_GiveInvItems(other,self,ItFo_Beer,1);
	AI_UseItem(self,ItFo_Beer);
	AI_Output(self,other,"DIA_GuardMill_GiveBeer_13_09");	//Хорошо-то как! И спать совсем расхотелось. Уже и... (протяжный зевок)
	AI_StopProcessInfos(self);
	//Охранник ложится спать прямо на землю, будто под воздействием заклинания сон.
	AI_StartState(self,ZS_MagicSleep,1,"");
};
