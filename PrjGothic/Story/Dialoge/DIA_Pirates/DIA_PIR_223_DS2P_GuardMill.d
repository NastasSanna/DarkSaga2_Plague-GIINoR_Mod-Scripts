/***************************************************************
						ОХРАННИК НА МЕЛЬНИЦЕ
  Охраняет муку, которую хочет украсть гоблин Джа-Аф-Фар.
  Его надо усыпить, вырубить или споить.
***************************************************************/

instance DIA_GuardMill_EXIT(DIA_Proto_End)
{
	npc = PIR_223_DS2P_GuardMill;
};

///////////////////////////// Общие /////////////////////////////
//как у безымянных пиратов

/////////////////////// Квест: Ушлый вор ////////////////////////
//===================================================
instance DIA_GuardMill_Distract(C_Info)
{
	npc = PIR_223_DS2P_GuardMill;				nr = 1;
	condition = DIA_GuardMill_Distract_Cond;
	information = DIA_GuardMill_Distract_Info;
	description = "Эй! Давно тут стоишь? (отвлечь)";
	permanent = TRUE;
};
//Появление: квест «Ушлый вор» - пошли воровать муку
//Условие: с 23 до 4, пока охранник стоит на мельнице, есть две бутылки самогона, рома, грога или другого спиртного
//Окончание: украли муку
func int DIA_GuardMill_Distract_Cond()
{
	if (MIS_DS2P_QuirkyThief_GuardMill && !MIS_DS2P_QuirkyThief_GuardMill_Down
		&& Wld_IsTime(23,0,4,0)
	)	{
		return TRUE;
	};
};
var int DIA_GuardMill_Distract_AlcoholToGive;
var int DIA_GuardMill_Distract_BottlesGiven;
func void DIA_GuardMill_Distract_Menu()
{
	Info_ClearChoices(DIA_GuardMill_Distract);
	//Выбор варианта (один из):
	//(каждый вариант выпивки, который есть в наличии)
	if (Npc_HasItems(other, ItFo_DS2P_BullSeed)) {
		Info_AddChoice(DIA_GuardMill_Distract, "Дать бутылку Бычьего семени", DIA_GuardMill_Distract_Give_BullSeed);
	};
	if (Npc_HasItems(other, ItFo_DS2P_GobboSmile)) {
		Info_AddChoice(DIA_GuardMill_Distract, "Дать бутылку Улыбки гоблина", DIA_GuardMill_Distract_Give_GobboSmile);
	};
	if (Npc_HasItems(other, ItFo_DS2P_Berserker)) {
		Info_AddChoice(DIA_GuardMill_Distract, "Дать бутылку Берсерка", DIA_GuardMill_Distract_Give_Berserker);
	};
	if (Npc_HasItems(other, ItFo_DS2P_TrollBooze)) {
		Info_AddChoice(DIA_GuardMill_Distract, "Дать бутылку Троллиного пойла", DIA_GuardMill_Distract_Give_TrollBooze);
	};
	if (Npc_HasItems(other, ItFo_DS2P_MagicGrog)) {
		Info_AddChoice(DIA_GuardMill_Distract, "Дать бутылку Магического грога", DIA_GuardMill_Distract_Give_MagicGrog);
	};
	if (Npc_HasItems(other, ItFo_DS2P_Kamikaze)) {
		Info_AddChoice(DIA_GuardMill_Distract, "Дать бутылку Камикадзе", DIA_GuardMill_Distract_Give_Kamikaze);
	};
	
	if (Npc_HasItems(other, ITFO_SAMOGON)) {
		Info_AddChoice(DIA_GuardMill_Distract, "Дать бутылку самогона", DIA_GuardMill_Distract_Give_SAMOGON);
	};
	if (Npc_HasItems(other, ItFo_Addon_SchnellerHering)) {
		Info_AddChoice(DIA_GuardMill_Distract, "Дать бутылку Быстрой селедки", DIA_GuardMill_Distract_Give_SchnellerHering);
	};
	if (Npc_HasItems(other, ItFo_Addon_SchlafHammer)) {
		Info_AddChoice(DIA_GuardMill_Distract, "Дать бутылку Двойного молота Лу", DIA_GuardMill_Distract_Give_SchlafHammer);
	};
	if (Npc_HasItems(other, ItFo_Addon_LousHammer)) {
		Info_AddChoice(DIA_GuardMill_Distract, "Дать бутылку Молота Лу", DIA_GuardMill_Distract_Give_LousHammer);
	};
	if (Npc_HasItems(other, ItFo_Addon_Grog)) {
		Info_AddChoice(DIA_GuardMill_Distract, "Дать бутылку грога", DIA_GuardMill_Distract_Give_Grog);
	};
	if (Npc_HasItems(other, ItFo_Addon_Rum)) {
		Info_AddChoice(DIA_GuardMill_Distract, "Дать бутылку рома", DIA_GuardMill_Distract_Give_Rum);
	};
	if (Npc_HasItems(other, ItFo_Beer)) {
		Info_AddChoice(DIA_GuardMill_Distract, "Дать бутылку пива", DIA_GuardMill_Distract_Give_Beer);
	};
	if (Npc_HasItems(other, ItFo_Booze)) {
		Info_AddChoice(DIA_GuardMill_Distract, "Дать бутылку шнапса", DIA_GuardMill_Distract_Give_Booze);
	};
	if (Npc_HasItems(other, ItFo_Wine)) {
		Info_AddChoice(DIA_GuardMill_Distract, "Дать бутылку вина", DIA_GuardMill_Distract_Give_Wine);
	};
};

//Выпивка 1
func void DIA_GuardMill_Distract_GiveAlcohol1()
{
	DIA_GuardMill_Distract_BottlesGiven += 1;
		AI_Output(other,self,"DIA_GuardMill_Distract_GiveAlcohol1_15_01");	//Как не быть. Вот, держи.
	//отдаем выбранную бутылку, охранник выпивает
	B_DS_GiveRemoveItems(other, self, DIA_GuardMill_Distract_AlcoholToGive, 1);
	AI_UseItem(self, DIA_GuardMill_Distract_AlcoholToGive);
	AI_Output(self,other,"DIA_GuardMill_Distract_GiveAlcohol1_99_02");	//(рыгает) Нет ничего лучше, чем бутылка хорошего пойла.
			AI_Output(other,self,"DIA_GuardMill_Distract_GiveAlcohol1_15_03");	//Может, еще?
	AI_Output(self,other,"DIA_GuardMill_Distract_GiveAlcohol1_99_04");	//Давай.
	DIA_GuardMill_Distract_Menu();
};

//Выпивка 2
func void DIA_GuardMill_Distract_GiveAlcohol2()
{
	//отдаем выбранную бутылку, охранник выпивает
	B_DS_GiveRemoveItems(other, self, DIA_GuardMill_Distract_AlcoholToGive, 1);
	AI_UseItem(self, DIA_GuardMill_Distract_AlcoholToGive);
	AI_Output(self,other,"DIA_GuardMill_Distract_99_01");	//Хорошо-то как! И спать совсем расхотелось. Уже и... (протяжный зевок)
	//Охранник ложится спать прямо на землю, будто под воздействием заклинания сон
	AI_StartState(self, ZS_Sleep_Deep, 0, self.wp);
	//разговор обрывается
	AI_StopProcessInfos(self);
	//Запись в дневнике. Квест «Ушлый вор»: Отвлекли выпивкой
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_DistractBooze);
};
func void DIA_GuardMill_Distract_Give_Next()
{
	if (DIA_GuardMill_Distract_BottlesGiven == 0) {
		DIA_GuardMill_Distract_GiveAlcohol1();
	}
	else {
		DIA_GuardMill_Distract_GiveAlcohol2();
	};
};
func void DIA_GuardMill_Distract_Give_BullSeed() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_DS2P_BullSeed;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_GobboSmile() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_DS2P_GobboSmile;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_Berserker() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_DS2P_Berserker;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_TrollBooze() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_DS2P_TrollBooze;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_MagicGrog() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_DS2P_MagicGrog;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_Kamikaze() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_DS2P_Kamikaze;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_SAMOGON() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ITFO_SAMOGON;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_SchnellerHering() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_Addon_SchnellerHering;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_SchlafHammer() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_Addon_SchlafHammer;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_LousHammer() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_Addon_LousHammer;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_Grog() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_Addon_Grog;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_Rum() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_Addon_Rum;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_Beer() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_Beer;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_Booze() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_Booze;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_Wine() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_Wine;
	DIA_GuardMill_Distract_Give_Next();
};


func void DIA_GuardMill_Distract_Info()
{
	if (C_NpcHasAlcohol(other) < 2) {
		AI_PrintS_Ext(other, "У меня недостаточно алкоголя,", COL_Maroon);
		AI_PrintS_Ext(other, "чтобы споить его!", COL_Maroon);
		return;
	};
		AI_Output(other,self,"DIA_GuardMill_Distract_15_01");	//Эй! Давно тут стоишь?
	AI_Output(self,other,"DIA_GuardMill_Distract_99_02");	//Да почитай с вечера. Чтоб мне пусто было, если я этому рад. 
	AI_Output(self,other,"DIA_GuardMill_Distract_99_03");	//Вместо того чтоб спать, комаров кормлю. У-у-у, кровопийцы проклятущие!
		AI_Output(other,self,"DIA_GuardMill_Distract_15_04");	//(сочувствующе) Бывает. Может, ты выпить хочешь?
	AI_Output(self,other,"DIA_GuardMill_Distract_99_05");	//А у тебя есть?
	DIA_GuardMill_Distract_Menu();
	//что бы ни выбрали, продолжение одинаковое
};


//Кража
//Золото, легко
