instance DIA_Greg_EXIT(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Greg_EXIT_condition;	
	information = DIA_Greg_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Greg_EXIT_condition(){	return TRUE;};
func void DIA_Greg_EXIT_info(){	AI_StopProcessInfos(self);};

instance DIA_Greg_Start(C_Info)	//Начальный диалог на корабле
{
	npc = PIR_201_DS2P_Greg;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Greg_Start_condition;	
	information = DIA_Greg_Start_info;
	important = TRUE;
};
func int DIA_Greg_Start_condition(){	return TRUE;};
func void DIA_Greg_Start_info()
{	//UNFINISHED сделать триалог
	B_StartOtherRoutine(PIR_207_DS2P_LanSkeleton,"GoToGregToPirs");
	B_StartOtherRoutine(PIR_208_DS2P_GrayBeard,"GoToGregToPirs");
	B_StartOtherRoutine(PIR_209_DS2P_Vales,"GoToGregToPirs");
	AI_Output(self,other,"DIA_Greg_Start_11_00");	//Кого я вижу?! Сам Безымянный герой пожаловал. Мир тесен.
	AI_Output(other,self,"DIA_Greg_Start_15_00");	//Не сказать, что я рад тебя видеть, Грег.
	AI_Output(self,other,"DIA_Greg_Start_11_01");	//Отчего же?! Встреча старых друзей всегда приятна. (громко смеется) А, парни?!
	AI_Output(other,self,"DIA_Greg_Start_15_01");	//С каких это пор мы стали друзьями?
	AI_Output(self,other,"DIA_Greg_Start_11_02");	//Мы не виделись всего несколько месяцев, а ты уже все забыл? Если бы не я, твой скелет давно бы уже украшал каньон Яркендара.
	AI_LookAtNpc (self,PIR_202_DS2P_Symon);
	AI_Output(self,other,"DIA_Greg_Start_11_03");	//Нет, вы слышали, парни, какая неблагодарность!
	AI_StopLookAt(self);
	AI_Output(other,self,"DIA_Greg_Start_15_02");	//Давай закончим этот пустой разговор. Я думаю, ты пришел сюда не для того, чтобы поприветствовать ”старых друзей”.
	AI_Output(self,other,"DIA_Greg_Start_11_04");	//Ты прав. Мы с командой оказались в неловком положении - орочья галера потопила мой бриг...
	//UNFINISHED триалог
	AI_Output(PIR_202_DS2P_Symon,other,"DIA_Greg_Start_11_05");	//(перебивает) Не твой, а капитана Гарда!
	AI_LookAtNpc (self,PIR_202_DS2P_Symon);
	AI_Output(self,other,"DIA_Greg_Start_11_06");	//Закрой свою пасть, Саймон!
	AI_StopLookAt(self);
	AI_Output(self,other,"DIA_Greg_Start_11_07");	//Так вот, теперь мы сели на мель на этом захолустном острове. И тут, как нельзя кстати, приплываешь ты. 
	AI_Output(self,other,"DIA_Greg_Start_11_08");	//Я думаю, сам Белиар прислал тебя! (громко смеется)
	AI_Output(other,self,"DIA_Greg_Start_15_03");	//И ты думаешь, я просто так отдам тебе корабль?
	AI_Output(self,other,"DIA_Greg_Start_11_09");	//(хитро улыбается) Конечно, дружочек! А если вдруг ты захочешь пошутить, то мы быстро научим тебя хорошим манерам.
	AI_PlayAni(self,"T_IGETYOU");
	AI_Output(self,other,"DIA_Greg_Start_11_10");	//Ну что скажешь?
	AI_Output(other,self,"DIA_Greg_Start_15_04");	//(про себя) Их слишком много. Придется договариваться.
	AI_Output(self,other,"DIA_Greg_Start_11_11");	//Я жду...
	AI_Output(other,self,"DIA_Greg_Start_15_05");	//Твоя взяла, я отдам тебе корабль, но есть маленькая проблема.
	AI_Output(self,other,"DIA_Greg_Start_11_12");	//(недовольно) Что еще?
	AI_Output(other,self,"DIA_Greg_Start_15_06");	//На корабле чума. Из всей команды на ногах всего четверо.
	AI_Output(self,other,"DIA_Greg_Start_11_13");	//Ты, должно быть, шутишь? Признайся, тебе просто нужно выиграть время. Но меня так просто не надурить!
	AI_Output(other,self,"DIA_Greg_Start_15_07");	//Я не шу...
	AI_PlayAniBS(none_15_Diego,"T_STAND_2_WOUNDED",BS_LIE);
	AI_StopProcessInfos(self);
};
instance DIA_Greg_Start02(C_Info)	//Начальный диалог на корабле
{
	npc = PIR_201_DS2P_Greg;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Greg_Start02_condition;	
	information = DIA_Greg_Start02_info;
	important = TRUE;
};
func int DIA_Greg_Start02_condition(){	
	if(Npc_KnowsInfo(other,DIA_Greg_Start))		{return TRUE;};
};
func void DIA_Greg_Start02_info()
{
	var int x; x=0;
	B_StartOtherRoutine(none_15_Diego,"Unconscious");	//Диего ложится на землю, типа от чумы
	AI_Dodge(self);	//Пираты отпрыгивают, испугавшись
	AI_Dodge(PIR_202_DS2P_Symon);
	AI_Dodge(Pir_204_DS2P_Karah);
	AI_Dodge(PIR_206_DS2P_SueBaby);
	AI_Dodge(PIR_207_DS2P_LanSkeleton);
	AI_Dodge(PIR_208_DS2P_GrayBeard);
	AI_Dodge(PIR_209_DS2P_Vales);
	AI_Output(self,other,"DIA_Greg_Start02_11_00");	//Что за черт?!
	x=1;
	if(x==1)
	{
		Wld_PlayEffect("SPELLFX_INCOVATION_RED",none_18_Vatras,none_15_Diego,0,0,0,FALSE);
		AI_PlayAni(none_18_Vatras,"T_PRACTICEMAGIC5");
		AI_PlayFX(none_18_Vatras,none_15_Diego,"SPELLFX_INCOVATION_BLUE");
	};
	x=2;
	if(x==2)
	{
		Wld_PlayEffect("SPELLFX_HEALSHRINE",none_18_Vatras,none_15_Diego,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_HEALSHRINE",none_18_Vatras,none_18_Vatras,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_HEALSHRINE",none_15_Diego,none_15_Diego,0,0,0,FALSE);
		AI_PlayAni(none_18_Vatras,"T_PRACTICEMAGIC5");		
	};
	x=3;
	if(x==3)	//Здесь, если что подштриховать, чтоб Диего сначала телепортнулся, а потом лежал на кровати
	{
		AI_Teleport(none_15_Diego,"");	//Улетают на корабль
		AI_Teleport(none_18_Vatras,"");//Улетают на корабль
		B_StartOtherRoutine(none_18_Vatras,"START");
		B_StartOtherRoutine(none_15_Diego,"StartSleep");
	};
	AI_Output(self,other,"DIA_Greg_Start02_11_01");	//Откуда, раздери меня пиранья, вы притащили эту чуму?
	AI_Output(other,self,"DIA_Greg_Start02_15_00");	//Я предполагаю, что причиной стал один наш пассажир, которого мы подобрали по пути сюда.
	AI_Output(other,self,"DIA_Greg_Start02_15_01");	//Он столкнулся с магией черного мага. Похоже, это не прошло без последствий.
	AI_Output(self,other,"DIA_Greg_Start02_11_02");	//А почему ты уверен, что тоже не заражен?
	AI_Output(other,self,"DIA_Greg_Start02_15_02");	//Во-первых, я на ногах и неплохо себя чувствую, во-вторых, при мне Глаз Инноса, который дает мне дополнительную защиту от темной магии.
	AI_Output(self,other,"DIA_Greg_Start02_11_03");	//(хитро поглядывая) Глаз Инноса?! Хм...
	AI_Output(other,self,"DIA_Greg_Start02_15_03");	//Если ты или кто-то из команды попробует его у меня взять, то поплатится своей жизнью!
	AI_Output(self,other,"DIA_Greg_Start02_11_04");	//Ладно, это после. А что с магом? Это же один из тех магов, что исследовали руины в Яркендаре, ведь так?
	AI_Output(other,self,"DIA_Greg_Start02_15_04");	//Нет, Ватрас проповедовал на площади Хориниса. Я думаю, магия Аданоса защищает его от чумы.
	AI_Output(self,other,"DIA_Greg_Start02_11_05");	//Ладно. И что ты предлагаешь? Мне нужен корабль, и я его получу так или иначе!
	AI_Output(other,self,"DIA_Greg_Start02_15_05");	//Предлагаю пока оставить все так как есть. Мне нужно разобраться с чумой, это и в ваших интересах.
	AI_Output(other,self,"DIA_Greg_Start02_15_06");	//Ты же понимаешь, что силами двух человек невозможно управлять кораблем, а, значит, мы никуда не денемся с острова.
	AI_Output(self,other,"DIA_Greg_Start02_11_06");	//Ты прав. Пусть будет по-твоему, но советую не тянуть с решением ТВОЕЙ проблемы.
	AI_Output(self,other,"DIA_Greg_Start02_11_07");	//А пока мои парни приглядят за кораблем.
	AI_LookAtNpc (self,PIR_202_DS2P_Symon);
	AI_Output(self,other,"DIA_Greg_Start02_11_08");	//Лан, Валес, присмотрите за НАШЕЙ посудиной! Остальные, возвращаемся в деревню.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_Healer);
	B_DSG_Log_OpenClose(TOPIC_DS2P_IslandUnderSiege,LOG_MISSION,LOG_Running,TOPIC_DS2P_IslandUnderSiege_PiratesOnIsland);
	AI_StopProcessInfos(self);
	
	//*NS - 19/06/2013 Грег идет в ратушу, если надо добавить других пиратов
	B_StartOtherRoutine(self, "TALKTOGARD");
};


//NS - 28/06/2013 ================================================
// По квесту "Заговор"
//================================================================

// ---------------------------------------------------
// После разговора с Гардом Грег сам обратится к ГГ
instance DIA_Greg_LetsGoAway(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 0;
	condition = DIA_Greg_LetsGoAway_condition;	
	information = DIA_Greg_LetsGoAway_info;
	important = TRUE;
};
func int DIA_Greg_LetsGoAway_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Gard_WithGregStart))
	{		return TRUE;	};
};
func void DIA_Greg_LetsGoAway_info()
{	
		AI_Output(self,other, "DIA_Greg_LetsGoAway_11_00");	//Давай отойдем в сторонку.
	//Диалог обрывается, Грег бежит в отдельную комнату в ратуше, подальше от Грега.
	B_StartOtherRoutine(self,"TALKTOHERO");
	AI_StopProcessInfos(self);
};

// ---------------------------------------------------
// Отошли подальше от Гарда, после предыдущего снова сам обращается к ГГ
instance DIA_Greg_StartConspiracy(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 0;
	condition = DIA_Greg_StartConspiracy_condition;	
	information = DIA_Greg_StartConspiracy_info;
	important = TRUE;
};
func int DIA_Greg_StartConspiracy_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_LetsGoAway)
		&& (Npc_GetDistToWP(self, "") < PERC_DIST_DIALOG))	// UNFINISHED вписать WP, куда уходим от Гарда
	{		return TRUE;	};
};
func void DIA_Greg_StartConspiracy_info()
{	
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_00");	//Я слушаю.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_00");	//Я думаю, ты уже понял, что с Гардом шутки плохи. Он не остановится ни перед чем. Поэтому я предлагаю объединить наши силы. 
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_01");	//О чем ты говоришь?
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_01");	//Дубина, включи голову. Я предлагаю избавиться от Гарда, чего непонятного?! Это в наших общих интересах.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_02");	//Ты поможешь переманить команду на мою сторону, а я, в свою очередь, оставлю тебя и твой корабль в покое. По-моему, это хорошая сделка.
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_02");	//Но как вы выберетесь с острова?
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_03");	//Ты отвезешь нас в Яркендар, а дальше волен плыть куда угодно. Я не буду мешать тебе.
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_03");	//А если ты обманешь?
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_04");	//Я рискую не меньше, чем ты. Если наше дело не выгорит, то Гард перевесит нас на столбах в назидание остальным. А мне дорога шкура не меньше, чем тебе.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_05");	//Я знаю, что тебе можно доверять, иначе бы не рискнул предложить столь опасное дело.
	
	//	Изменено по квестам Марселя. --->>
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_04");	//Хорошо, я согласен.Но у меня есть одно условие.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_06");	//Какое, мракорисова твоя душонка?
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_05");	//Если наш план выгорит – вы оставляете крестьян в покое, отпускаете всех пленных и обещаете не устраивать больше потасовок.
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_06");	//За все расплачиваться с крестьянами золотом. Это понятно?
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_07");	//Мм, хорошо. Думаю, я смогу убедить парней поумерить себя и свою гордость.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_08");	//Но только ты не должен затягивать с кораблем. Хищников нельзя долго ограничивать.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_09");	//Есть еще условия?
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_07");	//Нет, это все. Но есть вопрос. Как ты будешь смещать Гарда?
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_08");	//Заявишься всей толпой в ратушу и прирежешь его?
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_10");	//Нет, мне ребята не позволят нарушить законы Морского братства, прописанные в Кодексе.
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_09");	//Какой-такой кодекс? Не думал, что вы, пираты, живете по каким-то законам.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_11");	//(значительно) Не кодекс, а Кодекс, гоблинов выкормыш. Свод всех правил и законов пиратов.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_12");	//Если бы его не было, и никто его не соблюдал, то пираты уже давно бы перерезали друг другу глотки за добычу.
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_10");	//Не помню, чтобы ты говорил мне про Кодекс, когда принял к себе в команду в Яркендаре.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_13");	//Забыл, наверное. Да и не до правил тогда было – выжить бы.
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_11");	//И как ты собираешься воспользоваться Кодексом?
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_14");	//(с сарказмом) Взять этот талмуд и огреть тебя им по голове! Тебе никогда не говорили, парень, что ты задаешь очень много вопросов?	
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_12");	//Говорили, и не раз, но это ведь в твоих же интересах, чтобы я узнал, как можно больше.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_15");	//Ладно, твоя взяла, шныжья печенка! Слушай и не перебивай.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_16");	//Пираты – люди свободные, нам плевать на короля, власть и войну с орками. Мы были бы самым обычным сбродом разбойников, если бы не капитан, имеющий всю власть на корабле.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_17");	//Он руководит нами в бою, следит за тем, чтобы в  трюме была еда, вода и ром, а также занимается сбытом награбленного.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_18");	//Капитан выбирается на общем совете команды. Обычно выбирают самого ловкого, сильного и удачливого человека.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_19");	//И этот выбранный будет капитаном до тех пор, пока не отправится на корм морским левиафанам. Ну или его кто-нибудь не решит сместить.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_20");	//Сместить можно двумя способами: убить его или собрать совет и проголосовать.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_21");	//Как ты знаешь, первый способ мне не удался, придется изгаляться, и в этом я очень рассчитываю на тебя.
	//	<<--- конец изменений
	
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_13");	//Что от меня требуется?	
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_22");	//Твоя задача – убедить как можно больше пиратов перейти на нашу сторону.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_23");	//Предлагаю разделиться: на тебе Джозеф, Саймон, Валес, Зедд и Сью, остальных я беру на себя.
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_14");	//Как мне их убедить?
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_24");	//Нужно втереться им в доверие, узнать какие у них проблемы, оказать пару услуг. Не мне тебя учить.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_25");	//Только будь острожен и много не болтай. Гард ничего не должен узнать, запомни!

	//Запись в дневнике "Заговор" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_Start);

	// Основное времяпрепровождение
	B_StartOtherRoutine(self,"MAIN");
};


//NS - 28/06/2013 ================================================
// По квесту "Доставка припасов"
//================================================================

// ---------------------------------------------------
// "Для меня есть работа?"	после разговора про заговор		nr = 20
instance DIA_Greg_HaveJob(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 20;
	condition = DIA_Greg_HaveJob_condition;	
	information = DIA_Greg_HaveJob_info;
	description = "Для меня есть работа?";
};
func int DIA_Greg_HaveJob_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_StartConspiracy))
	{
		return TRUE;
	};
};
func void DIA_Greg_HaveJob_info()
{	
	AI_Output(other,self, "DIA_Greg_HaveJob_15_00");	//Для меня есть работа?
		AI_Output(self,other, "DIA_Greg_HaveJob_11_01");	//Пока ничего достойного внимания.
		AI_Output(self,other, "DIA_Greg_HaveJob_11_02");	//Но если ты готов побыть мальчиком на побегушках, то можешь отнести еду в пещеру, где мы держим часть крестьян.
		AI_Output(self,other, "DIA_Greg_HaveJob_11_03");	//Раньше этим занималась Никки, но эта дура повздорила с Йорном и теперь наотрез отказывается этим заниматься.

	Info_ClearChoices(DIA_Greg_HaveJob);
	Info_AddChoice(DIA_Greg_HaveJob,"Я отнесу еду пленным.",DIA_Greg_HaveJob_OK);
	Info_AddChoice(DIA_Greg_HaveJob,"Может быть позже.",DIA_Greg_HaveJob_Later);
};
func void DIA_Greg_HaveJob_Later()
{
	AI_Output(other,self, "DIA_Greg_HaveJob_Later_15_00");	//Может быть позже.
		AI_Output(self,other, "DIA_Greg_HaveJob_Later_11_01");	//Дело твое. По мне так пусть они там все передохнут с голоду.
	Info_ClearChoices(DIA_Greg_HaveJob);
};
func void DIA_Greg_HaveJob_OK()
{
	AI_Output(other,self, "DIA_Greg_HaveJob_OK_15_00");	//Я отнесу еду пленным.
		AI_Output(self,other, "DIA_Greg_HaveJob_OK_11_01");	//Хорошо. Сходи к Марии, она даст тебе продукты, затем сходи к Зедду, он даст выпивку для Адо и Йорна.
	// UNFINISHED вписать дорогу к пещере
	AI_Output(self,other, "DIA_Greg_HaveJob_OK_11_02");	//После этого отправляйся в пещеру, она находится /*Redleha: там-то и там-то. НАДО ИСПРАВИТЬ*/.
		AI_Output(self,other, "DIA_Greg_HaveJob_OK_11_03");	//Пароль от входа в пещеру - ”Яркендар”.
	AI_Output(other,self, "DIA_Greg_HaveJob_OK_15_04");	//Выпивку пиратам? Как же они будут сторожить?
		AI_Output(self,other, "DIA_Greg_HaveJob_OK_11_05");	//(смеется) Да им эта выпивка, как мракорису сожрать зайца, на один жевок.
		AI_Output(self,other, "DIA_Greg_HaveJob_OK_11_06");	//Эти пропойцы еще будут кричать, что ты мало принес, особенно Йорн, попомни мое слово! Его луженое горло и бочкой рома не удивишь.

	Hero_KnowsDoorPassword = TRUE;
	
	//Запись в дневнике "Доставка припасов" 
	// UNFINISHED вписать дорогу к пещере
	B_DSG_Log_OpenClose(TOPIC_DS2P_ShippingSupplies,LOG_MISSION,LOG_Running,TOPIC_DS2P_ShippingSupplies_Start);
};

// ---------------------------------------------------
// Взять квест позже, диалог тот же		nr = 21
instance DIA_Greg_SuppliesLater(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 21;
	condition = DIA_Greg_SuppliesLater_condition;	
	information = DIA_Greg_HaveJob_OK;
	description = "Я отнесу еду пленным.";
};
func int DIA_Greg_SuppliesLater_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_HaveJob) && (MIS_DS2P_ShippingSupplies == 0))
	{	return TRUE;	};
};

// ---------------------------------------------------
// Сдать квест, если отдали продукты Виоле		nr = 22
instance DIA_Greg_SuppliesGiven(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 22;
	condition = DIA_Greg_SuppliesGiven_condition;	
	information = DIA_Greg_SuppliesGiven_info;
	description = "Я отнес припасы пленникам в пещеру.";
};
func int DIA_Greg_SuppliesGiven_condition()
{	
	if(Viola_SuppliesGiven == TRUE){	return TRUE;	};
};
func void DIA_Greg_SuppliesGiven_info()
{	
	var int x;
	AI_Output(other,self, "DIA_Greg_SuppliesGiven_15_00");	//Я отнес припасы пленникам в пещеру.
		AI_Output(self,other, "DIA_Greg_SuppliesGiven_11_01");	//Хорошо. Ты пока свободен. Вот золото за работу.
	//Дает 250 золотых
	x = 1; if (x == 1)	{
		B_GiveInvItems(self,other,ItMi_Gold,250);
	};

	//Запись в дневнике "Доставка припасов" квест окончен
	B_DSG_Log_OpenClose(TOPIC_DS2P_ShippingSupplies,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_ShippingSupplies_Success);
};


//NS - 28/06/2013 ================================================
// По квесту "Старый знакомый"
//================================================================

// ---------------------------------------------------
// "Я встретил Скипа."	nr = 30
instance DIA_Greg_MetSkip(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 30;
	condition = DIA_Greg_MetSkip_condition;	
	information = DIA_Greg_MetSkip_info;
	description = "Я встретил Скипа.";
};
func int DIA_Greg_MetSkip_condition()
{	
	if(MIS_DS2P_OldAcquaintance == LOG_Running)
	{	return TRUE;	};
};
func void DIA_Greg_MetSkip_info()
{	
	AI_Output(other,self, "DIA_Greg_MetSkip_15_00");	//Я встретил Скипа.
		AI_Output(self,other, "DIA_Greg_MetSkip_11_01");	//Где? Когда? Я перережу глотку этому сукину сыну!
	AI_Output(other,self, "DIA_Greg_MetSkip_15_02");	//Он каким-то образом пробрался на ”Эсмеральду”. Я обнаружил его в трюме. Он ничего не объяснил и сразу же удрал. 
		AI_Output(self,other, "DIA_Greg_MetSkip_11_03");	//Вот же выкидыш падальщика! Ну, ничего, теперь я его точно найду!
	AI_Output(other,self, "DIA_Greg_MetSkip_15_04");	//За что ты так невзлюбил Скипа?
		AI_Output(self,other, "DIA_Greg_MetSkip_11_05");	//Этот ублюдок сдал меня, когда я в прошлый раз решил сменить звание первого помощника на более подходящее – капитан Грег!
		AI_Output(self,other, "DIA_Greg_MetSkip_11_06");	//Но Скип посчитал, что у меня ничего не выйдет, а может просто решил, что с Гардом ему больше достанется золота с похода.
		AI_Output(self,other, "DIA_Greg_MetSkip_11_07");	//Поэтому когда я проник в каюту капитана и как полный кретин стоял с отравленным кинжалом, первое что я увидел – оскал Гарда, а потом получил удар по затылку.
		AI_Output(self,other, "DIA_Greg_MetSkip_11_08");	//Не знаю, сколько они меня пинали, и почему Гард оставил мне жизнь, но харкал кровью после этого я целую неделю. Чудом выкарабкался.
	AI_Output(other,self, "DIA_Greg_MetSkip_15_09");	//А зачем ты хотел убить Гарда?
		AI_Output(self,other, "DIA_Greg_MetSkip_11_10");	//Ты что, кретин? Даже падальщику понятно, капитан – это бог и непререкаемый авторитет для пиратов, если он думает головой и делит добычу поровну между командой.
		AI_Output(self,other, "DIA_Greg_MetSkip_11_11");	//Ну, или почти поровну. (хитро улыбается)
		AI_Output(self,other, "DIA_Greg_MetSkip_11_12");	//В общем, так. Если встретишь Скипа еще раз, передай дословно: ”Если вернешься сам, твоя смерть будет быстрой, но если я найду тебя – будешь завидовать демонам преисподней”.
	B_StartOtherRoutine(Skip,"HIDEINWOOD");
	//Запись в дневнике "Старый знакомый" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_OldAcquaintance,LOG_MISSION,LOG_Running,TOPIC_DS2P_OldAcquaintance_GregAngry);

};

// Активируется, если Скип решил помочь в квесте "Заговор"

instance DIA_Greg_SkipHelps(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 30;
	condition = DIA_Greg_SkipHelps_condition;	
	information = DIA_Greg_SkipHelps_info;
	description = "По поводу Скипа.";
};

func int DIA_Greg_SkipHelps_condition()
{	
	if((MIS_DS2P_OldAcquaintance == LOG_Running) && Npc_KnowsInfo(other,DIA_Skip_News))
	{	
		return TRUE;	
	};
};

func void DIA_Greg_SkipHelps_info()
{
	AI_Output(other,self, "DIA_Greg_SkipHelps_15_00");	//По поводу Скипа.
	AI_Output(self,other, "DIA_Greg_SkipHelps_11_01");	//Ты хочешь сказать, что этот ублюдок стал кормом для падальщиков?
	AI_Output(other,self, "DIA_Greg_SkipHelps_15_02");	//Нет, не угадал. Я встретил его в лесу и у него есть к тебе предложение.
	AI_Output(self,other, "DIA_Greg_SkipHelps_11_03");	//Какое? Надеюсь, не простить его?
	AI_Output(other,self, "DIA_Greg_SkipHelps_15_04");	//Почти. Я рассказал ему о нашем грядущем предприятии. Он хочет, чтобы ты простил его в обмен на его голос на предстоящем голосовании.
	AI_Output(self,other, "DIA_Greg_SkipHelps_11_05");	//(задумчиво) Хм. Простить этого клопа в обмен на голос? Хм. Ладно, шныг с ним. Если он проголосует за меня, то я обещаю, что он останется в живых. Но горе ему, если он и в этот раз предаст меня.
	AI_Output(self,other, "DIA_Greg_SkipHelps_11_06");	//Так и передай этому выкормышу лесного кротокрыса. Я немногим даю второй шанс, так что пусть лучше не испытывает судьбу.
	AI_Output(other,self, "DIA_Greg_SkipHelps_15_07");	//Так и передам.
	B_DSG_Log_OpenClose(TOPIC_DS2P_OldAcquaintance,LOG_MISSION,LOG_Running,TOPIC_DS2P_OldAcquaintance_GregAccept);
	AI_StopProcessInfos(self);
};

//NS - 01/05/2013 ================================================
// По квесту "Охранники для пещеры"
//================================================================
instance DIA_Greg_GuardsForCave(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 50;
	condition = DIA_Greg_GuardsForCave_condition;	
	information = DIA_Greg_GuardsForCave_info;
	description = "Меня прислал Адо.";
};
func int DIA_Greg_GuardsForCave_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_Start) && (MIS_DS2P_GuardsForCave == LOG_Running))
	{	return TRUE;	};
};

func void DIA_Greg_GuardsForCave_info()
{	
	AI_Output(other,self, "DIA_Greg_GuardsForCave_15_00");	//Меня прислал Адо. Он просит несколько людей для охраны пещеры.
		AI_Output(self,other, "DIA_Greg_GuardsForCave_11_00");	//Это еще почему? Там и так более, чем достаточно людей.
	AI_Output(other,self, "DIA_Greg_GuardsForCave_15_01");	//Йорн мертв.
		AI_Output(self,other, "DIA_Greg_GuardsForCave_11_01");	//Черт возьми! Так и знал, что нельзя доверить этому недотепе серьезное дело.
		AI_Output(self,other, "DIA_Greg_GuardsForCave_11_02");	//Ладно, иди к Караху и скажи, что я приказал ему отправляться в пещеру.
	// в дневник
	B_DSG_Log_OpenClose(TOPIC_DS2P_GuardsForCave,LOG_MISSION,LOG_Running,TOPIC_DS2P_GuardsForCave_TakeKarah);
};


//NS - 28/06/2013 ================================================
// Общие диалоги, после разговора про заговор
//================================================================

// ---------------------------------------------------
// "Мне нужно оружие."	nr = 10
instance DIA_Greg_NeedWeapon(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 10;
	condition = DIA_Greg_NeedWeapon_condition;	
	information = DIA_Greg_NeedWeapon_info;
	description = "Мне нужно оружие.";
};
func int DIA_Greg_NeedWeapon_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_StartConspiracy))
	{	return TRUE;	};
};
func void DIA_Greg_NeedWeapon_info()
{	
	AI_Output(other,self, "DIA_Greg_NeedWeapon_15_00");	//Мне нужно оружие.
		AI_Output(self,other, "DIA_Greg_NeedWeapon_11_01");	//Ты обратился не по адресу.
		AI_Output(self,other, "DIA_Greg_NeedWeapon_11_02");	//Гард с некоторых пор не доверяет мне, поэтому торговлей всей амуницией занимается Саймон. Обратись к нему.
		AI_Output(self,other, "DIA_Greg_NeedWeapon_11_03");	//И приготовь много золота – цены у него, прямо скажем, немалые.
};

// ---------------------------------------------------
// "Как ты оказался на острове?"	nr = 11
instance DIA_Greg_HowAppearOnIsland(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 11;
	condition = DIA_Greg_HowAppearOnIsland_condition;	
	information = DIA_Greg_HowAppearOnIsland_info;
	description = "Как ты оказался на острове?";
};
func int DIA_Greg_HowAppearOnIsland_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_StartConspiracy))
	{	return TRUE;	};
};
func void DIA_Greg_HowAppearOnIsland_info()
{	
	AI_Output(other,self, "DIA_Greg_HowAppearOnIsland_15_00");	//Как ты оказался на острове?
	AI_Output(other,self, "DIA_Greg_HowAppearOnIsland_15_01");	//Когда я отплывал с Хориниса, вы сидели в Яркендаре и не планировали сворачивать лагерь.
		AI_Output(self,other, "DIA_Greg_HowAppearOnIsland_11_02");	//Ты прав, не планировали. Через пару дней после того, как ты увел ”Эсмеральду”, к нам ”в гости” пожаловали бандиты во главе с Торусом.
		AI_Output(self,other, "DIA_Greg_HowAppearOnIsland_11_03");	//Он решил, что после смерти Равена мы решим напасть на их лагерь, чтобы прибрать к рукам золотой рудник, поэтому решил действовать на опережение. Была жуткая резня.
		AI_Output(self,other, "DIA_Greg_HowAppearOnIsland_11_04");	//Нам удалось отбиться, но почти вся моя команда была перебита.
		AI_Output(self,other, "DIA_Greg_HowAppearOnIsland_11_05");	//Второй атаки бандитов мы бы не пережили, поэтому я со Скипом решили убраться с острова, пока не стало слишком поздно.
		AI_Output(self,other, "DIA_Greg_HowAppearOnIsland_11_06");	//Скип сказал, что знает неплохое место для нового лагеря на Южных островах. Но туда мы уже не успели добраться.
		AI_Output(self,other, "DIA_Greg_HowAppearOnIsland_11_07");	//В море нас подобрал Гард на своем судне.
		AI_Output(self,other, "DIA_Greg_HowAppearOnIsland_11_08");	//Он сделал нам шикарное предложение – либо мы становимся частью его команды, либо они нас пускают по рее в море на корм акулам. Понятное дело, я согласился.
		AI_Output(self,other, "DIA_Greg_HowAppearOnIsland_11_09");	//Ну а дальше ты, думаю, уже знаешь – Гард взял нас в рейд на торговые суда, но помимо торговцев мы наткнулись на галеры орков.
		AI_Output(self,other, "DIA_Greg_HowAppearOnIsland_11_10");	//Корпус корабля был пробит, и нам чудом удалось добраться до берега.
};

// ---------------------------------------------------
// "Как ты относишься к Гарду?"	nr = 12
instance DIA_Greg_AboutGard(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 12;
	condition = DIA_Greg_AboutGard_condition;	
	information = DIA_Greg_AboutGard_info;
	description = "Как ты относишься к Гарду?";
};
func int DIA_Greg_AboutGard_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_StartConspiracy))
	{	return TRUE;	};
};
func void DIA_Greg_AboutGard_info()
{	
	AI_Output(other,self, "DIA_Greg_AboutGard_15_00");	//Как ты оказался на острове?
		AI_Output(self,other, "DIA_Greg_AboutGard_11_01");	//Я знаю, что ты хочешь услышать от меня, но ты не прав!
		AI_Output(self,other, "DIA_Greg_AboutGard_11_02");	//Если отбросить наши личные разногласия и дележку власти, то я бы сказал, что Гард один из лучших капитанов, которых я встречал на своем веку.
		AI_Output(self,other, "DIA_Greg_AboutGard_11_03");	//Он отличный стратег и тактик, умеет держать команду в своих руках, его все боятся и уважают. А это, поверь мне, очень дорого стоит!
		AI_Output(self,other, "DIA_Greg_AboutGard_11_04");	//Поэтому, можно сказать, что в чем-то мы очень похожи, а двум таким людям никогда не договориться, если уж жизнь свела вместе.
		AI_Output(self,other, "DIA_Greg_AboutGard_11_05");	//Один должен уйти либо добровольно, либо отдать свою жизнь. Другого пути нет!
};

// ---------------------------------------------------
// "Не боишься, что капитан обо всем узнает?"	после предыдцщего, постоянный	nr = 13
instance DIA_Greg_DontAfraidGard(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 13;
	condition = DIA_Greg_DontAfraidGard_condition;	
	information = DIA_Greg_DontAfraidGard_info;
	description = "Не боишься, что капитан обо всем узнает?";
	permanent = TRUE;
};
func int DIA_Greg_DontAfraidGard_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_AboutGard))
	{	return TRUE;	};
};
func void DIA_Greg_DontAfraidGard_info()
{	
	AI_Output(other,self, "DIA_Greg_DontAfraidGard_15_00");	//Не боишься, что капитан обо всем узнает?
		AI_Output(self,other, "DIA_Greg_DontAfraidGard_11_01");	//Я столько повидал на своем веку, что уже давно ничего не боюсь.
};

// ---------------------------------------------------
// "По поводу нашей задумки..."	nr = 15
var int C_DIA_Greg_OurIdea_Know_AboutSue;
var int C_DIA_Greg_OurIdea_Know_AboutZedd;
var int C_DIA_Greg_OurIdea_Know_AboutSymon;
var int C_DIA_Greg_OurIdea_Know_AboutVales;
var int C_DIA_Greg_OurIdea_Know_AboutJoseph;
var int C_DIA_Greg_OurIdea_Know_WhatHappensToGard;
var int C_DIA_Greg_OurIdea_Know_AnyAdvice4me;

var int C_DIA_Greg_OurIdea_Tell_AboutJoseph;
var int C_DIA_Greg_OurIdea_Tell_AboutZedd;
var int C_DIA_Greg_OurIdea_Tell_AboutVales;
var int C_DIA_Greg_OurIdea_Tell_AboutSue;
var int C_DIA_Greg_OurIdea_Tell_AboutSymon;
const int C_DIA_Greg_OurIdea_Members = 0;

instance DIA_Greg_OurIdea(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 15;
	condition = DIA_Greg_OurIdea_condition;	
	information = DIA_Greg_OurIdea_info;
	description = "По поводу нашей задумки...";
	permanent = TRUE;
};
func int DIA_Greg_OurIdea_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_StartConspiracy) && (MIS_DS2P_Conspiracy == Log_Running) && Conspiracy_IsStarted == FALSE)
	{	return TRUE;	};
};
func void DIA_Greg_OurIdea_info()
{	
	AI_Output(other,self, "DIA_Greg_OurIdea_15_00");	//По поводу нашей задумки...
		AI_Output(self,other, "DIA_Greg_OurIdea_11_00");	//Да? Что-то новое?
	Info_ClearChoices(DIA_Greg_OurIdea);
	Info_AddChoice(DIA_Greg_OurIdea, "Нет, ничего." , DIA_Greg_OurIdea_End);
	Info_AddChoice(DIA_Greg_OurIdea, "У меня пара вопросов." , DIA_Greg_OurIdea_IveFewQuestions);
};
func void DIA_Greg_OurIdea_End()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_End_15_00");	//Нет, ничего.
	AI_Output(self,other, "DIA_Greg_OurIdea_End_11_01");	//Тогда не отвлекай меня.
	Info_ClearChoices(DIA_Greg_OurIdea);
};

func void B_DIA_Greg_OurIdea_IveFewQuestions()
{
	Info_ClearChoices(DIA_Greg_OurIdea);
	Info_AddChoice(DIA_Greg_OurIdea, "Это все, что я хотел знать." , DIA_Greg_OurIdea_ThatsAll);
	
	if(!C_DIA_Greg_OurIdea_Know_AnyAdvice4me){
		Info_AddChoice(DIA_Greg_OurIdea, "Есть пара советов для меня?" , DIA_Greg_OurIdea_TellMeAnyAdvice4me);
	};
	if(!C_DIA_Greg_OurIdea_Know_WhatHappensToGard){
		Info_AddChoice(DIA_Greg_OurIdea, "Что будет с Гардом после того, как мы его сместим?" , DIA_Greg_OurIdea_TellMeAboutGard);
	};	
	if(!C_DIA_Greg_OurIdea_Know_AboutVales){
		Info_AddChoice(DIA_Greg_OurIdea, "Что тебе известно о Валесе?" , DIA_Greg_OurIdea_TellMeAboutVales);
	};	
	if(!C_DIA_Greg_OurIdea_Know_AboutZedd){
		Info_AddChoice(DIA_Greg_OurIdea, "Как нам склонить к сотрудничеству Зедда?" , DIA_Greg_OurIdea_TellMeAboutVales);
	};	
	if(!C_DIA_Greg_OurIdea_Know_AboutSymon){
		Info_AddChoice(DIA_Greg_OurIdea, "Чем заинтересовать Саймона?" , DIA_Greg_OurIdea_TellMeAboutSymon);
	};
	if(!C_DIA_Greg_OurIdea_Know_AboutSue){
		Info_AddChoice(DIA_Greg_OurIdea, "Расскажи мне о Сью." , DIA_Greg_OurIdea_TellMeAboutSue);
	};
	if(!C_DIA_Greg_OurIdea_Know_AboutJoseph){
		Info_AddChoice(DIA_Greg_OurIdea, "Что ты знаешь о Джозефе?" , DIA_Greg_OurIdea_TellMeAboutJoseph);
	};
	if(Joseph_InConspiracy && !C_DIA_Greg_OurIdea_Tell_AboutJoseph)
	{
		Info_AddChoice(DIA_Greg_OurIdea, "Джозеф с нами." , DIA_Greg_OurIdea_JosephWithUs);
	};
	if(Vales_InConspiracy == TRUE && !C_DIA_Greg_OurIdea_Tell_AboutVales)
	{
		Info_AddChoice(DIA_Greg_OurIdea, "Я убедил Валеса." , DIA_Greg_OurIdea_JosephWithUs);
	};
	if(Zedd_InConspiracy && !C_DIA_Greg_OurIdea_Tell_AboutZedd)
	{
		Info_AddChoice(DIA_Greg_OurIdea, "Зедд проголосует за тебя." , DIA_Greg_OurIdea_JosephWithUs);
	};
	if(SueBaby_InConspiracy && !C_DIA_Greg_OurIdea_Tell_AboutSue)
	{
		Info_AddChoice(DIA_Greg_OurIdea, "Малышка Сью тоже с нами." , DIA_Greg_OurIdea_JosephWithUs);
	};
	if(Symon_InConspiracy && !C_DIA_Greg_OurIdea_Tell_AboutSymon)
	{
		Info_AddChoice(DIA_Greg_OurIdea, "Саймон против Гарда." , DIA_Greg_OurIdea_JosephWithUs);
	};
	if(C_DIA_Greg_OurIdea_Members == 5)
	{
		Info_AddChoice(DIA_Greg_OurIdea, "Я убедил всех пиратов." , DIA_Greg_OurIdea_StartConspiracy);
	};
};

func void DIA_Greg_OurIdea_IveFewQuestions()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_IveFewQuestions_15_00");	//У меня есть к тебе несколько вопросов.
		AI_Output(self,other, "DIA_Greg_OurIdea_IveFewQuestions_11_01");	//Давай, только быстро!
	B_DIA_Greg_OurIdea_IveFewQuestions();	
};
func void DIA_Greg_OurIdea_ThatsAll()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_ThatsAll_15_00");	//Это все, что я хотел знать.
		AI_Output(self,other, "DIA_Greg_OurIdea_ThatsAll_11_01");	//Тогда иди, шевели ластами.
	Info_ClearChoices(DIA_Greg_OurIdea);
};
func void DIA_Greg_OurIdea_TellMeAnyAdvice4me()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_15_00");	//Есть пара советов для меня?
	AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_11_01");	//Черт! Парень, ты мне уже начинаешь надоедать!
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_15_02");	//Не кипятись – общее дело делаем.
	AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_11_03");	//Ладно, пара советов действительно найдется. Слушай, постарайся убедить пиратов, что удача отвернулась от их капитана. Моряки – люди суеверные, и удача их лидера имеет важное значение в жизни команды.
	AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_11_04");	//Намеками постарайся донести до них, что Гард – отработанный материал, что отпущенная ему Аданосом удача иссякла. Понял?
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_15_05");	//А поподробнее, о чем намекать, расскажешь?
	AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_11_06");	//Во-первых, наш лагерь и большая часть людей погибла на острове, где мы торговали с орками. А это была идея Гарда обосноваться там, и он всех убедил сделать это. Во-вторых, мы потеряли наш корабль, налетев на грамотную засаду орков, лишившись еще несколько хороших парней.
	AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_11_07");	//А до этого, скажу тебе под большим секретом, мы умудрились упустить двух торговцев, а также взяли корабль с пустыми трюмами. И это в одну неделю! Перед самым нашим вынужденным списанием на берег! 
	AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_11_08");	//Неудачи стали преследовать нашего капитана, и это все видят, хоть и не осознают еще этого. Ты должен как-нибудь подтолкнуть их к этому решению.
	AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_11_09");	//Будет вообще здорово, если ты сделаешь так, что сами пираты устроят общий сбор и голосование, а также выдвинут меня на пост капитана. Усек?
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_15_10");	//Я все понял.
	B_DIA_Greg_OurIdea_IveFewQuestions();
};
func void DIA_Greg_OurIdea_TellMeAboutGard()
{
	
};

func void DIA_Greg_OurIdea_TellMeAboutVales()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutVales_15_00");	//Что тебе известно о Валесе?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutVales_11_00");	//Немногое. Этот мракорисов выкидыш предпочитает молчать, когда дело доходит до него родного. Единственное, что мне известно, так это то, что своих родителей он не знает. И все.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutVales_15_01");	//Негусто.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutVales_11_03");	//Сам понимаю, но больше ничем помочь не могу.
	C_DIA_Greg_OurIdea_Know_AboutVales = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_GregAboutVales);
	B_DIA_Greg_OurIdea_IveFewQuestions();
};
func void DIA_Greg_OurIdea_TellMeAboutZedd()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutZedd_15_00");	//Как нам склонить к сотрудничеству Зедда?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutZedd_11_00");	//(ухмыляясь) Это будет самым простым для тебя. Зедд хоть и пьяница, но он единственный в команде Гарда, кто умеет нормально читать и писать.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutZedd_11_01");	//Поэтому Гард назначил его своим первым помощником. Смекаешь?
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutZedd_15_01");	//Хм, ты имеешь ввиду, что Зедд мог нарочито неправильно подсчитать прибыль и часть золота с добычи прикарманить себе?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutZedd_11_03");	//Да, демонская твоя печенка! Да! Надо только найти его учетную книгу.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutZedd_11_04");	//Не фальшивку, которая у всех на виду и в которой нет ни слова правды, а настоящую.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutZedd_15_01");	//А ты не думаешь, что эта книга могла остаться где-то в прежнем убежище?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutZedd_11_03");	//Зедд будет настоящим дураком, если оставит такое сокровище где-то вдали от себя.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutZedd_11_04");	//Всегда есть шанс, что тайник найдут. И тогда ему несдобровать.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutZedd_11_04");	//Нет, эта книга наверняка при нем. Если он ее и спрятал где-то, то только рядом с собой, чтобы она всегда была перед глазами.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutZedd_11_04");	//Либо у себя в куртке, либо в таверне или в ее окрестностях. Понятно?
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutZedd_15_01");	//Вполне.
	
	C_DIA_Greg_OurIdea_Know_AboutZedd = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_GregAboutZedd);
	B_DIA_Greg_OurIdea_IveFewQuestions();
};
func void DIA_Greg_OurIdea_TellMeAboutSymon()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSymon_15_00");	//Чем заинтересовать Саймона?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_00");	//Он жаден до безобразия.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSymon_15_01");	//Хм, знакомая картина.
		AI_DrawWeapon(self);
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_01");	//Ты на что-то намекаешь?
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSymon_15_02");	//(притворно) Нет, что ты.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_02");	//Еще одна твоя такая шуточка...
		AI_RemoveWeapon(self);
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_03");	//Итак, на чем мы остановились? Саймона, думаю, можно купить, но заплатить придется много.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSymon_15_03");	//Сколько?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_04");	//Тысячи две, не меньше.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSymon_15_04");	//Сколько?! Это же уйма золота! А полегче варианта нет?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_05");	//Ну, на самом деле есть одна вещь, но она не легче.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSymon_15_05");	//Рассказывай. Деньги дать всегда успеем.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_06");	//В общем, Саймон запал на Малышку Сью, серьезно запал. Уже раз двадцать пытался подкатить к ней, но она всякий раз его отшивала.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_07");	//Другой бы давно сдался, но наш толстолобый бык не знает что такое ”сдаваться” или ”отступать”.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSymon_15_06");	//Ты предлагаешь сделать так, чтобы Малышка Сью начала встречаться с Саймоном?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_08");	//Да, подойди к Саймону, предложи свою помощь и сделай это.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSymon_15_07");	//Не любишь ты легких путей. Почему бы просто не перерезать Гарду глотку?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_09");	//После того случая он всегда настороже, не доверяет ни мне, ни кому-либо еще и спит с закрытыми дверьми и с оружием в обнимку.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_10");	//А все из-за этого шныжьего сына Скипа! Ну попадись он мне!..
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSymon_15_08");	//Ладно, я посмотрю, что можно сделать.
	
	C_DIA_Greg_OurIdea_Know_AboutSymon = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_GregAboutSymon);
	B_DIA_Greg_OurIdea_IveFewQuestions();
};
func void DIA_Greg_OurIdea_TellMeAboutSue()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSue_15_00");	//Расскажи мне о Сью.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSue_11_00");	//Бойкая, резкая, язвительная. Не любит, когда ее называют Малышкой. Очень хороший фехтовальщик, особенно для женщины.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSue_11_01");	//Пиратом она стала в четырнадцатилетнем возрасте. Она пробралась тайком, спасаясь от бедности, на один купеческий корабль, который вскоре абордировал Гард на своей «Каталине».
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSue_11_02");	//Девочку они нашли в трюме, и, когда команда собиралась немного поразвлечься, пришел Гард и забрал девчонку себе.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSue_11_03");	//Обращался он с ней неплохо, надеясь, что Сью из богатой семьи и удастся выручить деньги за выкуп.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSue_11_04");	//Но он ошибся: она была сиротой, и впоследствии Сью присоединилась к нему в команду.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSue_11_05");	//Девочка стала учиться мореходству и владению шпагой. Она и по сей день верна Гарду, который открыл для нее новую жизнь.
		
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSue_15_01");	//(задумчиво) Хммм... И как ты надеешься переманить ее на свою сторону, если она так верна Гарду?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSue_11_06");	//(ухмыляясь) А в этом, мой таинственный друг, я надеюсь на твою наглость, удачу и харизму.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSue_11_07");	//Если кто и сможет убедить ее присоединиться к нам, то только ты.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSue_15_02");	//ГГ: Будет трудно.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSue_11_09");	//Понимаю. Могу дать подсказку.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSue_11_10");	//Она, несмотря на весь свой мужской характер, старается быть женщиной. Попробуй сыграть на этом.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSue_15_03");	//Хорошо, я посмотрю, что можно сделать.
	
	C_DIA_Greg_OurIdea_Know_AboutSue = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_GregAboutSue);
	B_DIA_Greg_OurIdea_IveFewQuestions();
};
func void DIA_Greg_OurIdea_TellMeAboutJoseph()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutJoseph_15_00");	//Что ты знаешь о Джозефе?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutJoseph_11_00");	//Неплохой кузнец, вспыльчивый. Любит пошутить и выпить не дурак.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutJoseph_11_01");	//Я уже несколько месяцев в команде Гарда, и все это время слышу, как он мечтает выковать какой-то особый топор.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutJoseph_11_02");	//Он даже однажды признался, что душу продаст Белиару, только бы закончить работу.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutJoseph_15_01");	//(скептически) И он за несколько месяцев так и не выковал его?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutJoseph_11_03");	//(усмехаясь) Нет, больно уж материалы специфические, о многих я даже и не слышал.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutJoseph_11_04");	//Так что, если ты сможешь помочь ему в его проблеме, то он наш с потрохами.
	
	C_DIA_Greg_OurIdea_Know_AboutJoseph = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_GregAboutJoseph);
	B_DIA_Greg_OurIdea_IveFewQuestions();
};

func void DIA_Greg_OurIdea_JosephWithUs()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_JosephWithUs_15_00");	//Джозеф с нами.
	AI_Output(self,other, "DIA_Greg_OurIdea_JosephWithUs_11_01");	//Отлично! Что-то еще?
	C_DIA_Greg_OurIdea_Tell_AboutJoseph = TRUE;
	C_DIA_Greg_OurIdea_Members = C_DIA_Greg_OurIdea_Members + 1;
	B_DIA_Greg_OurIdea_IveFewQuestions();
};

func void DIA_Greg_OurIdea_ValesWithUs()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_ValesWithUs_15_00");	//Я убедил Валеса.
	AI_Output(self,other, "DIA_Greg_OurIdea_ValesWithUs_11_01");	//Очень хорошо, его голос нам понадобится.
	AI_Output(other,self, "DIA_Greg_OurIdea_ValesWithUs_15_02");	//Только у Валеса есть одно условие, на которое я согласился.
	AI_Output(self,other, "DIA_Greg_OurIdea_ValesWithUs_11_03");	//Что? Какое еще условие, якорь тебе в жабры?!
	AI_Output(other,self, "DIA_Greg_OurIdea_ValesWithUs_15_05");	//После голосования он хочет завязать с пиратством.
	AI_Output(self,other, "DIA_Greg_OurIdea_ValesWithUs_11_06");	//Хм, а ладно, пусть катится ко всем чертям, когда все закончится. Что-то еще?
	C_DIA_Greg_OurIdea_Tell_AboutVales = TRUE;
	C_DIA_Greg_OurIdea_Members = C_DIA_Greg_OurIdea_Members + 1;
	B_DIA_Greg_OurIdea_IveFewQuestions();
};

func void DIA_Greg_OurIdea_ZeddWithUs()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_ZeddWithUs_15_00");	//Зедд проголосует за тебя.
	AI_Output(self,other, "DIA_Greg_OurIdea_ZeddWithUs_11_01");	//Ого, я погляжу нашего старого пьяницу ты смог убедить.
	AI_Output(other,self, "DIA_Greg_OurIdea_ZeddWithUs_15_02");	//Да, прихватил его за яйца, теперь у него нет выбора.
	C_DIA_Greg_OurIdea_Tell_AboutZedd = TRUE;
	C_DIA_Greg_OurIdea_Members = C_DIA_Greg_OurIdea_Members + 1;
	B_DIA_Greg_OurIdea_IveFewQuestions();
};

func void DIA_Greg_OurIdea_SymonWithUs()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_SymonWithUs_15_00");	//Саймон против Гарда.
	AI_Output(self,other, "DIA_Greg_OurIdea_SymonWithUs_11_01");	//Что ж, даже голос такого дурака нам не повредит.
	C_DIA_Greg_OurIdea_Tell_AboutSymon = TRUE;
	C_DIA_Greg_OurIdea_Members = C_DIA_Greg_OurIdea_Members + 1;
	B_DIA_Greg_OurIdea_IveFewQuestions();
};

func void DIA_Greg_OurIdea_SueWithUs()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_SueWithUs_15_00");	//Малышка Сью тоже с нами.
	AI_Output(self,other, "DIA_Greg_OurIdea_SueWithUs_11_01");	//А вот этого я, честно говоря, не ожидал. Думал, ее ты убедить не сможешь. Рад, что ошибся.
	AI_Output(other,self, "DIA_Greg_OurIdea_SueWithUs_15_02");	//С ней было легче всего. Только Сью поставила условие, которое тебе лично очень выгодно.
	AI_Output(self,other, "DIA_Greg_OurIdea_SueWithUs_11_03");	//Говори!
	AI_Output(other,self, "DIA_Greg_OurIdea_SueWithUs_15_04");	//Сью сама устроит общее собрание, обвинит Гарда во всех смертных грехах и выдвинет тебя на пост капитана. Когда голосование пройдет и Гард станет простым матросом, уже бывший капитан захочет поквитаться и вызовет Сью на бой. Девушка хочет сама убить Гарда.
	AI_Output(self,other, "DIA_Greg_OurIdea_SueWithUs_11_05");	//Ого! Даже боюсь представить, что ты ей наплел.
	AI_Output(other,self, "DIA_Greg_OurIdea_SueWithUs_15_06");	//Вообще-то она сама это предложила. Она уже давно хочет низложить Гарда.
	AI_Output(self,other, "DIA_Greg_OurIdea_SueWithUs_11_07");	//Главное, чтобы она потом не захотела  низложить меня.
	AI_Output(other,self, "DIA_Greg_OurIdea_SueWithUs_15_08");	//Вот и следи за этим.
	C_DIA_Greg_OurIdea_Tell_AboutSue = TRUE;
	C_DIA_Greg_OurIdea_Members = C_DIA_Greg_OurIdea_Members + 1;
	B_DIA_Greg_OurIdea_IveFewQuestions();
};

func void DIA_Greg_OurIdea_StartConspiracy()
{
	B_DSG_StartConspiracy(); // Начинаем собрание
	AI_Output(other,self, "DIA_Greg_OurIdea_SueWithUs_15_00");	//Я убедил всех пиратов. Они проголосуют за тебя.
	AI_Output(self,other, "DIA_Greg_OurIdea_SueWithUs_11_01");	//Отлично! Я и не сомневался в твоих способностях запудрить кому-то мозги. Жаль только я оплошал немного.
	AI_Output(other,self, "DIA_Greg_OurIdea_SueWithUs_15_02");	//Почему?
	AI_Output(self,other, "DIA_Greg_OurIdea_SueWithUs_11_03");	//Я смог убедить только Лана, остальные даже не помышляют о смене капитана, поэтому я не стал заводить с ними разговора, чтобы не возбуждать подозрений.
	AI_Output(other,self, "DIA_Greg_OurIdea_SueWithUs_15_04");	//Что дальше?
	AI_Output(self,other, "DIA_Greg_OurIdea_SueWithUs_11_05");	//Я уже связался с Малышкой Сью. Она должна была уже начать… Слышишь шум на улице? Кажется, началось. Пошли за мной!
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,Log_Running,TOPIC_DS2P_Conspiracy_IsStarted);
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoWP(self,"TESTWP"); // UNFINISHED - надо вписать вэйпоинт
	AI_StopProcessInfos(self);
};

instance DIA_Greg_BeginConspiracy(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 15;
	condition = DIA_Greg_BeginConspiracy_condition;	
	information = DIA_Greg_BeginConspiracy_info;
	description = " ";
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Greg_BeginConspiracy_condition()
{	
	if(Conspiracy_IsStarted && (Npc_GetDistToWP(self,"TESTWP") <= 600)) // UNFINISHED - вписать вэйпоинт
	{	
		return TRUE;	
	};
};

func void DIA_Greg_BeginConspiracy_info()
{
	TRIA_Start();
	TRIA_Invite(Gard);
	TRIA_Invite(SueBaby);
	TRIA_Invite(Ado);
	TRIA_Invite(Karah);
	TRIA_Invite(Symon);
	TRIA_Invite(Greg);
	TRIA_Next(Gard);
	AI_TurnToNpc(other,Gard);
	AI_TurnToNpc(SueBaby,Gard);
	AI_TurnToNpc(Ado,Gard);
	AI_TurnToNpc(Karah,Gard);
	AI_TurnToNpc(Symon,Gard);
	AI_TurnToNpc(Greg,Gard);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_00");	//Что за черт здесь происходит?! Что за собрание баранов?! Быстро все по своим местам! Адо!!! Какого мракориса ты прохлаждаешься на пляже, когда должен охранять заложников?!
	TRIA_Next(Ado);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_02_01");	//Капитан, у нас общее собрание.
	TRIA_Next(Gard);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_02");	//Что еще за собрание, подери вас всех шныг?!!
	TRIA_Next(SueBaby);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_03_03");	//Гард! Я собрала здесь всех, чтобы сказать, что ты больше не можешь быть нашим капитаном.
	TRIA_Next(Gard);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_04");	//Это я-то не могу быть капитаном? Ты каких грибов объелась, Малышка? Отвечать!
	TRIA_Next(SueBaby);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_03_05");	//Из-за твоей жадности мы потеряли наших людей на предыдущей стоянке, другом острове. Все они погибли только потому, что ты решил торговать с орками!
	AI_Output(self,other, "DIA_Greg_BeginConspiration_03_06");	//Где теперь деньги, где наши люди? Это раз. Два – из-за твоей дурацкой ошибки затонул наш корабль.
	TRIA_Next(Gard);
	AI_TurnToNpc(Gard,Vatras);
	AI_PlayAni(Gard,"T_POINT");
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_07");	//Вот НАШ корабль, стоит на причале и только и ждет, чтобы его забрали!
	Npc_StopAni(Gard,"T_POINT");
	AI_TurnToNpc(Gard,SueBaby);
	TRIA_Next(SueBaby);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_03_08");	//Он ПОКА еще не наш, его охраняет сильный маг воды. Ты хочешь, чтобы он перебил половину наших людей? А если и остальные найдут в себе силы встать? Там ведь есть еще и маг огня, тогда нам точно ничего не светит.
	AI_Output(self,other, "DIA_Greg_BeginConspiration_03_09");	//А также на ногах один воин с галеона, который стоит здесь и слышит нас.
	TRIA_Next(Gard);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_10");	//Значит, мы нападем сейчас и вырежем их все, пока они без сил! А этого, выражаясь твоим языком, воина мы прикончим прямо сейчас.
	TRIA_Next(SueBaby);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_03_11");	//Брось, Гард. Уже слишком поздно. Ты не можешь вести за собой людей, твоя удача иссякла. По твоей глупости мы оказались на этом проклятом Белиром клочке суши без денег, запасов и награбленного – всего того, что затонуло вместе с «Каталиной».
	TRIA_Next(Gard);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_12");	//Это еще не повод говорить, что я неудачливый капитан.
	TRIA_Next(SueBaby);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_03_13");	//А те корабли, которые мы упустили за неделю до потери «Каталины»? Признай хотя бы самому себе, Гард, что как капитан ты уже не годишься?
	TRIA_Next(Gard);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_14");	//(угрожающе) Вот как? И кто же по твоему годиться на пост капитана?
	TRIA_Next(SueBaby);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_03_15");	//Грег! Он тоже пиратский капитан, причем многими уважаемый.
	TRIA_Next(Gard);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_16");	//Этот одноглазый увалень? Это даже не смешно! А теперь все быстро разошлись по своим местам, пока я не разозлился по-настоящему. БЫСТРО!!!
	TRIA_Next(Karah);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_04_17");	//Слово сказано, капитан. Вместо Сью говорят эмоции, но во многом она права. Однако решать – быть ли тебе в дальнейшем капитаном или нет – предстоит общему собранию. Так ребята?
	TRIA_Next(Ado);
	AI_PlayAni(Ado,"T_SLEESHOOT");
	AI_Output(self,other, "DIA_Greg_BeginConspiration_04_18");	//Так, так.
	TRIA_Next(Symon);
	AI_PlayAni(Symon,"T_SLEESHOOT");
	AI_Output(self,other, "DIA_Greg_BeginConspiration_05_19");	//Верно.
	TRIA_Next(Gard);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_20");	//Кто ж, тогда и я скажу свое слово. Забыли, гоблины, кто вел вас все эти годы, а? Кто приводил вас от победы к победе, с кем вы делили последний кусок хлеба и глоток рома после ужасных штормов?
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_21");	//Кто не раз вытаскивал некоторых из вас из виселицы в самый последний момент? Кто справедливо распределял добычу между вами, болванами? Кто, я спрашиваю? И что для вас сделал этот одноглазый идиот?
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_22");	//Да вы потонете вместе с ним, как «Каталина» ко дну пойдете!
	TRIA_Next(Greg);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_06_23");	//Теперь и я скажу кое-что. 
	AI_TurnToNpc(Ado,Greg);
	AI_TurnToNpc(other,Greg);
	AI_TurnToNpc(Gard,Greg);
	AI_TurnToNpc(Symon,Greg);
	AI_TurnToNpc(Zedd,Greg);
	AI_TurnToNpc(Vales,Greg);
	AI_TurnToNpc(Karah,Greg);
	if (!Npc_IsDead(GrayBeard))
	{
		AI_TurnToNpc(GrayBeard,Greg);
	};
	if (!Npc_IsDead(Jorn))
	{
		AI_TurnToNpc(Jorn,Greg);
	};
	AI_TurnToNpc(SueBaby,Greg);
	AI_TurnToNpc(Joseph,Greg);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_06_24");	//Вы все меня знаете не так уж и долго, но со многими из вас я успел подружиться и завоевать кое-какое ваше уважение. Там, где раньше я обретался вместе со своими людьми, есть золотоносная шахта, и золота там столько, что вам понадобиться огромный караван повозок, чтобы утащить все оттуда.
	AI_Output(self,other, "DIA_Greg_BeginConspiration_06_25");	//И еще останется. Чтобы забрать это золото, надо всего лишь выбить нескольких бандитов оттуда, и оно наше. Так вот, если я стану капитаном, то обещаю отдать эту шахту вам, всем вам. 
	AI_Output(self,other, "DIA_Greg_BeginConspiration_06_26");	//Мы будем разрабатывать ее и получать с этого огромное количество денег.
	TRIA_Next(Karah);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_04_27");	//А как же городские власти? На Хоринисе ведь есть портовый город.
	TRIA_Next(Greg);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_06_28");	//Этот город не знает о шахте, они даже не знают о долине, в которой расположена эта самая шахта. А если и узнают, то не сунуться. Городская стража и метра не пройдет, как наткнется на множество хищных зверей и отступит в страхе.
	AI_Output(self,other, "DIA_Greg_BeginConspiration_06_29");	//Поэтому нам нечего бояться. Мы будем богатеть прямо на глазах и практически ничего не делать для этого.
	TRIA_Next(Karah);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_04_30");	//Складно говоришь, одноглазый. Однако это не отменяет того факта, что Гарда мы знаем давно, а тебя всего ничего. Но, как уже говорилось ранее, все решит голосование. Итак, поднимите руки те из вас, кто хочет, чтобы капитаном продолжал быть Гард.
	AI_PlayAni(Ado,"T_SLESHOOT");
	AI_PlayAni(Karah,"T_SLESHOOT");
	if (!Npc_IsDead(GrayBeard))
	{
		AI_PlayAni(GrayBeard,"T_SLESHOOT");
	};
	if (!Npc_IsDead(Jorn))
	{
		AI_PlayAni(Jorn,"T_SLESHOOT");
	};
	AI_PlayAni(Gard,"T_SLESHOOT");
	AI_Output(self,other, "DIA_Greg_BeginConspiration_04_31");	//Итак, голоса подсчитаны. Теперь поднимите руки те, кто считает, что нам нужен новый капитан, капитан Грег.
	AI_PlayAni(Greg,"T_SLESHOOT");
	AI_PlayAni(SueBaby,"T_SLESHOOT");
	AI_PlayAni(Symon,"T_SLESHOOT");
	AI_PlayAni(Joseph,"T_SLESHOOT");
	AI_PlayAni(Zedd,"T_SLESHOOT");
	AI_PlayAni(LanSkeleton,"T_SLESHOOT");
	//AI_PlayAni(Skip,"T_SLESHOOT");
	AI_Output(self,other, "DIA_Greg_BeginConspiration_04_32");	//Голосование прошло по всем законам Морского братства. С преимуществом в голосах победил Грег, отныне ему и носить гордое звание капитана. Так говорю я, хранитель пиратского Кодекса. Есть несогласные?
	TRIA_Next(Gard);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_33");	//Да, черт возьми, есть! Забыли, ублюдки, кто не раз спасал ваши шкуры, свиньи неблагодарные?! Но ничего, я это запомню, но сначала… Сью, чертовка, это все ты затеяла, тебе и отвечать! Я вызываю тебя на бой до смерти, отказ не принимается. Защищайся!
	TRIA_Finish();
	DIAG_Reset();
	B_Attack(Gard,SueBaby,AR_NONE,0);
	B_Attack(SueBaby,Gard,AR_NONE,0);
	AI_StopProcessInfos(self);
};

// ---------------------------------------------------
//NS - 17/07/2013 ================================================
// По квесту "Внук рыбака"
//================================================================
// "Теперь Гарон - один из пиратов." +300зол.			nr = 40
instance DIA_Greg_GaronBecomePirate(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 40;
	condition = DIA_Greg_GaronBecomePirate_condition;	
	information = DIA_Greg_GaronBecomePirate_info;
	description = "Теперь Гарон – один из пиратов.";
};
func int DIA_Greg_GaronBecomePirate_condition()
{	
	if(Garon_Choice == Garon_Choice_Pirate)
	{	return TRUE;	};
};
func void DIA_Greg_GaronBecomePirate_info()
{	
	var int x;
	AI_Output(other,self, "DIA_Greg_GaronBecomePirate_15_00");	//Теперь Гарон – один из пиратов.
		AI_Output(self,other, "DIA_Greg_GaronBecomePirate_11_01");	//Да, и что?
	AI_Output(other,self, "DIA_Greg_GaronBecomePirate_15_02");	//Как что? Это я нашел и уговорил стать пиратом.
		AI_Output(self,other, "DIA_Greg_GaronBecomePirate_11_03");	//Что ты?.. Нашел?
	AI_Output(other,self, "DIA_Greg_GaronBecomePirate_15_04");	//Тебе Карах разве не рассказывал, что Гарон сбежал?
		AI_Output(self,other, "DIA_Greg_GaronBecomePirate_11_05");	//Да, я знаю об этом, но при чем тут ты?
	AI_Output(other,self, "DIA_Greg_GaronBecomePirate_15_06");	//При том, что я вернул его, а также помог ему сделать правильный выбор.
		AI_Output(self,other, "DIA_Greg_GaronBecomePirate_11_07");	//Ладно. Вот золото за твои труды.
	//Дает 300 золотых.
	x = 1; if (x == 1)	{
		B_GiveInvItems(self,other, ItMi_Gold, 300);
	};

	//После этого Гарон переодевается в одежку пирата, дать ему мечик
	var C_NPC Garon;	Garon = Hlp_GetNpc(BAU_117_DS2P_Garon);
	CreateInvItem(Garon,ITAR_PIR_L_DS);
	CreateInvItem(Garon,ItMw_1H_Common_01);
	AI_EquipArmor(Garon,ITAR_PIR_L_DS);
	AI_EquipBestMeleeWeapon(Garon);
	B_StartOtherRoutine(Garon,"PIRAT");	
};

//"Я тебя хочу кое о чем попросить.". Активируется, после диалога с Серой Бородой о соревновании
// nr = 1

instance DIA_Greg_GrayBeardCompetition(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Greg_GrayBeardCompetition_condition;	
	information = DIA_Greg_GrayBeardCompetition_info;
	description = "Я тебя хочу кое о чем попросить.";
};

func int DIA_Greg_GrayBeardCompetition_condition()
{	
	if(Garon_Choice == Garon_Choice_Pirate)
	{	
		return TRUE;	
	};
};

func void DIA_Greg_GrayBeardCompetition_info()
{
	AI_Output(other,self, "DIA_Greg_GrayBeardCompetition_15_00");	//Я тебя хочу кое о чем попросить.
	AI_Output(self,other, "DIA_Greg_GrayBeardCompetition_11_01");	//Надеюсь не раскошелиться? Я и так на мели оказался из-за этого чертового нападения Торуса, все мои сокровища остались на берегу Яркендара.
	AI_Output(other,self, "DIA_Greg_GrayBeardCompetition_15_02");	//Нет, я хочу, чтобы та был наблюдателем за нашим с Серой Бородой соревнованием.
	AI_Output(self,other, "DIA_Greg_GrayBeardCompetition_11_03");	//А, будете пить, охотится и драться? Я с вами… но за 300 золотых монет.
	AI_Output(other,self, "DIA_Greg_GrayBeardCompetition_15_04");	//Что? Это же грабеж!
	AI_Output(self,other, "DIA_Greg_GrayBeardCompetition_11_05");	//300 монет, мой друг, 300. Как будут деньги, приходи.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_04);
	AI_StopProcessInfos(self);
};

//"Вот деньги.". Активируется, если ГГ знает о соревновании, пригласил Грега и все еще должен ему 300 золотых, и эти 300 золотых у него есть
// nr = 1

instance DIA_Greg_GrayBeardCompetition_Gold(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Greg_GrayBeardCompetition_Gold_condition;	
	information = DIA_Greg_GrayBeardCompetition_Gold_info;
	description = "Вот деньги.";
};

func int DIA_Greg_GrayBeardCompetition_Gold_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_GrayBeardCompetition) && Npc_HasItems(other,ItMI_Gold) >= 300)
	{	
		return TRUE;	
	};
};

func void DIA_Greg_GrayBeardCompetition_Gold_info()
{
	AI_Output(other,self, "DIA_Greg_GrayBeardCompetition_Gold_15_00");	//Вот деньги.
	AI_Output(self,other, "DIA_Greg_GrayBeardCompetition_Gold_11_01");	//(жадно) Давай сюда!
	// Отдаем 300 золотых Грегу
	B_GiveInvItems(other,self,ItMi_Gold,300);
	AI_Output(self,other, "DIA_Greg_GrayBeardCompetition_Gold_11_02");	//Очень хорошо. Когда начинаем?
	AI_Output(other,self, "DIA_Greg_GrayBeardCompetition_Gold_15_03");	//Начало скоро. Встречаемся у Серой Бороды.
	// Меняем расписание Караха для соревнований
	B_StartOtherRoutine(self,"GB_COMPETITION");
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_05);
	if (Npc_KnowsInfo(other,DIA_Symon_GrayBeardCompetition) && Npc_KnowsInfo(other,DIA_Karah_GrayBeardCompetition)) // Если ГГ уже пригласил Саймона и Караха
	{
		B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_06);
	};
	AI_StopProcessInfos(self);
};

// Запускается, после окончания соревнования
// nr = 1

instance DIA_Greg_AfterCompetition(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Greg_AfterCompetition_condition;	
	information = DIA_Greg_AfterCompetition_info;
	description = " ";
};

func int DIA_Greg_AfterCompetition_condition()
{	
	if(GB_CompetitionState > 9)
	{	
		return TRUE;	
	};
};

func void DIA_Greg_AfterCompetition_info()
{
	AI_Output(self,other, "DIA_Greg_AfterCompetition_11_00");	//Ха! Знаешь, парень, каждое твое появление пополняет мой карман. Если будет еще одно такое дело – ты знаешь, к кому обратиться.
};

// Запускается, после того, как Гард был убит по квесту "Заговор"
// nr = 1

instance DIA_Greg_ConspiracyOver(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Greg_ConspiracyOver_condition;	
	information = DIA_Greg_ConspiracyOver_info;
	description = " ";
};

func int DIA_Greg_ConspiracyOver_condition()
{	
	if((Conspiracy_IsStarted == TRUE) && Npc_IsDead(Gard) && (MIS_DS2P_Conspiracy == Log_Running))
	{	
		return TRUE;	
	};
};

func void DIA_Greg_ConspiracyOver_info()
{
	AI_Output(self,other, "DIA_Greg_ConspiracyOver_11_00");	//(довольно) А неплохо получилось. И капитаном стал, и Гард мертв, при этом практически никаких усилий не затратил. Все сделал ты, мой дражайший друг.
	AI_Output(other,self, "DIA_Greg_ConspiracyOver_15_01");	//Что с нашим уговором?
	AI_Output(self,other, "DIA_Greg_ConspiracyOver_11_02");	//Как и обещал, я оставлю селян в покое и заставлю парней поумерить свои желания и аппетиты, также отпущу всех заложников и ни я, ни мои люди не будем трогать охотников, если они вернутся. Устраивает?
	AI_Output(other,self, "DIA_Greg_ConspiracyOver_15_03");	//Да, вполне. И помни Грег: если ты не сдержишь свое слово, то ты недолго пробудешь капитаном. Я об этом позабочусь. Обещаю.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,Log_Mission,Log_Success,TOPIC_DS2P_Conspiracy_Success);
	B_DSG_Log_OpenClose(TOPIC_DS2P_IslandUnderSiege,Log_Mission,Log_Running,TOPIC_DS2P_IslandUnderSiege_Conspiracy);
	B_GivePlayerXP(XP_MIS_DS2P_Conspiracy);
	AI_StopProcessInfos(self);
};
	
// Запускается, после того, как Грег побил Скипа
// nr = 1

instance DIA_Greg_SkipIsDown(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Greg_SkipIsDown_condition;	
	information = DIA_Greg_SkipIsDown_info;
	description = " ";
};

func int DIA_Greg_SkipIsDown_condition()
{	
	if(Skip_GregFight == TRUE)
	{	
		return TRUE;	
	};
};	

func void DIA_Greg_SkipIsDown_info()
{
	AI_Output(self,other, "DIA_Greg_SkipIsDown_11_00");	//Вот теперь, моя жажда мести удовлетворена.
	AI_StopProcessInfos(self);
};
	
	