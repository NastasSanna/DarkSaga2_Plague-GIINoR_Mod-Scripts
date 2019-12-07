instance DIA_RaDaPo_EXIT(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;
	nr = 999;
	permanent = TRUE;
	condition = DIA_RaDaPo_EXIT_condition;	
	information = DIA_RaDaPo_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_RaDaPo_EXIT_condition(){	return TRUE;};
func void DIA_RaDaPo_EXIT_info(){	AI_StopProcessInfos(self);};

//NS - 06/03/2016 ===========
// Знакомство 
//===========================
instance DIA_RaDaPo_Hello(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 1;
	condition = DIA_RaDaPo_Hello_condition;	
	information = DIA_RaDaPo_Hello_info;
	description = "Ты кто?";
};
func int DIA_RaDaPo_Hello_condition(){	return TRUE;};
func void DIA_RaDaPo_Hello_info()
{	
	AI_Output(other,self,"DIA_RaDaPo_Hello_15_01");	//Ты кто?
		AI_Output(self,other,"DIA_RaDaPo_Hello_18_02");	//Меня зовут Ра-Да-По, я шаман племени, человек.
};

//NS - 06/03/2016 ===========
// Общие диалоги
//===========================
// про вождя ------------------------------
//если хоть раз говорили с вождем
instance DIA_RaDaPo_AboutChief(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 2;
	condition = DIA_RaDaPo_AboutChief_condition;	
	information = DIA_RaDaPo_AboutChief_info;
	description = "Что-то вождь у вас недружелюбный.";
};
func int DIA_RaDaPo_AboutChief_condition()
{
	if (Npc_KnowsInfo(other,DIA_RaDaPo_Hello)
		 && Gobbo_DS2P_TsaHaNauh.aivar[AIV_TalkedToPlayer])	{
		return TRUE;
	};
};
func void DIA_RaDaPo_AboutChief_info()
{	
	AI_Output(other,self,"DIA_RaDaPo_AboutChief_15_01");	//Что-то вождь у вас недружелюбный. Не особо он людей-то любит.
		AI_Output(self,other,"DIA_RaDaPo_AboutChief_18_02");	//Так оно и есть. И у него есть причина для этого, скажу я тебе.
	AI_Output(other,self,"DIA_RaDaPo_AboutChief_15_03");	//Расскажешь?
		AI_Output(self,other,"DIA_RaDaPo_AboutChief_18_04");	//Почему бы и нет, это не тайна. Много зим назад у Ца-Ха-Наух родился сын, необычайно сильный и крепкий гоблин. Мать, к сожалению, умерла при родах, и сына вождь растил один.
	AI_Output(other,self,"DIA_RaDaPo_AboutChief_15_05");	//И он в нем души не чаял, так?
		AI_Output(self,other,"DIA_RaDaPo_AboutChief_18_06");	//Да. Ца-Ха-Наух любил сына, которого назвал в честь великого Гуруна. Гурун вырос могучим воином, он мог выйти победителем из схватки даже с болотным червем, сражаясь один на один.
		AI_Output(self,other,"DIA_RaDaPo_AboutChief_18_07");	//Увы, сына вождя подвела самонадеянность. Он стал считать, что ему нет равных в схватке и, когда пришла весть, что наш отряд охотников был перебит недалеко от болот людьми, без промедлений кинулся за убийцами. В одиночку.
	AI_Output(other,self,"DIA_RaDaPo_AboutChief_15_08");	//Я догадываюсь, что было дальше. Люди убили его, да?
		AI_Output(self,other,"DIA_RaDaPo_AboutChief_18_09");	//Это так. Они тоже были охотниками, вооруженными луками. Они просто расстреляли молодого Гуруна, тот даже ничего сделать не успел. Оставив бездыханное тело, люди ушли.
		AI_Output(self,other,"DIA_RaDaPo_AboutChief_18_10");	//С тех пор наш вождь люто ненавидит людей. Я даже удивлен, что он говорил с тобой, а не обнажил оружие. Должно быть, время пригасило пламя ненависти.
	//Запись в дневнике "Доверие вождя"
	if (MIS_DS2P_GobboLeaderTrust == LOG_Running)	{
		B_DSG_Log_OpenClose(TOPIC_DS2P_GobboLeaderTrust,LOG_MISSION,LOG_Running,TOPIC_DS2P_GobboLeaderTrust_RageReason);
	};
};
// человеческий язык ------------------------------
instance DIA_RaDaPo_SpeakWell(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 3;
	condition = DIA_RaDaPo_SpeakWell_condition;	
	information = DIA_RaDaPo_SpeakWell_info;
	description = "Для гоблина ты разговариваешь на миртанском просто великолепно.";
};
func int DIA_RaDaPo_SpeakWell_condition()
{
	if (Npc_KnowsInfo(other,DIA_RaDaPo_Hello))	{
		return TRUE;
	};
};
func void DIA_RaDaPo_SpeakWell_info()
{	
	AI_Output(other,self,"DIA_RaDaPo_SpeakWell_15_01");	//Для гоблина ты разговариваешь на миртанском просто великолепно.
		AI_Output(self,other,"DIA_RaDaPo_SpeakWell_18_02");	//Спасибо. Меня учил мой учитель Ти-Ру-Гак, которого учил его собственный учитель Дак-Го, а того...
	AI_Output(other,self,"DIA_RaDaPo_SpeakWell_15_03");	//Я понял.
		AI_Output(self,other,"DIA_RaDaPo_SpeakWell_18_04");	//(недовольно) Понял он... Знаешь, что перебивать нехорошо?
	AI_Output(other,self,"DIA_RaDaPo_SpeakWell_15_05");	//Знаю, но ты сейчас начнешь перечислять всех других учителей до двадцатого колена.
		AI_Output(self,other,"DIA_RaDaPo_SpeakWell_18_06");	//Нет, только до шестого. Именно тогда Гурун нашел себе наставника-человека и полностью изменил жизнь нашего племени.
		AI_Output(self,other,"DIA_RaDaPo_SpeakWell_18_07");	//С тех пор мы ведем мирную жизнь. Но люди из деревни продолжают нападать на нас, словно на диких животных.
};
// про гоблинов ------------------------------
instance DIA_RaDaPo_AboutGobbos(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 4;
	condition = DIA_RaDaPo_AboutGobbos_condition;	
	information = DIA_RaDaPo_AboutGobbos_info;
	description = "Расскажи мне о гоблинах.";
};
func int DIA_RaDaPo_AboutGobbos_condition()
{
	if (Npc_KnowsInfo(other,DIA_RaDaPo_Hello))	{
		return TRUE;
	};
};
func void DIA_RaDaPo_AboutGobbos_info()
{	
	AI_Output(other,self,"DIA_RaDaPo_AboutGobbos_15_01");	//Расскажи мне о гоблинах.
		AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_18_02");	//Что именно ты хочешь услышать?
	Info_ClearChoices(DIA_RaDaPo_AboutGobbos);
	Info_AddChoice(DIA_RaDaPo_AboutGobbos,Dialog_Back,DIA_RaDaPo_AboutGobbos_Back);
	if (Hero_Knows_OdDiOn)	{
		Info_AddChoice(DIA_RaDaPo_AboutGobbos,"Кто такой Од-Ди-Он?",DIA_RaDaPo_AboutGobbos_OdDiOn);
	};
	if (Hero_Knows_Gurun)	{
		Info_AddChoice(DIA_RaDaPo_AboutGobbos,"Расскажи мне о Гуруне.",DIA_RaDaPo_AboutGobbos_Gurun);
	};
	Info_AddChoice(DIA_RaDaPo_AboutGobbos,"Расскажи мне о племени.",DIA_RaDaPo_AboutGobbos_Tribe);
};
func void DIA_RaDaPo_AboutGobbos_Back()
{	
	Info_ClearChoices(DIA_RaDaPo_AboutGobbos);
};
func void DIA_RaDaPo_AboutGobbos_Tribe()
{	
		AI_Output(other,self,"DIA_RaDaPo_AboutGobbos_Tribe_15_01");	//Расскажи мне о племени.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_02");	//Наше племя живет здесь уже несколько сотен зим. Когда наши предки приплыли на этот остров, здесь еще не было людей.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_03");	//Здесь было много дичи, чистой воды и свободного места. Очень быстро они расселились по всему острову, и образовалось несколько племен: горное, два прибрежных, болотное и лесное.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_04");	//Жили они в мире друг с другом и никогда не воевали, даже помогали друг другу. Жизнь их была довольно тихой и безмятежной.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_05");	//Но затем духи предков отвернулись от них. Узнав про залежи магической руды на острове, сюда приплыли люди.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_06");	//Сначала это был небольшой отряд, и наши предки старались просто избегать их.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_07");	//Но люди посчитали гоблинов угрозой и полностью уничтожили одно из прибрежных племен. Не выжил никто.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_08");	//Тогда наши предки объединились и избавились от людей.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_09");	//Спустя еще две зимы люди появились вновь. Только теперь это уже был большой военный отряд. С огнем и мечом они прошли по острову, уничтожая всех на своем пути.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_10");	//Лишь несколько горных и лесных гоблинов смогли тогда спастись, укрывшись в глубоких пещерах.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_11");	//Выжило только наше племя: топкие болота оказались непредолимы для закованных в сталь воинов. Люди отступили. Но они убили почти всю дичь и забрали весь урожай плодов.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_12");	//Прошло еще четыре десятка гоблинских поколений и примерно шесть ваших, когда руда закончилась и большинство людей ушло отсюда.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_13");	//А еще через пару поколений случилось большое землетрясение, часть острова ушла под воду, и практически весь людской город разрушился. Теперь на его месте остались одни руины.
};
func void DIA_RaDaPo_AboutGobbos_Gurun()
{	
		AI_Output(other,self,"DIA_RaDaPo_AboutGobbos_Gurun_15_01");	//Расскажи мне о Гуруне.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Gurun_18_02");	//Гурун - одновременно наш вождь и шаман. Жил он шесть поколений назад.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Gurun_18_03");	//В те времена на наше болото пришла стая огромных черных волков с красными глазами, варгов. Они растерзали многих гоблинов, а наши предки ничего не могли с ними сделать.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Gurun_18_04");	//Не помогали ни лучшее наше оружие, ни ловушки, ни засады. Варгов ничего не останавливало и наше племя, и без того малочисленное, оказалось перед угрозой гибели.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Gurun_18_05");	//Тогда-то Гурун и решился на отчаянный шаг: забыв все то зло, что причинили нам люди, обратиться к ним за помощью.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Gurun_18_06");	//Ночью, когда варги разорвали семерых наших воинов, Гурун отправился в путь, ведомый дузами предков.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Gurun_18_07");	//Тогда началась страшная гроза и в кромешной тьме духи вывели Гуруна не к селению людей, а к старым развалинам, в которых жил маг-отшельник.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Gurun_18_08");	//Сначала тот встретил Гуруна не слишком дружелюбно, но затем им удалось понять друг друга и маг согласился взять Гуруна в ученики.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Gurun_18_09");	//Гурун не даром считается нашим величайшим магом. Спустя всего неделю он в одиночку сумел одолеть всех варгов.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Gurun_18_10");	//Отшельник еще многому научил Гуруна. Мы прозвали его Од-Ди-Он, что значит ”Неприкасаемый”.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Gurun_18_11");	//Теперь лишь я прихожу к нему, и он иногда тратит на меня свое время.
};
func void DIA_RaDaPo_AboutGobbos_OdDiOn()
{	
		AI_Output(other,self,"DIA_RaDaPo_AboutGobbos_OdDiOn_15_01");	//Кто такой Од-Ди-Он?
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_OdDiOn_18_02");	//Это человеческий маг, именно он в прошлом обучил нашего великого предка Гуруна, победившего стаю варгов.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_OdDiOn_18_03");	//Од-Ди-Он очень мудр и многое знает. Он изучает остров, природу, нашу историю. Все свое время проводит в исследованиях и не любит отвлекаться от них.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_OdDiOn_18_04");	//В редких случаях он просит нас о чем-то, и тогда все племя ему помогает, потому что мы помним, что именно он помог нам выжить.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_OdDiOn_18_05");	//Именно общение с ним помогло нашему племени переступить тот порог ненависти к людям, что много поколений жило в сердцах гоблинов.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_OdDiOn_18_06");	//Только поэтому тебе позволили пройти к нам в деревню, а не убили еще на входе.
		AI_Output(other,self,"DIA_RaDaPo_AboutGobbos_OdDiOn_15_07");	//(еле слышный хмык)
};

//NS - 31/03/2016 ===========
// Квест "Каменные таблички древних"
//===========================
instance DIA_RaDaPo_AnyJob(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 10;
	condition = DIA_RaDaPo_AnyJob_condition;	
	information = DIA_RaDaPo_AnyJob_info;
	description = "Есть для меня работа?";
};
func int DIA_RaDaPo_AnyJob_condition()
{
	if (Npc_KnowsInfo(other,DIA_RaDaPo_Hello))	{
		return TRUE;
	};
};
func void DIA_RaDaPo_AnyJob_info()
{	
	AI_Output(other,self,"DIA_RaDaPo_AnyJob_15_01");	//Есть для меня работа?
		AI_Output(self,other,"DIA_RaDaPo_AnyJob_18_02");	//Вообще-то есть. Я бы хотел попросить тебя отнести несколько каменных табличек одному человеку.
	AI_Output(other,self,"DIA_RaDaPo_AnyJob_15_03");	//Человеку?
		AI_Output(self,other,"DIA_RaDaPo_AnyJob_18_04");	//Да. Мы зовем его Од-Ди-Он.
		AI_Output(self,other,"DIA_RaDaPo_AnyJob_18_05");	//Именно он когда-то учил великого Гуруна. Иногда я и сам вижусь с ним, тогда он что-то рассказывает мне, чему-то учит. 
		AI_Output(self,other,"DIA_RaDaPo_AnyJob_18_06");	//Но по нынешним временам нам, гоблинам, опасно покидать пределы деревни. В болотах огромные змеи, в лесах хищники и много людей. Без надобности ни один гоблин не уходит далеко от поселения.
		AI_Output(self,other,"DIA_RaDaPo_AnyJob_18_07");	//А таблички передать надо, я обещал. Я уже и сам собирался идти к нему, невзирая на опасности, но тут появился ты, предлагая свою помощь.
	Hero_Knows_OdDiOn = TRUE;
};
// --------------------------------------------
instance DIA_RaDaPo_CarryStonePlates(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 11;
	condition = DIA_RaDaPo_CarryStonePlates_condition;	
	information = DIA_RaDaPo_CarryStonePlates_info;
	description = "Хорошо, я отнесу каменные таблички.";
};
func int DIA_RaDaPo_CarryStonePlates_condition()
{
	if (Npc_KnowsInfo(other,DIA_RaDaPo_AnyJob))	{
		return TRUE;
	};
};
func void DIA_RaDaPo_CarryStonePlates_info()
{	
	AI_Output(other,self,"DIA_RaDaPo_CarryStonePlates_15_01");	//Хорошо, я отнесу каменные таблички. А нормальное имя у этого человека есть?
		AI_Output(self,other,"DIA_RaDaPo_CarryStonePlates_18_02");	//Люди зовут его Экор. Он отшельник, живет на самом юго-западе острова, в древней библиотеке.
		AI_Output(self,other,"DIA_RaDaPo_CarryStonePlates_18_03");	//Но есть одна загвоздка: если он этого не хочет, то его и ищущий огонек не найдет.
	AI_Output(other,self,"DIA_RaDaPo_CarryStonePlates_15_04");	//И как прикажешь ему передать эти таблички?
		AI_Output(self,other,"DIA_RaDaPo_CarryStonePlates_18_05");	//Может, тебе повезет, и ты встретишься с ним. Мне почему-то кажется, так и будет.
	//Ра-Да-По передает 4 каменные таблички.
	//Те самые, которые мы таскали Ватрасу в Готике 2.
	B_GiveInvItems(self,other,ITWR_ANCIENTSTONEPLATE,4);
	AI_Output(other,self,"DIA_RaDaPo_CarryStonePlates_15_06");	//(про себя) Хм, знакомые таблички, я уже видел такие. 
	AI_Output(other,self,"DIA_RaDaPo_CarryStonePlates_15_07");	//(вслух) Ладно, как-нибудь разберусь.
	//Запись в дневнике "Каменные таблички древних"
	B_DSG_Log_OpenClose(TOPIC_DS2P_AncientStonePlates,LOG_MISSION,LOG_Running,TOPIC_DS2P_AncientStonePlates_Start);
};

//готово, отнесли --------------------------------------------
instance DIA_RaDaPo_StonePlatesDelivered(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 12;
	condition = DIA_RaDaPo_StonePlatesDelivered_condition;	
	information = DIA_RaDaPo_StonePlatesDelivered_info;
	description = "Я выполнил твое поручение.";
};
func int DIA_RaDaPo_StonePlatesDelivered_condition()
{
	if (MIS_DS2P_AncientStonePlates_Delivered)	{
		return TRUE;
	};
};
func void DIA_RaDaPo_StonePlatesDelivered_info()
{	
	AI_Output(other,self,"DIA_RaDaPo_StonePlatesDelivered_15_01");	//Я выполнил твое поручение.
		AI_Output(self,other,"DIA_RaDaPo_StonePlatesDelivered_18_02");	//Очень хорошо. Я тебе верю, хоть ты и человек. Возьми это золото.
	//Гоблин дает ГГ 150 золотых.
	B_GiveInvItems(self,other,ItMi_Gold,150);
	//без записи в журнал
	B_GivePlayerXP(XP_Ambient);
};


//NS - 24/06/2016 ===========
// Квест "Разгневанные предки"
//===========================
instance DIA_RaDaPo_TsaHaNauhSend(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 20;
	condition = DIA_RaDaPo_TsaHaNauhSend_condition;	
	information = DIA_RaDaPo_TsaHaNauhSend_info;
	description = "Вождь сказал, что ты хотел меня видеть.";
};
func int DIA_RaDaPo_TsaHaNauhSend_condition()
{
	if (MIS_DS2P_FuriousAncestors_Stage == MIS_DS2P_FuriousAncestors_TsaHaNauhTold)	{
		return TRUE;
	};
};
func void DIA_RaDaPo_TsaHaNauhSend_info()
{	
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_15_01");	//Вождь сказал, что ты хотел меня видеть.
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_18_02");	//Да, хотел. Скажи, ты когда-нибудь сталкивался с призраками?
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_15_03");	//Да, приходилось. 
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_15_04");	//А у вас что, проблемы с приведениями?
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_18_05");	//На нас разгневался один из духов предков. Он винит нас в том, что мы отставили путь предков, ослабли и позволили людям захватить остров.
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_18_06");	//А теперь, когда мы позволили человеку войти в наше племя, он наслал на нас проклятие.
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_18_07");	//То охотник споткнется о корягу и сломает ногу, то вертел перегорит и рухнет в огонь вместе с мясом, то ветром нагонит такой густой туман, что даже вытянутой руки не видно... Всего и не перечислишь.
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_15_08");	//И ты хочешь, чтобы я помог вам избавиться от проклятия?
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_18_09");	//Увы, но мне известен лишь один способ это сделать - развеять дух нашего предка. Мне очень не хочется этого делать, но иного пути я не ведаю.
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_15_10");	//Надеюсь, у тебя есть идеи, как это сделать, потому что я понятия не имею, как убить призрака.
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_18_11");	//Есть особое снадобье, которое позволит тебе не только увидеть дух нашего предка, но и причинить ему вред простым оружием.
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_15_12");	//Ого, полезная штука.
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_18_13");	//Полезная, только состав весьма сложный. И главный ингредиент - кость этого предка, поэтому ты сможешь увидеть только его одного.
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_15_14");	//Хочешь сказать, что у тебя нашлась нужная кость?
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_18_15");	//Конечно, мы бережно храним останки всех наших предков и знаем их по именам. 
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_18_16");	//Так ты поможешь нам?
	
	Info_ClearChoices(DIA_RaDaPo_TsaHaNauhSend);
	Info_AddChoice(DIA_RaDaPo_TsaHaNauhSend,"Нет, это слишком опасно.",DIA_RaDaPo_TsaHaNauhSend_No);
	Info_AddChoice(DIA_RaDaPo_TsaHaNauhSend,"Помогу.",DIA_RaDaPo_TsaHaNauhSend_Yes);
};
func void DIA_RaDaPo_TsaHaNauhSend_No()
{
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_15_01");	//Нет, это слишком опасно.
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_18_02");	//Очень жаль. Видимо, правда, что нам не стоит полагаться на людей.
	Info_ClearChoices(DIA_RaDaPo_TsaHaNauhSend);
	MIS_DS2P_FuriousAncestors_Stage = MIS_DS2P_FuriousAncestors_Failed;
};
func void DIA_RaDaPo_TsaHaNauhSend_Yes()
{
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_Yes_15_01");	//Помогу.
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_Yes_18_02");	//Благодарю тебя. Твоя помощь потребуется не только в сражении, но и с ингредиентами.
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_Yes_15_03");	//Что нужно для твоего снадобья?
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_Yes_18_04");	//У меня есть все, что можно найти на болоте. Но еще нужен самый редкий ингредиент - агах-на. Люди называют его солнечное алоэ.

	Info_ClearChoices(DIA_RaDaPo_TsaHaNauhSend);
	Info_AddChoice(DIA_RaDaPo_TsaHaNauhSend,"Солнечное алоэ? Я слышал о нем.",DIA_RaDaPo_TsaHaNauhSend_KnowIt);
	Info_AddChoice(DIA_RaDaPo_TsaHaNauhSend,"Солнечное алоэ? Что это?",DIA_RaDaPo_TsaHaNauhSend_WhatIsIt);
};
func void DIA_RaDaPo_TsaHaNauhSend_YesFinal()
{
	AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_Yes_15_01");	//Я принесу алоэ.
	//спаун солнечного алоэ в пещере тролля
	Wld_InsertItem(ItPl_DS2P_SunAloe,WP_ITEM_SUNALOE);
	//Запись в дневнике "Разгневанные предки"
	B_DSG_Log_OpenClose(TOPIC_DS2P_FuriousAncestors,LOG_MISSION,LOG_NOTE,TOPIC_DS2P_FuriousAncestors_Start);
	MIS_DS2P_FuriousAncestors_Stage = MIS_DS2P_FuriousAncestors_Aloe;
};	
func void DIA_RaDaPo_TsaHaNauhSend_WhatIsIt()
{
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_WhatIsIt_15_01");	//Солнечное алоэ? Что это?
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_WhatIsIt_18_02");	//Очень редкое растение. Оно вырастает только там, где живет черный тролль.
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_WhatIsIt_15_03");	//Черный тролль. Никаких проблем.
	DIA_RaDaPo_TsaHaNauhSend_YesFinal();
};

func void DIA_RaDaPo_TsaHaNauhSend_KnowIt()
{
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_KnowIt_15_01");	//Солнечное алоэ? Я слышал о нем.
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_KnowIt_15_02");	//Вроде бы, оно растет только в помете черного тролля.
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_KnowIt_18_03");	//(с уважением) Ты, должно быть, очень хороший знахарь, если знаешь, где искать агах-на.
	DIA_RaDaPo_TsaHaNauhSend_YesFinal();
};
// Где искать тролля? ---------------------------------------------------------------------
//пока не нашли алоэ
instance DIA_RaDaPo_WhereIsBlackTroll(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 21;
	condition = DIA_RaDaPo_WhereIsBlackTroll_condition;	
	information = DIA_RaDaPo_WhereIsBlackTroll_info;
	description = "И где у вас на острове живет черный тролль?";
};
func int DIA_RaDaPo_WhereIsBlackTroll_condition()
{
	if (MIS_DS2P_FuriousAncestors_Stage == MIS_DS2P_FuriousAncestors_Aloe)	{
		return TRUE;
	};
};
func void DIA_RaDaPo_WhereIsBlackTroll_info()
{	
		AI_Output(other,self,"DIA_RaDaPo_WhereIsBlackTroll_15_01");	//И где у вас на острове живет черный тролль?
	AI_Output(self,other,"DIA_RaDaPo_WhereIsBlackTroll_18_02");	//Там-то и там-то
	//UNFINISHED - вписать, где черный тролль
	//Запись в дневнике "Разгневанные предки"
	B_DSG_Log_OpenClose(TOPIC_DS2P_FuriousAncestors,LOG_MISSION,LOG_NOTE,TOPIC_DS2P_FuriousAncestors_WhereTroll);
};
// Кто может помочь? ---------------------------------------------------------------------
//пока не призвали предка
instance DIA_RaDaPo_ShouldFightAlone(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 22;
	condition = DIA_RaDaPo_ShouldFightAlone_condition;	
	information = DIA_RaDaPo_ShouldFightAlone_info;
	description = "Мне придется в одиночку сражаться с духом?";
};
func int DIA_RaDaPo_ShouldFightAlone_condition()
{
	if ((MIS_DS2P_FuriousAncestors_Stage >= MIS_DS2P_FuriousAncestors_Aloe) && (MIS_DS2P_FuriousAncestors_Stage < MIS_DS2P_FuriousAncestors_Fight))	{
		return TRUE;
	};
};
func void DIA_RaDaPo_ShouldFightAlone_info()
{	
		AI_Output(other,self,"DIA_RaDaPo_ShouldFightAlone_15_01");	//Мне придется в одиночку сражаться с духом?
	AI_Output(self,other,"DIA_RaDaPo_ShouldFightAlone_18_02");	//Ты привел в наше племя двух орков. Они должны помочь.
	AI_Output(self,other,"DIA_RaDaPo_ShouldFightAlone_18_03");	//Дух тоже будет не один. Его гнев поднимет из земли кости мертвых, а проклятие будет мешать вам сражаться.
	AI_Output(self,other,"DIA_RaDaPo_ShouldFightAlone_18_04");	//Тебе лучше хорошенько подготовиться. Вот, возьми эти целебные травы.
	//дает лечебный корень, 2 лечебных растения, 3 луговых горца
	B_GiveInvItems(self,other,ItPl_Health_Herb_03,1);
	B_GiveInvItems(self,other,ItPl_Health_Herb_02,2);
	B_GiveInvItems(self,other,ItPl_Temp_Herb,3);
	//Запись в дневнике "Разгневанные предки"
	B_DSG_Log_OpenClose(TOPIC_DS2P_FuriousAncestors,LOG_MISSION,LOG_NOTE,TOPIC_DS2P_FuriousAncestors_AboutGhost);
};
// Принесли алоэ ---------------------------------------------------------------------
instance DIA_RaDaPo_AloeGot(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 23;
	condition = DIA_RaDaPo_AloeGot_condition;	
	information = DIA_RaDaPo_AloeGot_info;
	description = "";
};
func int DIA_RaDaPo_AloeGot_condition()
{
	if ((MIS_DS2P_FuriousAncestors_Stage == MIS_DS2P_FuriousAncestors_Aloe)
		 && Npc_HasItems(other, ItPl_DS2P_SunAloe)){
		return TRUE;
	};
};
func void DIA_RaDaPo_AloeGot_info()
{	
		AI_Output(other,self,"DIA_RaDaPo_AloeGot_15_01");	//
	AI_Output(self,other,"DIA_RaDaPo_AloeGot_18_02");	//
	//Запись в дневнике "Разгневанные предки"
	B_DSG_Log_OpenClose(TOPIC_DS2P_FuriousAncestors,LOG_MISSION,LOG_NOTE,TOPIC_DS2P_FuriousAncestors_WhereTroll);
};


//NS - 05/05/2016 ===========
// ОБУЧЕНИЕ
//===========================
instance DIA_RaDaPo_PreTeach(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 50;
	condition = DIA_RaDaPo_PreTeach_condition;	
	information = DIA_RaDaPo_PreTeach_info;
	description = "Ты можешь меня чему-нибудь научить из шаманской магии?";
};
func int DIA_RaDaPo_PreTeach_condition()
{
	if (Npc_KnowsInfo(other,DIA_RaDaPo_Hello))	{
		return TRUE;
	};
};
func void DIA_RaDaPo_PreTeach_info()
{	
		AI_Output(other,self,"DIA_RaDaPo_PreTeach_15_01");	//Ты можешь меня чему-нибудь научить из шаманской магии?
	AI_Output(self,other,"DIA_RaDaPo_PreTeach_18_02");	//Нет. Это древняя магия орков и гоблинов, человеку не дано ее постичь. 
	AI_Output(self,other,"DIA_RaDaPo_PreTeach_18_03");	//Вы, люди, слишком сильно полагаетесь на разум и контроль, а шаману помогают чувства и интуиция.
	AI_Output(self,other,"DIA_RaDaPo_PreTeach_18_04");	//Нужно уметь следовать мировому течению магии, а не плыть против него.
	AI_Output(self,other,"DIA_RaDaPo_PreTeach_18_05");	//Хотя... кое-чему я, наверное, смогу тебя научить. 
	AI_Output(self,other,"DIA_RaDaPo_PreTeach_18_06");	//Я могу показать, как более умело управлять магическими потоками и направлять их в нужное тебе русло. Это повысит твою магическую силу.
	//Запись в дневнике в разделе доп. инфо. "Учителя в деревне гоблинов"
	B_DSG_Log_OpenClose(TOPIC_GobboTeacher,LOG_NOTE,-1,"Шаман племени Ра-Да-По может повысить мою магическую силу.");
	
};
// ----------------------------------------------------
instance DIA_RaDaPo_Teach_Mana(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 51;
	permanent = TRUE;
	condition = DIA_RaDaPo_Teach_Mana_condition;	
	information = DIA_RaDaPo_Teach_Mana_info;
	description = "Повысь мои магические способности.";
};
func int DIA_RaDaPo_Teach_Mana_condition()
{
	if (TEACH_RaDaPo)	{
		return TRUE;
	};
};
func void DIA_RaDaPo_Teach_Mana_Menu()
{	
	Info_ClearChoices(DIA_RaDaPo_Teach_Mana);
	Info_AddChoice(DIA_RaDaPo_Teach_Mana,Dialog_Back,DIA_RaDaPo_Teach_Mana_Back);
	Info_AddChoice(DIA_RaDaPo_Teach_Mana,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_MANA_MAX,10,0),DIA_RaDaPo_Teach_Mana_10);
	Info_AddChoice(DIA_RaDaPo_Teach_Mana,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_MANA_MAX,5,0),DIA_RaDaPo_Teach_Mana_5);
	Info_AddChoice(DIA_RaDaPo_Teach_Mana,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_MANA_MAX,1,0),DIA_RaDaPo_Teach_Mana_1);
};
func void DIA_RaDaPo_Teach_Mana_info()
{	
		AI_Output(other,self,"DIA_RaDaPo_Teach_Mana_15_01");	//Повысь мои магические способности.
	DIA_RaDaPo_Teach_Mana_Menu();
};
func void DIA_RaDaPo_Teach_Mana_Back()
{	
	Info_ClearChoices(DIA_RaDaPo_Teach_Mana);
};
func void DIA_RaDaPo_Teach_Mana_1()
{	
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MANA_MAX);
	DIA_RaDaPo_Teach_Mana_Menu();
};
func void DIA_RaDaPo_Teach_Mana_5()
{	
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MANA_MAX);
	DIA_RaDaPo_Teach_Mana_Menu();
};
func void DIA_RaDaPo_Teach_Mana_10()
{	
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,10,T_MANA_MAX);
	DIA_RaDaPo_Teach_Mana_Menu();
};


/* UNFINISHED


Я принес солнечное алоэ.
ГГ: Я принес солнечное алоэ.
Ра-Да-По: Это отличная новость!
Запись в дневнике "Разгневанные предки"



Когда соберем все ингредиенты, шаман сам говорит.
Ра-Да-По: Хорошо, теперь у нас есть все, чтобы сварить снадобье.
Мне нужно немного времени, и духов лучше всего вызвать на рассвете. Приходи завтра к исходу ночи.

Запись в дневнике "Разгневанные предки"
Завтра на рассвете все будет готово и мы вызовем духа. Нужно хорошенько подготовиться.

На следующий день шаман сам обратится к нам.

Ра-Да-По: Снадобье готово. Тебе нужно выпить его и произнести имя предка: Нии-Дах Ра. Повтори.
ГГ: Нии-Дах Ра.
//Передает ГГ зелье.
Ра-Да-По: Хорошо. Скажи, когда будешь готов.

ГГ: Я готов.
//если время с 4 до 8
Ра-Да-По: Возьми снадобье.
//иначе
Ра-Да-По: Сейчас не лучшее время. Приходи на рассвете.
//пьет зелье
ГГ: Нии-Дах Ра.
Запись в дневнике "Разгневанные предки"


//выпив зелье, ГГ произносит имя духа и рядом появляется дух берсерка. дух будет преследовать ГГ, пока один из них не умрет
//периодически вокруг него спаунится случайное число скелетов-гоблинов 
//пока дух преследует ГГ, у него снижается владение всеми видами оружия на 10%

Запись в дневнике "Разгневанные предки". Квест выполнен.


Ра-Да-По: Тебе удалось! Духи успокоились.
Мы в неоплатном долгу перед тобой, и ты доказал всему племени, что мы можем верить и людям.
Посему, хоть ты и являешься человеком, мы готовы принять тебя в наше племя, как равного.
Отныне и навсегда ты принадлежишь к болотному племени гоблинов. Теперь ты один из нас, можешь ходить куда хочешь, учиться и рассчитывать на нашу помощь. 
Также прими этот амулет, это знак нашего рода.
//Дает талисман гоблинов «Друг племени» со статами: + 30 здоровья, + 5 силы.

Запись в дневнике в разделе доп. инфо. "Особое"
Меня приняли в племя гоблинов. Теперь я могу ходить куда хочу и учиться у них.

//*/