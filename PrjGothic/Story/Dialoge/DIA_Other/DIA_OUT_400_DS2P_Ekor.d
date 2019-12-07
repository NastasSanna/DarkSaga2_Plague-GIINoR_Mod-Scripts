instance DIA_Ekor_EXIT(C_Info)
{
	npc = OUT_400_DS2P_Ekor;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Ekor_EXIT_condition;	
	information = DIA_Ekor_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Ekor_EXIT_condition(){	return TRUE;};
func void DIA_Ekor_EXIT_info(){	AI_StopProcessInfos(self);};

//----
//----
var int firstDia_Ekor_once;
instance DIA_Ekor_Start(C_Info)	//Начальный диалог
{
	npc = OUT_400_DS2P_Ekor;
	nr = 1;
	permanent = TRUE;
	condition = DIA_Ekor_Start_condition;	
	information = DIA_Ekor_Start_info;
	important = TRUE;
};
func int DIA_Ekor_Start_condition(){
	
	if(Npc_IsInState(self,ZS_Talk) && !firstDia_Ekor_once)
	{	return TRUE;};
};
func void DIA_Ekor_Start_info()
{
	AI_Output(self,other,"DIA_Ekor_Start_03_00");	//У меня нет времени, чтобы тратить его на разных проходимцев. По тебе сразу видно, что ищешь лишь одну выгоду.
	AI_Output(self,other,"DIA_Ekor_Start_03_01");	//Иди отсюда.
	If(C_Npc_DS_HasItems(other,ITWr_DS2P_Letter_fCimm_tEkor,1))
	{
		AI_Output(other,self,"DIA_Ekor_Start_15_00");	//Позже, сначала прочитай это письмо.
		B_DS_GiveRemoveItems(other,self,ITWr_DS2P_Letter_fCimm_tEkor,1);
		B_UseFakeScrollTime(4.0);
		firstDia_Ekor_once = TRUE;
	}
	else
	{
		AI_StopProcessInfos(self);
	};
};
//--------------------------------------------------------
//Продолжаем стартовый диалог ,если показали письмо от Цимма.
//
instance DIA_Ekor_StartNext(C_Info)	//@Еще один попрошайка@
{
	npc = OUT_400_DS2P_Ekor;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Ekor_StartNext_condition;	
	information = DIA_Ekor_StartNext_info;
	important = TRUE;
};
func int DIA_Ekor_StartNext_condition(){
	
	if(firstDia_Ekor_once)
	{	return TRUE;};
};
func void DIA_Ekor_StartNext_info()
{
	AI_Output(self,other,"DIA_Ekor_StartNext_03_00");	//Еще один попрошайка. Заразились где-то чумой, а теперь разносите ее по всему свету.
		AI_Output(other,self,"DIA_Ekor_StartNext_15_00");	//(возмущенно) Старик, ты хоть немного следи за словами!
		AI_Output(other,self,"DIA_Ekor_StartNext_15_01");	//Мы ведь не по борделям шлялись. Чума началась после отплытия с острова некроманта. 
		AI_Output(other,self,"DIA_Ekor_StartNext_15_02");	//Насоздаете разной магии, а простые люди потом страдают.
	AI_Output(self,other,"DIA_Ekor_StartNext_03_01");	//Это ваши проблемы.
		AI_Output(other,self,"DIA_Ekor_StartNext_15_03");	//Нет, старик. Экор ведь? Ты мне поможешь и вылечишь моих друзей.
	AI_Output(self,other,"DIA_Ekor_StartNext_03_02");	//(совершенно спокойно) А то что?
	Info_ClearChoices(DIA_Ekor_StartNext);
	Info_AddChoice(DIA_Ekor_StartNext, "А то пираты останутся на вашем острове навсегда.", DIA_Ekor_StartNext_GoodVar);
	Info_AddChoice(DIA_Ekor_StartNext, "Пираты узнают кто виновник их задержки.", DIA_Ekor_StartNext_BadVar);
};
func void DIA_Ekor_StartNext_GoodVar()
{
		AI_Output(other,self,"DIA_Ekor_StartNext_GoodVar_15_00");	//А то пираты останутся на вашем острове навсегда.
		AI_Output(other,self,"DIA_Ekor_StartNext_GoodVar_15_01");	//Они сказали, что уберутся отсюда, только если проблема с чумой на моем судне будет решена. Других кораблей здесь по близости нет.
	AI_Output(self,other,"DIA_Ekor_StartNext_GoodVar_03_00");	//Когда чума перейдет с корабля на землю, то эта проблема решится сама собой.
		AI_Output(other,self,"DIA_Ekor_StartNext_GoodVar_15_02");	//(иронично) Ага, а также перемрут все твои сородичи.
		AI_Output(other,self,"DIA_Ekor_StartNext_GoodVar_15_03");	//Цимм хорошо о тебе отзывался, даже сказал, что ты помог бедняге Дилу. А теперь, значит, тебе все равно?
	AI_Output(self,other,"DIA_Ekor_StartNext_GoodVar_03_01");	//Не пытайтесь взывать к моей совести, молодой человек, - сие бесполезно. И о жителях деревни не волнуйтесь - это моя забота.
		AI_Output(other,self,"DIA_Ekor_StartNext_GoodVar_15_04");	//(после паузы, вздохнув) Итак, что мне сделать, чтобы ты мне помог?
	AI_Output(self,other,"DIA_Ekor_StartNext_GoodVar_03_02");	//(ворчливо) Уже лучше. А то приходят все кому не лень и требуют невесть чего.
	
		AI_Output(other,self,"DIA_Ekor_StartNext_GoodVar_15_05");	//(после паузы, вздохнув) Итак, что мне сделать, чтобы ты мне помог?
	AI_Output(self,other,"DIA_Ekor_StartNext_GoodVar_03_03");	//Что мне нужно? Ну, не так уж и мало.
	AI_Output(self,other,"DIA_Ekor_StartNext_GoodVar_03_04");	//Чтобы не перечислять, вот тебе список необходимого, а то ведь на слух ты все равно не запомнишь.
	B_GiveInvItems(self,other,ItWr_DS2P_EkorSpisok,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_EkorWorkGood);
	EkorStartDialogChoice = true;	//В списке не будет 1000 монет.
	Info_ClearChoices(DIA_Ekor_StartNext);
};
func void DIA_Ekor_StartNext_BadVar()
{
		AI_Output(other,self,"DIA_Ekor_StartNext_BadVar_15_00");	//Пираты узнают, кто виновник их задержки.
		AI_Output(other,self,"DIA_Ekor_StartNext_BadVar_15_01");	//Когда к тебе заявятся ребята пиратского капитана, то так вежливо как я они ничего просить не будут.
	AI_Output(self,other,"DIA_Ekor_StartNext_BadVar_03_00");	//(вкрадчиво) Молодой человек, вы, кажется, вздумали мне угрожать?
	AI_Output(self,other,"DIA_Ekor_StartNext_BadVar_03_01");	//Знаете, мне и так уже немного осталось, и если какая-то кучка бандитов сможет лишить меня жизни, то потеряю я немного, а в чем-то даже и выиграю.
	AI_Output(self,other,"DIA_Ekor_StartNext_BadVar_03_02");	//По крайней мере, не придется тратить время на одного молодого наглеца.
		AI_Output(other,self,"DIA_Ekor_StartNext_BadVar_15_02");	//(теряя терпение) Старик, да пойми ты наконец! Если болезнь не остановить вовремя, то она распространится и дальше!
		AI_Output(other,self,"DIA_Ekor_StartNext_BadVar_15_03");	//Это же не простая чума, от нее весь остров может погибнуть.
	AI_Output(self,other,"DIA_Ekor_StartNext_BadVar_03_03");	//(совершенно спокойно) О болезнях я знаю немного побольше вашего, так что не надо мне тут «тыкать» и вопить о всеобщей эпидемии.
		AI_Output(other,self,"DIA_Ekor_StartNext_BadVar_15_04");	//(мрачно) Боюсь, до прихода пиратов ты не доживешь. Просто скажи, что тебе нужно? Против честных сделок, надеюсь, ты не против?
	AI_Output(self,other,"DIA_Ekor_StartNext_BadVar_03_04");	//Хочешь купить мой талант за деньги? Думаешь опыт многих десятилетий можно оценить каким-то золотом?
	AI_Output(self,other,"DIA_Ekor_StartNext_BadVar_03_05");	//Вот тебе список необходимого. Когда все принесешь, то продолжим наш разговор.	
	B_GiveInvItems(self,other,ItWr_DS2P_EkorSpisok,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_EkorWorkBad);
	Info_ClearChoices(DIA_Ekor_StartNext);
};

//--------->>> 
//--------------------------------------------------------
//Продолжаем задание по поиску травок.
//
var int GG_PrinesTravi_Ekoru; //Принесли всё, что надо, чтоб диалога не было.
var int GG_Tell_Ekor_Skuperdyay;	//ГГ единожды может сказать, что Экор-скупердяй. /*Авторство:Redleha*/

instance DIA_Ekor_FindPlants(C_Info)	//Вот, все как ты и просил.
{
	npc = OUT_400_DS2P_Ekor;
	nr = 1;
	permanent = TRUE;
	condition = DIA_Ekor_FindPlants_condition;	
	information = DIA_Ekor_FindPlants_info;
	description = "Вот, все как ты и просил.";
};
func int DIA_Ekor_FindPlants_condition(){
	
	if(Npc_KnowsInfo(other,DIA_Ekor_StartNext) && !GG_PrinesTravi_Ekoru)
	{	return TRUE;};
};
func void DIA_Ekor_FindPlants_info()
{
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_00");	//Вот, все как ты и просил.
	If(C_Npc_DS_HasItems_Scr(other,ItPl_Perm_Herb,1,YPos_3,true) && C_Npc_DS_HasItems_Scr(other,ItPl_Health_Herb_03,5,YPos_5,true)
	&& C_Npc_DS_HasItems_Scr(other,ItPl_Mana_Herb_01,5,YPos_7,true) && C_Npc_DS_HasItems_Scr(other,ItPl_Blueplant,3,YPos_9,true)
	&& C_Npc_DS_HasItems_Scr(other,ItFo_Wine,5,YPos_11,true) && C_Npc_DS_HasItems_Scr(other,ItFo_Sausage,2,YPos_13,true)
	&& C_Npc_DS_HasItems_Scr(other,ItFo_Cheese,1,YPos_15,true))
	{
		if( (!EkorStartDialogChoice && C_Npc_DS_HasItems_Scr(other,ItMi_Gold,1000,YPos_17,true)) || EkorStartDialogChoice)
		{
			AI_Output(self,other,"DIA_Ekor_FindPlants_03_00");	//Погоди-ка, а где... А, вот оно. Итак, с первой частью задания ты справился, чем заслужил немного моего доверия.
			GG_PrinesTravi_Ekoru = TRUE;
			B_DS_GiveRemoveItems_Red(other,self,ItPl_Perm_Herb ,1 , 34);
			B_DS_GiveRemoveItems_Red(other,self,ItPl_Health_Herb_03 ,5 , 37);
			B_DS_GiveRemoveItems_Red(other,self,ItPl_Mana_Herb_01 ,5 , 40);
			B_DS_GiveRemoveItems_Red(other,self,ItPl_Blueplant ,3 , 43);
			B_DS_GiveRemoveItems_Red(other,self,ItFo_Wine ,5 , 46);
			B_DS_GiveRemoveItems_Red(other,self,ItFo_Sausage ,2 , 49);
			B_DS_GiveRemoveItems_Red(other,self,ItFo_Cheese ,1 , 52);
			if(!EkorStartDialogChoice)
			{
				B_DS_GiveRemoveItems_Red(other,self,ItMi_Gold ,1000 , 55);
			};
		}
		else if(!EkorStartDialogChoice && !C_Npc_DS_HasItems_Scr(other,ItMi_Gold,1000,YPos_17,true))
		{
			AI_Output(self,other,"DIA_Ekor_FindPlants_03_01");	//Кажется, вы что-то забыли, молодой человек. 
			if(!GG_Tell_Ekor_Skuperdyay)
			{
				AI_Output(other,self,"DIA_Ekor_FindPlants_15_01");	//(про себя) Вот ведь скупердяй.
				AI_Output(self,other,"DIA_Ekor_FindPlants_03_02");	//Что-что? Я не расслышал.
				AI_Output(other,self,"DIA_Ekor_FindPlants_15_02");	//Всё хорошо, я кажется по дороге обронил кое-что ценное из... растений.
				GG_Tell_Ekor_Skuperdyay = TRUE;
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_03");	//Нет, не все, иди ищи остальное.
	};
	
};
//------------------------------------------------
//Далее диалоги, когда Экор стал разговорчивый.
//------------------------------------------------

instance DIA_Ekor_SausageAndCheese(C_Info)	//А колбаса и сыр тоже являются частью лекарства?	nr=9
{
	npc = OUT_400_DS2P_Ekor;
	nr = 9;
	permanent = False;
	condition = DIA_Ekor_SausageAndCheese_condition;	
	information = DIA_Ekor_SausageAndCheese_info;
	description = "А колбаса и сыр тоже являются частью лекарства?";
};
func int DIA_Ekor_SausageAndCheese_condition(){
	
	if(GG_PrinesTravi_Ekoru)	{	return TRUE;};
};
func void DIA_Ekor_SausageAndCheese_info()
{
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_00");	//А колбаса и сыр тоже являются частью лекарства?
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_00");	//Не совсем, мне просто захотелось чего-нибудь поплотнее, чем обычно.
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_01");	//А насчет лекарства, так мы еще толком не приступили к его созданию, это была проверка для тебя.
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_01");	//(угрюмо) Понятно, что еще тебе на завтрак принести, чтобы ты начал работать?
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_02");	//Не надо грубить, молодой человек, я ведь только начал к вам хорошо относиться.
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_03");	//Ваше дело не пропадет зря, к тому же, я уже начал проводить кое-какие исследования.
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_02");	//Снова лечение на расстоянии? Да-а... Что мне собирать дальше?
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_04");	//Цимм в своем письме довольно подробно расписал все симптомы и добавил свои собственные предположения касательно природы этой болезни.
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_05");	//Обычные лечебные средства тут явно не помогут, поскольку причины заболевания лежат в области магии, поразившей твоих друзей.
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_06");	//Следовательно, и лекарство должно содержать в себе соответствующие компоненты, способные нейтрализовать данное негативное воздействие.
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_03");	//И конечно же, это что-то очень редкое и находится в опасном месте.
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_07");	//В точку! Мне нужна кровь дракона.
	
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_04");	//(вздыхая) Опять? Мало мне было тех драконов.
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_05");	//А где мне ее искать?
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_08");	//Как где? У дракона. Нужно пойти к нему и попросить немного крови, тут дело не в количестве.
	
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_06");	//(про себя) Знал бы заранее, то запасся.
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_07");	//А ваши драконы такие миролюбивые, что добровольно жертвуют свою кровь людям? У нас в Хоринисе они были немного другими.
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_09");	//Тут особый случай. На нашем острове и правда обитает дракон, но он никогда не нападал на людей.
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_10");	//По правде говоря, я даже ни разу не видел, чтобы он летал. Но несколько раз, забредая в те места, я видел издалека, как он лежит на пороге своего логова на Драконьем пике.
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_08");	//То есть мне не придется его убивать?
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_11");	//Ты так это сказал, словно действительно способен на такое.
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_12");	//Я считаю, что у тебя есть хороший шанс закончить дело с драконом миром, правда я не знаю, как ты сможешь его разговорить...
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_13");	//Ведь иначе, мне бы просто не позволила совесть послать тебя на верную смерть.
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_14");	//Правда, будь осторожен. Если дракон проявит признаки агрессии, то лучше беги, я поищу другой выход.
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_09");	//Допустим, я тебе верю. Что еще нужно кроме крови?
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_15");	//Пока не знаю, я ведь еще работаю над рецептом, но думаю, что нам понадобиться еще и черная жемчужина. Она применяется для усиления зелья.
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_10");	//Хорошо, мне все понятно.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_EkorSendToDragon);
	
};
//
//Ты не знаешь Гуруна? //если был взят квест статуэтки Гуруна
//
instance DIA_Ekor_AboutGurun(C_Info)	//Ты не знаешь Гуруна?	nr=8
{
	npc = OUT_400_DS2P_Ekor;
	nr = 8;
	permanent = False;
	condition = DIA_Ekor_AboutGurun_condition;	
	information = DIA_Ekor_AboutGurun_info;
	description = "Ты не знаешь Гуруна?";
};
func int DIA_Ekor_AboutGurun_condition(){
	
	if(GG_PrinesTravi_Ekoru && 	Hero_Knows_Gurun)	{	return TRUE;};
};
func void DIA_Ekor_AboutGurun_info()
{
	AI_Output(other,self,"DIA_Ekor_AboutGurun_15_00");	//Ты не знаешь Гуруна?
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_00");	//Тот кому поклоняются гоблины? Знаю, знаю этого маленького вождя, он вполне заслуживает уважение соплеменников.
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_01");	//Шесть поколений назад на земле гоблинов поселилась стая варгов. И пришел бы конец этим созданиям, если бы не Гурун.
	AI_Output(other,self,"DIA_Ekor_AboutGurun_15_01");	//А он мог делать что-то большее, нежели бегать с дубинкой и прятать в сундуке ворованные вещи?
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_02");	//Я и сам был удивлен. Но Гурун не был обычным гоблином, он дитя природы и ближе к ней, чем когда-либо будет человек.
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_03");	//От рождения он обладал слабым магическим даром, который иногда встречается у его племени. Общаясь со мной, он смог его развить и усилить.
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_04");	//Я бы даже назвал его не шаманом, так как это слово подразумевает не полностью осознанное, основанное на интуиции применение свободных магических потоков, а магом.
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_05");	//То есть тем, чья сила основана на знании.
	AI_Output(other,self,"DIA_Ekor_AboutGurun_15_02");	//И что же произошло?
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_06");	//Я помог ему и спас его племя.
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_07");	//Гурун продолжил время от времени наведываться ко мне, иногда принося ценные растения, которые я сам не смог бы найти, и при этом кое-чему у меня научился.
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_08");	//Благодаря этому он и прославился как самый великий гоблин. Его племя до сих помнит о нем и чтит его память.
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_09");	//А меня они считают кем-то вроде лесного духа и даже дали прозвище. На наш язык оно переводится как Неприкасаемый.
	AI_Output(other,self,"DIA_Ekor_AboutGurun_15_03");	//Странное прозвище для того, кто оказал такую услугу.
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_10");	//Молодой человек, не обманывайтесь на мой счет. Это прозвище было получено мной еще до того, как я им помог.
	
};

//
//У тебя есть какие-нибудь зелья на продажу? + ТОРГОВЛЯ
//
instance DIA_Ekor_AboutTrade(C_Info)	//У тебя есть какие-нибудь зелья на продажу?	nr=900
{
	npc = OUT_400_DS2P_Ekor;
	nr = 900;
	permanent = False;
	condition = DIA_Ekor_AboutTrade_condition;	
	information = DIA_Ekor_AboutTrade_info;
	description = "У тебя есть какие-нибудь зелья на продажу?";
};
func int DIA_Ekor_AboutTrade_condition(){
	
	if(GG_PrinesTravi_Ekoru)	{	return TRUE;};
};
func void DIA_Ekor_AboutTrade_info()
{
	AI_Output(other,self,"DIA_Ekor_AboutTrade_15_00");	//У тебя есть какие-нибудь зелья на продажу?
		AI_Output(self,other,"DIA_Ekor_AboutTrade_03_00");	//А чем я по-твоему занимаюсь все это время?	
};
//Торговля
var int DIA_Ekor_Trade_once;
instance DIA_Ekor_Trade(C_Info)	//У тебя есть какие-нибудь зелья на продажу?	nr=900
{
	npc = OUT_400_DS2P_Ekor;
	nr = 900;
	permanent = TRUE;
	condition = DIA_Ekor_Trade_condition;	
	information = DIA_Ekor_Trade_info;
	description = "Покажи, что у тебя есть на продажу.";
};
func int DIA_Ekor_Trade_condition(){
	
	if(Npc_KnowsInfo(other,DIA_Ekor_AboutTrade))	{	return TRUE;};
};
func void DIA_Ekor_Trade_info()
{
	AI_Output(other,self,"DIA_Ekor_Trade_15_00");	//Покажи, что у тебя есть на продажу.
		AI_Output(self,other,"DIA_Ekor_Trade_03_00");	//Выбирай.
	B_GiveTradeInv(self);
	if(!DIA_Ekor_Trade_once){
		B_DSG_Log_OpenClose(TOPIC_TraderOther,LOG_NOTE,-1,"Отшельник Экор продает зелья и травы.");
		DIA_Ekor_Trade_once = TRUE;
	};
};
//
//Можно чему-нибудь у тебя поучиться? + ОБУЧЕНИЕ в отдельном файле
//
instance DIA_Ekor_TeachPre(C_Info)	//Можно чему-нибудь у тебя поучиться?	nr=800
{
	npc = OUT_400_DS2P_Ekor;
	nr = 800;
	permanent = False;
	condition = DIA_Ekor_TeachPre_condition;	
	information = DIA_Ekor_TeachPre_info;
	description = "Можно чему-нибудь у тебя поучиться?";
};
func int DIA_Ekor_TeachPre_condition(){
	
	if(GG_PrinesTravi_Ekoru)	{	return TRUE;};
};
func void DIA_Ekor_TeachPre_info()
{
	AI_Output(other,self,"DIA_Ekor_TeachPre_15_00");	//Можно чему-нибудь у тебя поучиться?
		AI_Output(self,other,"DIA_Ekor_TeachPre_03_00");	//Можно, но не бесплатно.	
};

//NS - 25/04/2016 ===========
// Квест "Каменные таблички древних"
//===========================

//при наличии всех 4 каменных табличек
instance DIA_Ekor_GiveAncientPlates(C_Info)
{
	npc = OUT_400_DS2P_Ekor;					nr = 20;
	condition = DIA_Ekor_GiveAncientPlates_condition;	
	information = DIA_Ekor_GiveAncientPlates_info;
	description = "У меня для тебя посылка.";
};
func int DIA_Ekor_GiveAncientPlates_condition(){
	
	if((MIS_DS2P_AncientStonePlates == LOG_Running) 
		&& (Npc_HasItems(other, ITWR_ANCIENTSTONEPLATE) >= 4))
	{	return TRUE;};
};
func void DIA_Ekor_GiveAncientPlates_info()
{
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_15_01");	//У меня для тебя посылка.
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_03_02");	//Посылка? От Цимма?
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_15_03");	//Нет, от шамана племени гоблинов.
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_03_04");	//Вот как? Не думал, что ты с ним знаком. Больше скажу - считал, что такого проходимца они на полет стрелы к болоту своему не подпустят.
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_15_05");	//Так тебе не нужна посылка? Значит верну обратно. Прощай!
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_03_06");	//Эй, стой! Знаю, что язык мой - враг мой. Что там за посылка?
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_15_07");	//Несколько каменных табличек. Вот они.
	//ГГ передает каменные таблички.
	B_GiveInvItems(other,self,ITWR_ANCIENTSTONEPLATE,4);
	MIS_DS2P_AncientStonePlates_Delivered = TRUE;
	//Запись в дневнике "Каменные таблички древних"
	B_DSG_Log_OpenClose(TOPIC_DS2P_AncientStonePlates,LOG_MISSION,LOG_Running,TOPIC_DS2P_AncientStonePlates_Delivered);
	B_GivePlayerXP(XP_MIS_AncientStonePlates_Plates);
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_03_08");	//Ага! Давно уже жду их. 
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_03_09");	//Что, ты еще здесь? Ах да, такие как ты ведь не работают за спасибо. Вот, возьми это зелье силы.
	//Передает одно перманентное зелье, повышающее силу.
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	Info_ClearChoices(DIA_Ekor_GiveAncientPlates);
	Info_AddChoice(DIA_Ekor_GiveAncientPlates,"Тогда я пошел.",DIA_Ekor_GiveAncientPlates_Ciao);
	Info_AddChoice(DIA_Ekor_GiveAncientPlates,"Можно вопрос?",DIA_Ekor_GiveAncientPlates_Question);
};
func void DIA_Ekor_GiveAncientPlates_Ciao()
{
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_Ciao_15_01");	//Тогда я пошел.
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_Ciao_03_02");	//Да, да. Вали давай, у меня тут еще столько разных опытов не завершено...
	Info_ClearChoices(DIA_Ekor_GiveAncientPlates);
	//Запись в дневнике "Каменные таблички древних"
	B_DSG_Log_OpenClose(TOPIC_DS2P_AncientStonePlates,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_AncientStonePlates_Success1);
};
func void DIA_Ekor_GiveAncientPlates_Question()
{
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_Question_15_01");	//Можно вопрос?
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_Question_03_02");	//(обращаясь к небу) Иннос, ты избавишь меня от этого назойливого типа? 
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_Question_03_02");	//Ладно, спрашивай, только быстро - у меня эксперимент.
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_Question_15_01");	//Скажи, ты не знаешь, откуда эти каменные таблички взялись на этом острове?
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_Question_03_02");	//Это я и пытаюсь выяснить. И для этого нужно расшифровать эти самые таблички, а разные типы мешают мне это сделать.
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_Question_15_01");	//Просто мне кое-что известно о цивилизации, после которой остались такие таблички. 
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_Question_15_01");	//Зодчие - так их зовут маги Воды - жили на Хоринисе много сотен лет назад. После них остались лишь руины и такие вот скрижали.
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_Question_15_01");	//Но я не видел на этом острове ничего, похожего на их постройки. Потому мне и интересно, откуда тут взялись таблички.
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_Question_03_02");	//(бормочет) Оказывается, иногда не помешает поговорить с разными проходимцами. Надо запомнить. 
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_Question_03_02");	//А еще что-нибудь можешь рассказать об этих Зодчих? Может быть, ты и язык их знаешь?
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_Question_15_01");	//Да, я кое-что знаю об их языке и истории, но учитель из меня неважнецкий. 
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_Question_15_01");	//Гораздо лучше тебе может рассказать о них маг Воды, который приплыл со мной. Но сейчас он не может оставить корабль без присмотра.
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_Question_03_02");	//Хм, тогда спроси, согласится ли он поделиться своими записями об их языке? С остальным я попытаюсь разобраться, расшифровав найденные таблички.
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_Question_03_02");	//Ведь всегда более полезно самому достичь знания, пость и с небольшим дружеским толчком, чем только пользоваться плодами чужого труда 
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_Question_03_02");	//И, предупреждая твой следующий вопрос: награда будет хорошая.
	Info_ClearChoices(DIA_Ekor_GiveAncientPlates);
	//Запись в дневнике "Каменные таблички древних"
	B_DSG_Log_OpenClose(TOPIC_DS2P_AncientStonePlates,LOG_MISSION,LOG_Running,TOPIC_DS2P_AncientStonePlates_AskVatras);
};
// --------------------------------------------
instance DIA_Ekor_GiveVatrasNotes(C_Info)
{
	npc = OUT_400_DS2P_Ekor;					nr = 21;
	condition = DIA_Ekor_GiveVatrasNotes_condition;	
	information = DIA_Ekor_GiveVatrasNotes_info;
	description = "Я принес тебе записи Ватраса.";
};
func int DIA_Ekor_GiveVatrasNotes_condition(){
	
	if((MIS_DS2P_AncientStonePlates == LOG_Running) 
		&& (Npc_HasItems(other, ItWr_DS2P_VatrasNotes)))
	{	return TRUE;};
};
func void DIA_Ekor_GiveVatrasNotes_info()
{
		AI_Output(other,self,"DIA_Ekor_GiveVatrasNotes_15_01");	//Я принес тебе записи Ватраса.
		AI_Output(other,self,"DIA_Ekor_GiveVatrasNotes_15_02");	//Здесь расшифровки табличек Зодчих и другие его заметки об их культуре и истории.
	//дает записи Ватраса
	B_GiveInvItems(other,self,ItWr_DS2P_VatrasNotes,1);
	AI_UseItem(self,Fakescroll_Addon);
	AI_Output(self,other,"DIA_Ekor_GiveVatrasNotes_03_03");	//(задумчиво) Это действительно бесценный дар. Столько всего...
	AI_Output(self,other,"DIA_Ekor_GiveVatrasNotes_03_04");	//С этими записями на руках я смогу серьезно продвинуться в изучении каменных скрижалей.
	AI_Output(self,other,"DIA_Ekor_GiveVatrasNotes_03_05");	//И все так четко систематезировано... Язык, касты, обряды, быт, архитектура, история...
		AI_Output(other,self,"DIA_Ekor_GiveVatrasNotes_15_06");	//Кхм...
	//Запись в дневнике "Каменные таблички древних"
	B_DSG_Log_OpenClose(TOPIC_DS2P_AncientStonePlates,LOG_MISSION,LOG_Running,TOPIC_DS2P_AncientStonePlates_NotesGiven);
	B_GivePlayerXP(XP_MIS_AncientStonePlates_Notes);
	AI_Output(self,other,"DIA_Ekor_GiveVatrasNotes_03_07");	//Что? Ах да, твоя награда. 
	AI_Output(self,other,"DIA_Ekor_GiveVatrasNotes_03_08");	//Я могу предложить тебе несколько хороших зелий или знания. Что выберешь?
	Info_ClearChoices(DIA_Ekor_GiveVatrasNotes);
	Info_AddChoice(DIA_Ekor_GiveVatrasNotes,"Знания.",DIA_Ekor_GiveVatrasNotes_Knowledge);
	Info_AddChoice(DIA_Ekor_GiveVatrasNotes,"Зелья.",DIA_Ekor_GiveVatrasNotes_Potions);
};
func void DIA_Ekor_GiveVatrasNotes_Potions()
{
		AI_Output(other,self,"DIA_Ekor_GiveVatrasNotes_Potions_15_01");	//Зелья.
	AI_Output(self,other,"DIA_Ekor_GiveVatrasNotes_Potions_03_02");	//Вот, возьми. А теперь оставь меня.
	//дает одно зелье повышения маны, одно жизни и пару простых зелий, восстанавливающих ману.
	B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	B_GiveInvItems(self,other,ItPo_Mana_03,2);
	//Запись в дневнике "Каменные таблички древних"
	B_DSG_Log_OpenClose(TOPIC_DS2P_AncientStonePlates,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_AncientStonePlates_Success2);
	AI_StopProcessInfos(self);
};
func void DIA_Ekor_GiveVatrasNotes_Knowledge()
{
		AI_Output(other,self,"DIA_Ekor_GiveVatrasNotes_Knowledge_15_01");	//Знания.
	AI_Output(self,other,"DIA_Ekor_GiveVatrasNotes_Knowledge_03_02");	//А ты не так глуп, как кажешься. 
	AI_Output(self,other,"DIA_Ekor_GiveVatrasNotes_Knowledge_03_03");	//Хорошо, я покажу тебе, как лучше управлять магическими потоками и обучу первым кругам магии.
	//постоянное повышение маны +5 и обучение
	B_RaiseAttribute(other, ATR_MANA_MAX, 5);
	Teach_Ekor = TRUE;
	//Запись в дневнике "Каменные таблички древних"
	B_DSG_Log_OpenClose(TOPIC_DS2P_AncientStonePlates,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_AncientStonePlates_Success3);
	//Запись в дневнике в разделе "Учителя вне деревни"
	B_DSG_Log_OpenClose(TOPIC_TeacherOther,LOG_NOTE,-1,"Отшельник Экор посвятит меня в первые круги магии.");
	Info_ClearChoices(DIA_Ekor_GiveVatrasNotes);
};


//NS - 05/05/2016 ===========
// Обучение кругам магии
//===========================
instance DIA_Ekor_Teach_Mage(C_Info)
{
	npc = OUT_400_DS2P_Ekor;					nr = 50;
	permanent = TRUE;
	condition = DIA_Ekor_Teach_Mage_condition;	
	information = DIA_Ekor_Teach_Mage_info;
	description = "Научи меня.";
};
func int DIA_Ekor_Teach_Mage_condition(){
	
	if(TEACH_Ekor)
	{	return TRUE;};
};
func void DIA_Ekor_Teach_Mage_info()
{
		AI_Output(other,self,"DIA_Ekor_Teach_Mage_15_01");	//Научи меня.
	AI_Output(self,other,"DIA_Ekor_Teach_Mage_03_02");	//Посмотрим, на что ты способен.
	Info_ClearChoices(DIA_Ekor_Teach_Mage);
	Info_AddChoice(DIA_Ekor_Teach_Mage,Dialog_Back,DIA_Ekor_Teach_Mage_Back);
	if (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0) {
		Info_AddChoice(DIA_Ekor_Teach_Mage,
			b_Ds_buildString_TeachPayment_Talent(hero,"1 круг магии.",NPC_TALENT_MAGE,1,0),
			DIA_Ekor_Teach_Mage_1); 
	}
	else if (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1) {
		Info_AddChoice(DIA_Ekor_Teach_Mage,
			b_Ds_buildString_TeachPayment_Talent(hero,"2 круг магии.",NPC_TALENT_MAGE,2,0),
			DIA_Ekor_Teach_Mage_2); 
	} 
	else if (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2) {
		Info_AddChoice(DIA_Ekor_Teach_Mage,
			b_Ds_buildString_TeachPayment_Talent(hero,"3 круг магии.",NPC_TALENT_MAGE,3,0),
			DIA_Ekor_Teach_Mage_3); 
	};
};
func void DIA_Ekor_Teach_Mage_Back()
{
		AI_Output(other,self,"DIA_Ekor_Teach_Mage_Back_15_01");	//В другой раз.
	Info_ClearChoices(DIA_Ekor_Teach_Mage);
};
func void DIA_Ekor_Teach_Mage_1()
{
	if (B_TeachMagicCircle(self,other,1)) {
		AI_Output(self,other,"DIA_Ekor_Teach_Mage_1_03_01");	//Думаю, твоих скромных способностей хватит, чтобы изучить заклинания Первого круга.
	};
	Info_ClearChoices(DIA_Ekor_Teach_Mage);
};
func void DIA_Ekor_Teach_Mage_2()
{
	if (B_TeachMagicCircle(self,other,2)) {
		AI_Output(self,other,"DIA_Ekor_Teach_Mage_2_03_01");	//А ты и правда не так уж туп. Ты можешь использовать заклинания Второго круга.
	};
	Info_ClearChoices(DIA_Ekor_Teach_Mage);
};
func void DIA_Ekor_Teach_Mage_3()
{
	if (B_TeachMagicCircle(self,other,3)) {
		AI_Output(self,other,"DIA_Ekor_Teach_Mage_3_03_01");	//Поздравляю - ты освоил заклинания Третьего круга. Это уже можно считать настоящей магией.
		AI_Output(self,other,"DIA_Ekor_Teach_Mage_3_03_02");	//На этом все, хватит. Я и так потратил на тебя уйму времени, а его у меня мало.
		TEACH_Ekor = FALSE;
	};
	Info_ClearChoices(DIA_Ekor_Teach_Mage);
};
