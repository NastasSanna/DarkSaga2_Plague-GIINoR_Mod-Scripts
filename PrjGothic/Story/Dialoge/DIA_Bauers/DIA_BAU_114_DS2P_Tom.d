instance DIA_Tom_EXIT(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Tom_EXIT_Condition;	
	information = DIA_Tom_EXIT_Info;
	description = Dialog_Ende;
};

func int DIA_Tom_EXIT_Condition()
{	
	return TRUE;
};

func void DIA_Tom_EXIT_Info()
{	
	AI_StopProcessInfos(self);
};

// Активно сразу
// nr = 1

instance DIA_Tom_Hello(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Tom_Hello_Condition;	
	information = DIA_Tom_Hello_Info;
	description = "Привет";
};

func int DIA_Tom_Hello_Condition()
{
	return TRUE;
};

func void DIA_Tom_Hello_Info()
{
	AI_Output(other,self,"DIA_Tom_Hello_15_00"); //Привет. Ты кто?
	AI_Output(self,other,"DIA_Tom_Hello_17_01"); //Привет. Меня зовут Том, я охотник. А ты, я слышал, приплыл на корабле?
	AI_Output(other,self,"DIA_Tom_Hello_15_02"); //Да.
	AI_Output(self,other,"DIA_Tom_Hello_17_03"); //Хоть бы теперь эти пираты убрались отсюда куда подальше!
	AI_Output(other,self,"DIA_Tom_Hello_15_04"); //Пока это не возможно. На корабле чума и любой, кто приблизится к нему, рискует заразиться. Я сейчас ищу лекарство.
	AI_Output(self,other,"DIA_Tom_Hello_17_05"); //Черт! В последнее время новости одна хуже другой.
};

// Активируется после диалога с Томом "Привет."
// nr = 1

instance DIA_Tom_CanIHelp(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Tom_CanIHelp_Condition;	
	information = DIA_Tom_CanIHelp_Info;
	description = "Могу я чем-то помочь?";
};

func int DIA_Tom_CanIHelp_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Tom_Hello))
	{
		return TRUE;
	};
};

func void DIA_Tom_CanIHelp_Info()
{
	AI_Output(other,self,"DIA_Tom_CanIHelp_15_00"); //Могу я чем-то помочь?
	AI_Output(self,other,"DIA_Tom_CanIHelp_17_01"); //Вообще-то можешь. Ты, как я понимаю, имеешь свободный доступ в деревню, что мне и надо.
	AI_Output(other,self,"DIA_Tom_CanIHelp_15_02"); //Ты хочешь устроить диверсию?
	AI_Output(self,other,"DIA_Tom_CanIHelp_17_03"); //Это было бы неплохо, но рисковать, пока мои односельчане находятся у пиратов в плену, не стоит. Нет, я хочу, чтобы ты передал моей жене Лулу письмо от меня.
	AI_Output(other,self,"DIA_Tom_CanIHelp_15_04"); //Легко. Давай сюда.
	AI_Output(self,other,"DIA_Tom_CanIHelp_17_05"); //Сейчас.
	// Создаем письмо в инвентаре Тома
	CreateInvItems(self,ITWr_DS2P_LylyWriting,1);
	B_UseFakeScrollTime(3);
	AI_Output(self,other,"DIA_Tom_CanIHelp_17_05"); //Вот, держи. Только пусть сразу его уничтожит, а то боюсь даже представить, что с ней сделают, если найдут при ней это письмо.
	// Отдаем письмо ГГ
	B_GiveInvItems(self,other,ITWr_DS2P_LylyWriting,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_TomsLetter,LOG_MISSION,LOG_Running,TOPIC_DS2P_TomsLetter_Start);
	B_StartOtherRoutine(Lulu,"GONE");
	AI_StopProcessInfos(self);
};

// Активируется после диалога с Томом "Привет."
// nr = 2

instance DIA_Tom_WhoIsTeacher(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Tom_WhoIsTeacher_Condition;	
	information = DIA_Tom_WhoIsTeacher_Info;
	description = "Кто меня может здесь чему-нибудь научить?";
};

func int DIA_Tom_WhoIsTeacher_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Tom_Hello))
	{
		return TRUE;
	};
};

func void DIA_Tom_WhoIsTeacher_Info()
{
	AI_Output(other,self,"DIA_Tom_WhoIsTeacher_15_00"); //Кто меня может здесь чему-нибудь научить?
	AI_Output(self,other,"DIA_Tom_WhoIsTeacher_17_01"); //Я могу научить тебя разделывать зверей. Фарт – опытный стрелок, и может показать пару упражнений на повышение меткости, также он превосходный следопыт.
	AI_Output(self,other,"DIA_Tom_WhoIsTeacher_17_02"); //Густав – крепкий парень, но полученная в последней стычке рана дает о себе знать, и пока он не исцелится, он тебе мало чем поможет. Джин уверенно владеет одноручными мечами. Умеет даже сражаться парными клинками, даже боюсь думать, у кого он этому научился.
};

// Активируется после диалога с Томом "Кто меня может здесь чему-нибудь научить?"
// nr = 2

instance DIA_Tom_TeachMe(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Tom_TeachMe_Condition;	
	information = DIA_Tom_TeachMe_Info;
	description = "Научи меня разделывать зверей.";
};

func int DIA_Tom_TeachMe_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Tom_WhoIsTeacher))
	{
		return TRUE;
	};
};

func void DIA_Tom_TeachMe_Info()
{
	AI_Output(other,self,"DIA_Tom_TeachMe_15_00"); //Научи меня разделывать зверей.
	AI_Output(self,other,"DIA_Tom_TeachMe_17_01"); //Скажем, за символическую плату в 100 золотых я научу тебя.
};

// Активируется, если Том запросил у ГГ 100 золотых за обучение, и у ГГ они есть
// nr = 2

instance DIA_Tom_PayForTeach(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Tom_PayForTeach_Condition;	
	information = DIA_Tom_PayForTeach_Info;
	description = "Вот деньги.";
};

func int DIA_Tom_PayForTeach_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Tom_TeachMe) && Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		return TRUE;
	};
};

func void DIA_Tom_PayForTeach_Info()
{
	AI_Output(other,self,"DIA_Tom_PayForTeach_15_00"); //Вот деньги.
	B_GiveInvItems(other,self,ItMi_Gold,100);
	AI_Output(self,other,"DIA_Tom_PayForTeach_17_01"); //Обращайся в любое время.
	B_DSG_Log_OpenClose(TOPIC_TeacherOther,LOG_NOTE,-1,"Том согласился учить меня разделке зверей.");
};

// Активируется, если ГГ заплатил за обучение
// nr = 2

instance DIA_Tom_Teaching(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 2;
	permanent = TRUE;
	condition = DIA_Tom_Teaching_Condition;	
	information = DIA_Tom_Teaching_Info;
	description = "Научи меня разделывать зверей.";
};

func int DIA_Tom_Teaching_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Tom_PayForTeach))
	{
		return TRUE;
	};
};

// UNFINISHED -  Надо больше навыков?

func void DIA_Tom_Teaching_Info()
{
	AI_Output(other,self,"DIA_Tom_TeachMe_15_00"); //Научи меня разделывать зверей.
	if ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE))
	{
		Info_AddChoice(DIA_Tom_Teaching,Dialog_Back,DIA_Tom_Teaching_Back);
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Tom_Teaching,B_BuildLearnString("Удаление зубов",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Tom_Teaching_Teeth);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Tom_Teaching,B_BuildLearnString("Удаление когтей",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Tom_Teaching_Claws);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Tom_Teaching,B_BuildLearnString("Снятие шкур",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Tom_Teaching_Fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Tom_Teaching,B_BuildLearnString("Жало кровавой мухи",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSting)),DIA_Tom_Teaching_BFSting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Tom_Teaching,B_BuildLearnString("Крылья кровавой мухи",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWing)),DIA_Tom_Teaching_BFWing);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{
			Info_AddChoice(DIA_Tom_Teaching,B_BuildLearnString("Рог драконьего снеппера",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),DIA_Tom_Teaching_DSHorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Tom_Teaching_17_00"); //Теперь ты стал настоящим охотником – мне больше нечему тебя учить. А теперь пойди и выследи пару мракорисов, чтобы закрепить теорию.
	};
};

func void DIA_Tom_Teaching_Back()
{
	Info_ClearChoices(DIA_Tom_Teaching);
};

func void DIA_Tom_Teaching_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		//
	};
	Info_ClearChoices(DIA_Tom_Teaching);
	Info_AddChoice(DIA_Tom_Teaching,Dialog_Back,DIA_Tom_Teaching_Back);
};

func void DIA_Tom_Teaching_Claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		//
	};
	Info_ClearChoices(DIA_Tom_Teaching);
	Info_AddChoice(DIA_Tom_Teaching,Dialog_Back,DIA_Tom_Teaching_Back);
};

func void DIA_Tom_Teaching_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		//
	};
	Info_ClearChoices(DIA_Tom_Teaching);
	Info_AddChoice(DIA_Tom_Teaching,Dialog_Back,DIA_Tom_Teaching_Back);
};

func void DIA_Tom_Teaching_BFSting()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting))
	{
		//
	};
	Info_ClearChoices(DIA_Tom_Teaching);
	Info_AddChoice(DIA_Tom_Teaching,Dialog_Back,DIA_Tom_Teaching_Back);
};

func void DIA_Tom_Teaching_BFWing()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing))
	{
		//
	};
	Info_ClearChoices(DIA_Tom_Teaching);
	Info_AddChoice(DIA_Tom_Teaching,Dialog_Back,DIA_Tom_Teaching_Back);
};

func void DIA_Tom_Teaching_DSHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DrgSnapperHorn))
	{
		//
	};
	Info_ClearChoices(DIA_Tom_Teaching);
	Info_AddChoice(DIA_Tom_Teaching,Dialog_Back,DIA_Tom_Teaching_Back);
};

// Активируется, после диалога с Густавом насчет помощи
// nr = 1

instance DIA_Tom_PiratePatrolPlan(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Tom_PiratePatrolPlan_Condition;	
	information = DIA_Tom_PiratePatrolPlan_Info;
	description = " ";
};

func int DIA_Tom_PiratePatrolPlan_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Gustav_CanIHelp))
	{
		return TRUE;
	};
};

func void DIA_Tom_PiratePatrolPlan_Info()
{
	AI_Output(self,other,"DIA_Tom_PiratePatrolPlan_17_00"); //Дело вот в чем. Так как мы сами не можем избавиться от пиратского патруля, надо сделать так, чтобы за нас это сделали звери, хищники.
	AI_Output(other,self,"DIA_Tom_PiratePatrolPlan_15_01"); //Хотите натравить на них волков?
	AI_Output(self,other,"DIA_Tom_PiratePatrolPlan_17_02"); //Да. Но втроем мы не справимся. Густав же остается сторожить лагерь – в лесу от него никакого толку нет, одни проблемы. Ты поможешь нам?
	AI_Output(other,self,"DIA_Tom_PiratePatrolPlan_15_03"); //Конечно, но как мы приманим к ним волков?
	AI_Output(self,other,"DIA_Tom_PiratePatrolPlan_17_04"); //Вот, держи этот рог. Я, Джин и Фарт будем гнать зверей со стороны леса, а ты со стороны деревни. Просто протруби в рог рядом со стаей, и они побегут. Его звук особым образом действует на некоторых хищников, заставляя их бежать.
	CreateInvItems(self,ItMi_DS2P_TomHorn,1);
	B_GiveInvItems(self,other,ItMi_DS2P_TomHorn,1);
	AI_Output(self,other,"DIA_Tom_PiratePatrolPlan_17_05"); //Только не потеряй его – этот рог у меня один, больше нет. Нам с парнями вообще придется обходиться без него, поэтому мы и будем работать втроем. Справишься один?
	AI_Output(other,self,"DIA_Tom_PiratePatrolPlan_15_06"); //Без проблем. Просто скажи, когда.
	AI_Output(self,other,"DIA_Tom_PiratePatrolPlan_17_07"); //Вечером, когда начнет темнеть. В темное время суток волки злее.
	AI_Output(other,self,"DIA_Tom_PiratePatrolPlan_15_08"); //Хорошо, я приду.
	B_StartOtherRoutine(self,"WAITINIG_PIRATEPATROL");
	B_DSG_Log_OpenClose(TOPIC_DS2P_PiratesPatrol,LOG_MISSION,Log_Running,TOPIC_DS2P_PiratesPatrol_Start);
	AI_StopProcessInfos(self);
};

// Активируется, если взят квест "Патруль Пиратов" и ГГ пришел в промежутке 19:00 - 20:00
// nr = 1

instance DIA_Tom_PiratePatrol_Begining(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 1;
	permanent = FALSE;
	important = FALSE;
	condition = DIA_Tom_PiratePatrol_Begining_Condition;	
	information = DIA_Tom_PiratePatrol_Begining_Info;
	description = "Я пришел.";
};

func int DIA_Tom_PiratePatrol_Begining_Condition()
{
	if ((MIS_DS2P_PiratesPatrol == Log_Running) && Wld_IsTime(19,0,20,0))
	{
		return TRUE;
	};
};

func void DIA_Tom_PiratePatrol_Begining_Info()
{
	AI_Output(other,self,"DIA_Tom_PiratePatrol_Begining_15_00"); //Я пришел.
	AI_Output(self,other,"DIA_Tom_PiratePatrol_Begining_17_01"); //Вижу. Готов?
	AI_Output(other,self,"DIA_Tom_PiratePatrol_Begining_15_02"); //Да, пошли покажем этим морским крысам, что лес предназначен для сухопутных крыс.
	AI_Output(self,other,"DIA_Tom_PiratePatrol_Begining_17_03"); //(усмехаясь) Мне нравится твой настрой. За мной!
	B_StartOtherRoutine(self,"ATTACK_PIRATEPATROL");
	AI_StopProcessInfos(self);
};

// Запускается, когда ГГ и Том подошли ближе к пиратам
// nr = 1

instance DIA_Tom_PiratePatrol_Cont_01(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Tom_PiratePatrol_Cont_01_Condition;	
	information = DIA_Tom_PiratePatrol_Cont_01_Info;
	description = " ";
};

func int DIA_Tom_PiratePatrol_Cont_01_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Tom_PiratePatrol_Begining) && Hlp_StrCmp(Npc_GetNearestWP(self),"TEST_WAYPOINT")) //UNFINISHED Заменить WayPoint
	{
		return TRUE;
	};
};

func void DIA_Tom_PiratePatrol_Cont_01_Info()
{
	AI_Output(self,other,"DIA_Tom_PiratePatrol_Cont_01_17_00"); //Видишь вон тех двоих типов?
	AI_Output(other,self,"DIA_Tom_PiratePatrol_Cont_01_15_01"); //Вижу.
	AI_Output(self,other,"DIA_Tom_PiratePatrol_Cont_01_17_02"); //Обойди их с другой стороны и подуй в рог, который я тебе дал. Мы пока с парнями выгоним пару стай с другой стороны. Если зажмем морских разбойников с двух сторон, то у них не будет никаких шансов на успех. Понятно?
	AI_Output(other,self,"DIA_Tom_PiratePatrol_Cont_01_15_03"); //Да.
	PiratePatrol_Success = TRUE;
	AI_StopProcessInfos(self);
};

// Активируется, если пираты напали, и были убиты до того, как ГГ призвал волков

instance DIA_Tom_PiratePatrol_Failed(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 2;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Tom_PiratePatrol_Failed_Condition;	
	information = DIA_Tom_PiratePatrol_Failed_Info;
	description = " ";
};

func int DIA_Tom_PiratePatrol_Failed_Condition()
{
	//if (Npc_IsDead(PIR_001_Patrol) && Npc_IsDead(PIR_002_Patrol) && (PiratePatrol_Success == FALSE))
	//{
	//	return TRUE;
	//};
};

func void DIA_Tom_PiratePatrol_Failed_Info()
{
	AI_Output(self,other,"DIA_Tom_PiratePatrol_Failed_17_00"); //Черт! Нельзя было просто так убивать их. Ты все испортил и теперь наши родные находятся под угрозой.
	AI_Output(other,self,"DIA_Tom_PiratePatrol_Failed_15_01"); //Извини, сам не понимаю, как так получилось.
	AI_Output(self,other,"DIA_Tom_PiratePatrol_Failed_17_02"); //Проклятие! Надеюсь, все обойдется.
	AI_StopProcessInfos(self);
};

instance DIA_Tom_PiratePatrol_Success(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 2;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Tom_PiratePatrol_Success_Condition;	
	information = DIA_Tom_PiratePatrol_Success_Info;
	description = " ";
};

func int DIA_Tom_PiratePatrol_Success_Condition()
{
	//if (Npc_IsDead(PIR_001_Patrol) && Npc_IsDead(PIR_002_Patrol) && (PiratePatrol_Success == TRUE))
	//{
		return TRUE;
	//};
};

func void DIA_Tom_PiratePatrol_Success_Info()
{
	AI_Output(self,other,"DIA_Tom_PiratePatrol_Success_17_00"); //Ура! Все получилось!
	AI_Output(other,self,"DIA_Tom_PiratePatrol_Success_15_01"); //Да, даже и не думал, что все выйдет настолько легко.
	AI_Output(self,other,"DIA_Tom_PiratePatrol_Success_17_02"); //(смеясь) Кому легко, а кому не очень. Знаешь, сколько трудов стоило пригнать волков в нужное место? Волки ведь самые храбрые хищники – храбрее даже льва или мракориса.
	AI_Output(other,self,"DIA_Tom_PiratePatrol_Success_15_03"); //Как же вам удалось натравить их на пиратов?
	AI_Output(self,other,"DIA_Tom_PiratePatrol_Success_17_04"); //Правильный подход… На самом деле мы просто отметили путь волков кусками мяса до самих патрульных.
	AI_Output(other,self,"DIA_Tom_PiratePatrol_Success_15_05"); //(смеется) Просто и гениально!
};

instance DIA_Tom_BringBackHorn(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 1;
	permanent = FALSE;
	important = FALSE;
	condition = DIA_Tom_BringBackHorn_Condition;	
	information = DIA_Tom_BringBackHorn_Info;
	description = "Вот, забери свой чудо-рог.";
};

func int DIA_Tom_BringBackHorn_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Tom_PiratePatrol_Success))
	{
		return TRUE;
	};
};

func void DIA_Tom_BringBackHorn_Info()
{
	AI_Output(other,self,"DIA_Tom_BringBackHorn_15_00"); //Вот, забери свой чудо-рог.
	AI_Output(self,other,"DIA_Tom_BringBackHorn_17_01"); //Спасибо, не хотелось бы потерять семейную реликвию. А ты заслуживаешь награды за свои труды. Мы бы, конечно, и так справились, но с тобой это было легче.
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
	//B_GivePlayerXP(100);
	//Npc_ExchangeRoutine
	B_DSG_Log_OpenClose(TOPIC_DS2P_PiratesPatrol,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_PiratesPatrol_Success);
};
	