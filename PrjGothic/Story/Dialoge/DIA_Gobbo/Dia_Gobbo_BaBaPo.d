instance DIA_BaBaPo_EXIT(C_Info)
{
	npc = Gobbo_DS2P_BaBaPo;
	nr = 999;
	permanent = TRUE;
	condition = DIA_BaBaPo_EXIT_condition;	
	information = DIA_BaBaPo_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_BaBaPo_EXIT_condition(){	return TRUE;};
func void DIA_BaBaPo_EXIT_info(){	AI_StopProcessInfos(self);};

//NS - 14/06/2013 ===========
// Знакомство 
//===========================
instance DIA_BaBaPo_WhyNotAttack(C_Info)	//"Почему ты не нападаешь на меня?"	//nr = 1;
{
	npc = Gobbo_DS2P_BaBaPo;
	nr = 1;
	condition = DIA_BaBaPo_WhyNotAttack_condition;	
	information = DIA_BaBaPo_WhyNotAttack_info;
	description = "Почему ты не нападаешь на меня?";
};
func int DIA_BaBaPo_WhyNotAttack_condition(){	return TRUE;};
func void DIA_BaBaPo_WhyNotAttack_info()
{	
	AI_Output(other,self,"DIA_BaBaPo_WhyNotAttack_15_01");	//Почему ты не нападаешь на меня?
		AI_Output(self,other,"DIA_BaBaPo_WhyNotAttack_18_02");	//Ба-Ба-По - умный гоблина. Ба-Ба-По не желать зла человек!
	AI_Output(other,self,"DIA_BaBaPo_WhyNotAttack_15_03");	//Но ты и твои воины напали на пиратов, которые сторожат пещеру.
		AI_Output(self,other,"DIA_BaBaPo_WhyNotAttack_18_04");	//Пират злой, пират убивать мои братья. Пират убивать мой друг и срезать с него ухо. Ба-Ба-По должен отомстить!
	AI_Output(other,self,"DIA_BaBaPo_WhyNotAttack_15_05");	//Но они почти перебили ваш отряд.
		AI_Output(self,other,"DIA_BaBaPo_WhyNotAttack_18_06");	//Ба-Ба-По опечален, Ба-Ба-По не может возвратиться болото с позором. Ба-Ба-По напасть опять, а там либо честь, либо смерть!
	AI_Output(other,self,"DIA_BaBaPo_WhyNotAttack_15_07");	//Ты готов умереть ради друга? Не знал, что у гоблинов есть кодекс чести.
		AI_Output(self,other,"DIA_BaBaPo_WhyNotAttack_18_08");	//(задумался) Ба-Ба-По видеть, что добрый, поэтому я сказать человека правда.
		AI_Output(self,other,"DIA_BaBaPo_WhyNotAttack_18_09");	//Мы хотеть вернуть наша реликвия - одна из статуэток бога Гуруна - великого гоблина, мага и полководца.
		AI_Output(self,other,"DIA_BaBaPo_WhyNotAttack_18_10");	//Пирата забрать у мой брат статуэтка. Он находить ее и нести в наш лагерь на болото. Пират убить брат и забрать статуэтку себе.
		AI_Output(self,other,"DIA_BaBaPo_WhyNotAttack_18_11");	//Я не могу вернуться без нее. Человек помогать нам?
	Hero_Knows_Gurun = TRUE;
};

//NS - 14/06/2013 ===========
// Где находится лагерь, после знакомства 
//===========================
instance DIA_BaBaPo_WhereLager(C_Info)	//"Где находится ваш лагерь?"	//nr = 2;
{
	npc = Gobbo_DS2P_BaBaPo;
	nr = 2;
	condition = DIA_BaBaPo_WhereLager_condition;	
	information = DIA_BaBaPo_WhereLager_info;
	description = "Где находится ваш лагерь?";
};
func int DIA_BaBaPo_WhereLager_condition()
{	if (Npc_KnowsInfo(self,DIA_BaBaPo_WhyNotAttack)) {	return TRUE;};};
func void DIA_BaBaPo_WhereLager_info()
{	
	AI_Output(other,self,"DIA_BaBaPo_WhereLager_15_00");	//Где находится ваш лагерь?
		AI_Output(self,other,"DIA_BaBaPo_WhereLager_18_01");	//Мы жить на болото в глубине остров. // UNFINISHED Там-то и там-то.
		AI_Output(self,other,"DIA_BaBaPo_WhereLager_18_02");	//У нас большое поселение, есть воины, шамана и другой. Мы жить здесь много тысяча лет.
		AI_Output(self,other,"DIA_BaBaPo_WhereLager_18_03");	//Раньше мы не воевать с людьми, мы мирный народ.
		AI_Output(self,other,"DIA_BaBaPo_WhereLager_18_04");	//Но эти пираты убивать мои братья, поэтому мы сражаться!
};

//NS - 14/06/2013 ===========
// О Гуруне, после знакомства 
//===========================
instance DIA_BaBaPo_AboutGurun(C_Info)	//"Расскажи о боге Гуруне."	//nr = 3;
{
	npc = Gobbo_DS2P_BaBaPo;
	nr = 3;
	condition = DIA_BaBaPo_AboutGurun_condition;	
	information = DIA_BaBaPo_AboutGurun_info;
	description = "Расскажи о боге Гуруне.";
};
func int DIA_BaBaPo_AboutGurun_condition()
{	if (Npc_KnowsInfo(self,DIA_BaBaPo_WhyNotAttack)) {	return TRUE;};};
func void DIA_BaBaPo_AboutGurun_info()
{	
	AI_Output(other,self,"DIA_BaBaPo_AboutGurun_15_00");	//Расскажи о боге Гуруне.
		AI_Output(self,other,"DIA_BaBaPo_AboutGurun_18_01");	//Он наш бог. Гурун защищать гоблина от зла, дать разум и мудрость.
		AI_Output(self,other,"DIA_BaBaPo_AboutGurun_18_02");	//Он учить нас знаниям много года назад, когда еще не быть людей на остров.
		AI_Output(self,other,"DIA_BaBaPo_AboutGurun_18_03");	//Гурун уметь колдовать, уметь сражаться. Он самый великий гоблин. Мы поклоняться ему и чтить память.
};

//NS - 14/06/2013 ===========
//  Статуэтки Гуруна
//===========================
instance DIA_BaBaPo_AboutStatue(C_Info)	//"Расскажи о статуэтке."	//nr = 4;
{
	npc = Gobbo_DS2P_BaBaPo;
	nr = 4;
	condition = DIA_BaBaPo_AboutStatue_condition;	
	information = DIA_BaBaPo_AboutStatue_info;
	description = "Расскажи о статуэтке.";
};
func int DIA_BaBaPo_AboutStatue_condition()
{	if (Npc_KnowsInfo(self,DIA_BaBaPo_WhyNotAttack)) {	return TRUE;};};
func void DIA_BaBaPo_AboutStatue_info()
{	
	AI_Output(other,self,"DIA_BaBaPo_AboutStatue_15_00");	//Расскажи о статуэтке.
		AI_Output(self,other,"DIA_BaBaPo_AboutStatue_18_01");	//Это статуэтка Гуруна. Их всего три - золотой, серебряный и изумрудный, гоблина терять их много года назад.
		AI_Output(self,other,"DIA_BaBaPo_AboutStatue_18_02");	//На нас нападать человек с топорами и украсть их. Гоблина искать много дней и ночей, но не найти.
		AI_Output(self,other,"DIA_BaBaPo_AboutStatue_18_03");	//Прошло много-много времени. Мы находить человек и спрашивать.
		AI_Output(self,other,"DIA_BaBaPo_AboutStatue_18_04");	//Но он не иметь статуэток, продать другой человек. Мы искать и его, но обнаружить только труп.
		AI_Output(self,other,"DIA_BaBaPo_AboutStatue_18_05");	//Мы думать, что статуэтки потерять навсегда, но недавно в пещере мой брат находить одну.
		AI_Output(self,other,"DIA_BaBaPo_AboutStatue_18_06");	//Мы забирать и нести в лагерь. Я думать, что остальные две статуэтки тоже где-то на остров.
		AI_Output(self,other,"DIA_BaBaPo_AboutStatue_18_07");	//Если ты суметь найти, Ба-Ба-По давать много золота человеку.
	//Запись в дневнике "Статуэтки Гуруна" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_FigurinesGurun,LOG_MISSION,LOG_Running,TOPIC_DS2P_FigurinesGurun_Start);
	
	//сразу создаем статуэтку у Йорна
	var C_NPC Jorn;	Jorn = Hlp_GetNpc(PIR_210_DS2P_Jorn);
	CreateInvItems(Jorn,ITMI_DS2P_GobStatue_Emerald,1);
};

//NS - 14/06/2013 ===========
//  Вернуть найденные статуэтки, после рассказа про них
//===========================

// золото - по 400 монет за первые 2 статуэтки, 500 за последнюю
func void DIA_BaBaPo_ReturnStatues_GiveGold()
{
	if (MIS_ReturnedStatues_Cnt < 3)
	{
		B_GiveInvItem_red(self,other,ITMI_Gold,400,40);
	}
	else
	{
		B_GiveInvItem_red(self,other,ITMI_Gold,500,40);
	};
	MIS_ReturnedStatues_Cnt += 1;
};
instance DIA_BaBaPo_ReturnStatues(C_Info)	//"По поводу статуэток..."	//nr = 5;
{
	npc = Gobbo_DS2P_BaBaPo;
	nr = 5;
	condition = DIA_BaBaPo_ReturnStatues_condition;	
	information = DIA_BaBaPo_ReturnStatues_info;
	description = "По поводу статуэток...";
};
func int DIA_BaBaPo_ReturnStatues_condition()
{	if (Npc_KnowsInfo(self,DIA_BaBaPo_AboutStatue) 
		&& ((Npc_HasItems(other,ITMI_DS2P_GobStatue_Gold) > 0) || (Npc_HasItems(other,ITMI_DS2P_GobStatue_Silver) > 0)))
	{	return TRUE;};
};
func void DIA_BaBaPo_ReturnStatues_info()
{	
	Info_ClearChoices(DIA_BaBaPo_ReturnStatues);
	if (Npc_HasItems(other,ITMI_DS2P_GobStatue_Gold) > 0) {
		Info_AddChoice(DIA_BaBaPo_ReturnStatues, "Я нашел Золотую статуэтку.",DIA_BaBaPo_ReturnStatues_Gold);};
	if (Npc_HasItems(other,ITMI_DS2P_GobStatue_Gold) > 0) {
		Info_AddChoice(DIA_BaBaPo_ReturnStatues, "Я нашел Серебряную статуэтку.",DIA_BaBaPo_ReturnStatues_Silver);};
};

func void DIA_BaBaPo_ReturnStatues_Gold()
{	
	var int x;
	AI_Output(other,self,"DIA_BaBaPo_ReturnStatues_Gold_15_00");	//Я нашел Золотую статуэтку.
	//Отдать золотую стутуэтку 
	x = 1;	if (x == 1)	{
		B_DS_GiveRemoveItems_Red(other,self,ITMI_DS2P_GobStatue_Gold,1,35);};
	AI_Output(self,other,"DIA_BaBaPo_ReturnStatues_Gold_18_01");	//О! Ба-Ба-По счастлив! Человек нести добро народу гоблина. Человек заслужить много золота и наград. 
	//Дает золото 
	x = 2;	if (x == 2)	{
		DIA_BaBaPo_ReturnStatues_GiveGold();};
	x = 2;	if (x == 2)	{
		//Запись в дневнике "Статуэтки Гуруна"
		B_DSG_Log_OpenClose(TOPIC_DS2P_FigurinesGurun, LOG_MISSION, LOG_Running, TOPIC_DS2P_FigurinesGurun_Gold);
	};
};
func void DIA_BaBaPo_ReturnStatues_Silver()
{	
	var int x;
	AI_Output(other,self,"DIA_BaBaPo_ReturnStatues_Silver_15_00");	//Я нашел Серебряную статуэтку.
	//Отдать серебряную стутуэтку 
	x = 1;	if (x == 1)	{
		B_DS_GiveRemoveItems_Red(other,self,ITMI_DS2P_GobStatue_Silver,1,35);};
	AI_Output(self,other,"DIA_BaBaPo_ReturnStatues_Silver_18_01");	//Гурун благословляет тебя, человек! Это он послать тебя нам в помощь. 
	//Дает золото 
	x = 2;	if (x == 2)	{
		DIA_BaBaPo_ReturnStatues_GiveGold();};
	x = 2;	if (x == 2)	{
		//Запись в дневнике "Статуэтки Гуруна"
		B_DSG_Log_OpenClose(TOPIC_DS2P_FigurinesGurun, LOG_MISSION, LOG_Running, TOPIC_DS2P_FigurinesGurun_Silver);
	};
};

//NS - 14/06/2013 ===========
//  Обещать помочь со статуэткой, если взяли квест
//===========================
instance DIA_BaBaPo_IllHelp(C_Info)	//"Я помогу вам."	//nr = 6;
{
	npc = Gobbo_DS2P_BaBaPo;
	nr = 6;
	condition = DIA_BaBaPo_IllHelp_condition;	
	information = DIA_BaBaPo_IllHelp_info;
	description = "Я помогу вам.";
};
func int DIA_BaBaPo_IllHelp_condition()
{	if (MIS_DS2P_FigurinesGurun == LOG_Running)
	{	return TRUE;};
};
func void DIA_BaBaPo_IllHelp_info()
{	
	AI_Output(other,self,"DIA_BaBaPo_IllHelp_15_00");	//Я помогу вам.
		AI_Output(self,other,"DIA_BaBaPo_IllHelp_18_01");	//Гоблина иметь много золота, человек не будет в обиде на Ба-Ба-По.
	//Запись в дневнике "Хитрые гоблины" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_CunningGoblins,LOG_MISSION,LOG_FAILED,TOPIC_DS2P_CunningGoblins_Cancel);
};

//NS - 14/06/2013 ===========
//  Вернуть изумрудную статуэтку
//===========================
instance DIA_BaBaPo_ReturnEmeraldStatue(C_Info)	//"Проблема с пиратом решена."	//nr = 7;
{
	npc = Gobbo_DS2P_BaBaPo;
	nr = 7;
	condition = DIA_BaBaPo_ReturnEmeraldStatue_condition;	
	information = DIA_BaBaPo_ReturnEmeraldStatue_info;
	description = "Проблема с пиратом решена.";
};
func int DIA_BaBaPo_ReturnEmeraldStatue_condition()
{	if ((MIS_DS2P_FigurinesGurun == LOG_Running) && (Npc_HasItems(other,ITMI_DS2P_GobStatue_Emerald) > 0))
	{	return TRUE;};
};
func void DIA_BaBaPo_ReturnEmeraldStatue_info()
{	
	var int x;
	AI_Output(other,self,"DIA_BaBaPo_ReturnEmeraldStatue_15_00");	//Проблема с пиратом решена.
		AI_Output(self,other,"DIA_BaBaPo_ReturnEmeraldStatue_18_01");	//Ты вернуть изумрудная статуэтка?
	AI_Output(other,self,"DIA_BaBaPo_ReturnEmeraldStatue_15_02");	//Да, вот она.
	x = 1;	if (x == 1)	{
		B_DS_GiveRemoveItems_Red(other,self,ITMI_DS2P_GobStatue_Emerald,1, 35);
		//Дает золото
		DIA_BaBaPo_ReturnStatues_GiveGold();
	};
		AI_Output(self,other,"DIA_BaBaPo_ReturnEmeraldStatue_18_03");	//Теперь ты навсегда стать друг Ба-Ба-По и наше племя.
		AI_Output(self,other,"DIA_BaBaPo_ReturnEmeraldStatue_18_04");	//Если ты пойти на болото, скажи воинам, которые охранять лагерь, что я прислать тебя. Они пустить тебя внутрь и не убивать.
	x = 2;	if (x == 2)	{
		//Запись в дневнике "Статуэтки Гуруна"
		B_DSG_Log_OpenClose(TOPIC_DS2P_FigurinesGurun, LOG_MISSION, LOG_Running, TOPIC_DS2P_FigurinesGurun_Emerald);
	};
};

//NS - 14/06/2013 ===========
//  Вернуть все статуэтки
//===========================
instance DIA_BaBaPo_AllStatues(C_Info)	//"Все статуэтки собраны."	//nr = 8;
{
	npc = Gobbo_DS2P_BaBaPo;
	nr = 8;
	condition = DIA_BaBaPo_AllStatues_condition;	
	information = DIA_BaBaPo_AllStatues_info;
	description = "Все статуэтки собраны.";
};
func int DIA_BaBaPo_AllStatues_condition()
{	if ((MIS_DS2P_FigurinesGurun == LOG_Running) && (MIS_ReturnedStatues_Cnt >= 3))
	{	return TRUE;};
};
func void DIA_BaBaPo_AllStatues_info()
{	
	var int x;
	AI_Output(other,self,"DIA_BaBaPo_AllStatues_15_00");	//Все статуэтки собраны.
		AI_Output(self,other,"DIA_BaBaPo_AllStatues_18_01");	//Да, человек. Ба-Ба-По теперь может идти в лагерь и отдать их шаман.
		AI_Output(self,other,"DIA_BaBaPo_AllStatues_18_02");	//Теперь наша сила возрастать, и никакой злой дух не страшить наше племя.
	//Дает 800 золотых и кольцо «Гоблинская прыть» + 15 к ловкости
	x = 1; if (x == 1)	{
		B_GiveInvItem_red(self,other,ItMi_Gold,800,40);
		B_GiveInvItem_red(self,other,ItRi_DS2P_BaBaPo,1,45);
		//Запись в дневнике "Статуэтки Гуруна" квест окончен 
		B_DSG_Log_OpenClose(TOPIC_DS2P_FigurinesGurun, LOG_MISSION, LOG_SUCCESS, TOPIC_DS2P_FigurinesGurun_Success);
	};

	// UNFINISHED
	//После этого Ба-Ба-По и воины уходят в лагерь на болото.
	self.aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	Gobbo_withBaBaPo_1.aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	Gobbo_withBaBaPo_2.aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_StartOtherRoutine(self,"HOME");
	B_StartOtherRoutine(Gobbo_withBaBaPo_1,"HOME");
	B_StartOtherRoutine(Gobbo_withBaBaPo_2,"HOME");
};

//NS - 14/06/2013 ===========
//  После знакомства, постоянный
//===========================
instance DIA_BaBaPo_HumanSpeech(C_Info)	//"Где ты научился понимать речь людей?" (постоянный)	//nr = 9;
{
	npc = Gobbo_DS2P_BaBaPo;
	nr = 9;
	condition = DIA_BaBaPo_HumanSpeech_condition;	
	information = DIA_BaBaPo_HumanSpeech_info;
	description = "Где ты научился понимать речь людей?";
	permanent = TRUE;
};
func int DIA_BaBaPo_HumanSpeech_condition()
{	if (Npc_KnowsInfo(self,DIA_BaBaPo_WhyNotAttack)) {	return TRUE;};};
func void DIA_BaBaPo_HumanSpeech_info()
{	
	AI_Output(other,self,"DIA_BaBaPo_HumanSpeech_15_00");	//Где ты научился понимать речь людей?
		AI_Output(self,other,"DIA_BaBaPo_HumanSpeech_18_01");	//Нас вести Гурун, направлять наш разум через наш шаман Ра-Да-По.
		AI_Output(self,other,"DIA_BaBaPo_HumanSpeech_18_02");	//Он очень умный, знать много о человек и учить воинов всему, что знать сам.
		AI_Output(self,other,"DIA_BaBaPo_HumanSpeech_18_03");	//Поэтому самый достойный гоблин с детства ходить к шаман и получать знания.
};

