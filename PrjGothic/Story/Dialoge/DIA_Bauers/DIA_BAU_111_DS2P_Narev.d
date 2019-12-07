instance DIA_Narev_EXIT(C_Info)
{
	npc = BAU_111_DS2P_Narev;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Narev_EXIT_condition;	
	information = DIA_Narev_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Narev_EXIT_condition(){	return TRUE;};
func void DIA_Narev_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 02/07/2013 ===========================
//  Стартовый 
//===========================================
instance DIA_Narev_Start(C_Info)
{
	npc = BAU_111_DS2P_Narev;
	nr = 0;
	condition = DIA_Narev_Start_condition;	
	information = DIA_Narev_Start_info;
	important = TRUE;
};
func int DIA_Narev_Start_condition()
{
	if (Npc_IsInState(self, ZS_Talk)){	return TRUE;};
};
func void DIA_Narev_Start_info()
{
		AI_Output(self,other,"DIA_Narev_Start_16_00");	//Юноша, я тебя раньше не видел. Ты же не один из пиратов, я ведь правильно понял?
	AI_Output(other,self,"DIA_Narev_Start_15_01");	//Да, абсолютно. Я недавно прибыл на остров.
		AI_Output(self,other,"DIA_Narev_Start_16_02");	//(кашляет) Да-да... (задумался)
		AI_Output(self,other,"DIA_Narev_Start_16_03");	//Расскажу я тебе одну поучительную историю. Помню, как-то попал я в сильный буран. Угораздило меня на спор пойти в лес в одной шкуре. Молодой еще был, глупый.
		AI_Output(self,other,"DIA_Narev_Start_16_04");	//Иду, значит, по лесу и тут слышу вой. Целая стая волков на охоту вышла. А мне надо было до опушки дойти, а то спор-то не выиграть.
		AI_Output(self,other,"DIA_Narev_Start_16_05");	//Постоял с минутку и смекнул, что выиграть-то, может, я и выиграю, только радоваться мне этому уже вряд ли придется. Ну и дал деру в сторону деревни.
		AI_Output(self,other,"DIA_Narev_Start_16_06");	//Стая за мной. Так быстро я в жизни не бегал. А у волков глаза горят... Думал все, сожрут. (кашляет)
		AI_Output(self,other,"DIA_Narev_Start_16_07");	//И тут смотрю:  мракорис в сугробе сидит, задремал как обычно бывает. Теперь думаю все: если волки не слопают – мракорис разорвет...
	AI_Output(other,self,"DIA_Narev_Start_15_08");	//И как же ты спасся?
		AI_Output(self,other,"DIA_Narev_Start_16_09");	//А я перед самой зверюгой, пока тот не проснулся, брык в снег и зарылся. А волки-то уже разогнались.
		AI_Output(self,other,"DIA_Narev_Start_16_10");	//Ну, в общем, вылез я под утро из сугроба. Смотрю: нет ни волков, ни мракориса. То ли он их слопал вместе с костями, то ли мирно разошлись. Кто знает?!
	AI_Output(other,self,"DIA_Narev_Start_15_11");	//А к чему ты это мне рассказал?
		AI_Output(self,other,"DIA_Narev_Start_16_12");	//К чему? Да так, вспомнилось... Ааа! Простыл я тогда сильно, вот почти как сейчас.
		AI_Output(self,other,"DIA_Narev_Start_16_13");	//Сыро тут очень. Болею часто. (кашляет)
		AI_Output(self,other,"DIA_Narev_Start_16_14");	//Мой отец всегда говорил, что медом надо лечиться, да воды с травами пить побольше. Да где же тут меда возьмешь, в пещере-то?
};


//NS - 02/07/2013 ===========================
//  Общие диалоги, после стартового
//===========================================
//-------------------------------------------
//	Дать мед, если есть	 (+опыт)	nr = 1;
instance DIA_Narev_GiveHoney(C_Info)
{
	npc = BAU_111_DS2P_Narev;
	nr = 1;
	condition = DIA_Narev_GiveHoney_condition;	
	information = DIA_Narev_GiveHoney_info;
	description = "У меня есть мед.";
};
func int DIA_Narev_GiveHoney_condition()
{
	if (Npc_KnowsInfo(other,DIA_Narev_Start) && (Npc_HasItems(other,ItFo_Honey) > 0))
	{	return TRUE;};
};
func void DIA_Narev_GiveHoney_info()
{
	var int x;
	AI_Output(other,self,"DIA_Narev_GiveHoney_15_00");	//У меня есть мед.
	//(+опыт)
	B_GivePlayerXP(XP_Narev_GiveHoney);
		AI_Output(self,other,"DIA_Narev_GiveHoney_16_01");	//Ай да молодец, ай да старика утешил. Спасибо тебе!
		AI_Output(self,other,"DIA_Narev_GiveHoney_16_02");	//А я уж думал, что никто не поможет! Теперь точно скоро на поправку пойду.
	//Забирает мед
	x = 1; if (x == 1)	{
		B_DS_GiveRemoveItems(other,self,ItFo_Honey,1);
	};
		AI_Output(self,other,"DIA_Narev_GiveHoney_16_03");	//Надо бы наградить тебя за помощь, да у меня кроме куска хлеба ничего и нет.

	Info_ClearChoices(DIA_Narev_GiveHoney);
	Info_AddChoice(DIA_Narev_GiveHoney,"Ничего не нужно, ты главное выздоравливай.",DIA_Narev_GiveHoney_Nothing);
	Info_AddChoice(DIA_Narev_GiveHoney,"Даже пары монет не найдется?",DIA_Narev_GiveHoney_Money);
};
func void DIA_Narev_GiveHoney_Money()
{
	var int x;
	AI_Output(other,self,"DIA_Narev_GiveHoney_Money_15_00");	//Даже пары монет не найдется?
		AI_Output(self,other,"DIA_Narev_GiveHoney_Money_16_01");	//Погоди сынок, сейчас посмотрю. Смотри, и вправду, есть немного.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Money_16_02");	//Я уже про них и забыл. На черный день оставлял. Но тебе то они нужнее. Бери.
	//Дает 50 монет
	x = 1; if (x == 1)	{
		B_GiveInvItems(self,other,ItMi_Gold,50);
	};
};
func void DIA_Narev_GiveHoney_Nothing()
{
	AI_Output(other,self,"DIA_Narev_GiveHoney_Nothing_15_00");	//Ничего не нужно, ты главное выздоравливай.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Nothing_16_01");	//Не часто встретишь добрых людей. А добро нужно всегда поощрять, особенно, когда оно от всего сердца.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Nothing_16_02");	//И хоть у меня ничего нет, зато я знаю много интересных историй. Давай я тебе расскажу одну историю.

	Info_ClearChoices(DIA_Narev_GiveHoney);
	Info_AddChoice(DIA_Narev_GiveHoney,"С удовольствием послушаю.",DIA_Narev_GiveHoney_Listen1);
	Info_AddChoice(DIA_Narev_GiveHoney,"Лучше в другой раз.",DIA_Narev_GiveHoney_Later);
};
func void DIA_Narev_GiveHoney_Later()
{
	AI_Output(other,self,"DIA_Narev_GiveHoney_Later_15_00");	//Лучше в другой раз.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Later_16_01");	//И правда, не время еще. Еще раз спасибо тебе.
	Info_ClearChoices(DIA_Narev_GiveHoney);
};
func void DIA_Narev_GiveHoney_Listen()
{
	AI_Output(other,self,"DIA_Narev_GiveHoney_Listen_15_00");	//С удовольствием послушаю.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Listen_16_01");	//(кашляет) С чего бы начать? А, вот, точно.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Listen_16_02");	//Было мне тогда лет пятнадцать или чуть больше. Мы с отцом решили поохотиться на кроликов. Ты, думаю, знаешь – мясо у них сочное, вкусное.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Listen_16_03");	//Ну вот, понаставили силков, да в кустах притаились. Место мы знали, где они обычно бегать любят – всегда там охотились.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Listen_16_04");	//Так вот, ждали, ждали. Никого. Опять ждали, ждали. Никого. Кролики-то очень осторожные – их так просто не поймать.

	Info_ClearChoices(DIA_Narev_GiveHoney);
	Info_AddChoice(DIA_Narev_GiveHoney,"Извини, но мне нужно идти.",DIA_Narev_GiveHoney_Interrupt1);
	Info_AddChoice(DIA_Narev_GiveHoney,"Продолжай.",DIA_Narev_GiveHoney_Listen1);
};
func void DIA_Narev_GiveHoney_Interrupt1()
{
	AI_Output(other,self,"DIA_Narev_GiveHoney_Interrupt1_15_00");	//Извини, но мне нужно идти.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Interrupt1_16_01");	//Прости. Конечно, у тебя куча дел. Не буду тебя задерживать.
	Info_ClearChoices(DIA_Narev_GiveHoney);
};
func void DIA_Narev_GiveHoney_Listen1()
{
	AI_Output(other,self,"DIA_Narev_GiveHoney_Listen1_15_00");	//Продолжай.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Listen1_16_01");	//Прошло несколько часов. И вот слышу я, прыг-скок, прыг-скок.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Listen1_16_02");	//На опушке появилась крольчиха с двумя дитятками. Крольчиха-то зырк по сторонам. Увидела приманку в силках, но сразу не пошла. Насторожилась.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Listen1_16_03");	//Зато детки ее были не такие смышленые и уже через пару минут сидели в мешке.

	Info_ClearChoices(DIA_Narev_GiveHoney);
	Info_AddChoice(DIA_Narev_GiveHoney,"Мне надоело это слушать, прости.",DIA_Narev_GiveHoney_Interrupt2);
	Info_AddChoice(DIA_Narev_GiveHoney,"Продолжай.",DIA_Narev_GiveHoney_Listen2);
};
func void DIA_Narev_GiveHoney_Interrupt2()
{
	AI_Output(other,self,"DIA_Narev_GiveHoney_Interrupt2_15_00");	//Мне надоело это слушать, прости.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Interrupt2_16_01");	//Да, конечно. Что-то я заболтался. Потом дорасскажу.
	Info_ClearChoices(DIA_Narev_GiveHoney);
};
func void DIA_Narev_GiveHoney_Listen2()
{
	AI_Output(other,self,"DIA_Narev_GiveHoney_Listen2_15_00");	//Продолжай.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Listen2_16_01");	//Жаль, конечно, – мяса от детенышей немного. Мы-то с отцом надеялись поймать взрослую особь.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Listen2_16_02");	//Ну да на безрыбье и рак – кролик. (смеется)
		AI_Output(self,other,"DIA_Narev_GiveHoney_Listen2_16_03");	//Вернулись домой, наелись и спать легли. Вот такая вот история.

	Info_ClearChoices(DIA_Narev_GiveHoney);
	Info_AddChoice(DIA_Narev_GiveHoney,"Чушь какая-то.",DIA_Narev_GiveHoney_BadStory);
	Info_AddChoice(DIA_Narev_GiveHoney,"Интересная история.",DIA_Narev_GiveHoney_GoodStory);
};
func void DIA_Narev_GiveHoney_BadStory()
{
	AI_Output(other,self,"DIA_Narev_GiveHoney_BadStory_15_00");	//Чушь какая-то.
		AI_Output(self,other,"DIA_Narev_GiveHoney_BadStory_16_01");	//Да, история получилась не очень занимательная. К чему я это вспомнил и забыл уже.
	Info_ClearChoices(DIA_Narev_GiveHoney);
};
func void DIA_Narev_GiveHoney_GoodStory()
{
	var int x;
	AI_Output(other,self,"DIA_Narev_GiveHoney_GoodStory_15_00");	//Интересная история.
		AI_Output(self,other,"DIA_Narev_GiveHoney_GoodStory_16_01");	//Ты сегодня меня три раза удивил. А это происходит очень редко.
	AI_Output(other,self,"DIA_Narev_GiveHoney_GoodStory_15_02");	//О чем ты?
		AI_Output(self,other,"DIA_Narev_GiveHoney_GoodStory_16_03");	//Сначала ты принес мне мед, хотя я не просил тебя об этом, и после этого ты не попросил ничего за свои труды. Ты выслушал глупую историю и ни разу не перебил меня, и даже похвалил в конце.
		AI_Output(self,other,"DIA_Narev_GiveHoney_GoodStory_16_04");	//Я уже давно не встречал таких людей, которые живут не на поверхности, которым не чуждо уважение к старшим, сочувствие и искренняя доброта.
		AI_Output(self,other,"DIA_Narev_GiveHoney_GoodStory_16_05");	//Я хочу вознаградить тебя за это. Ты заслужил. Возьми этот ключ и иди на опушку, про которую я рассказывал.
	// UNFINISHED вписать дорогу к сундуку
		AI_Output(self,other,"DIA_Narev_GiveHoney_GoodStory_16_06");	//Она находится /*Redleha: там-то и там-то. НАДО ИСПРАВИТЬ*/. Да, и лопату прихвати с собой.
		AI_Output(self,other,"DIA_Narev_GiveHoney_GoodStory_16_07");	//Там увидишь старое полусгнившее бревно, вот возле него нужно копать. Затем найдешь сундук, а в сундуке будет кое-что для тебя.
	AI_Output(other,self,"DIA_Narev_GiveHoney_GoodStory_15_08");	//Что в сундуке?
		AI_Output(self,other,"DIA_Narev_GiveHoney_GoodStory_16_09");	//Я сам не знаю. Ключ дал мне отец и сказал, что он нашел какой-то древний артефакт, но так как никогда не сталкивался с магией и даже боялся ее, решил закопать в землю, чтобы не случилось беды.
		AI_Output(self,other,"DIA_Narev_GiveHoney_GoodStory_16_10");	//А после смерти завещал мне хранить реликвию. Но я скоро тоже умру, а передать ключ мне некому – детей я, увы, не завел. Надеюсь, этот артефакт поможет тебе в твоих странствиях.
	//Дает ключ  «от сундука на поляне»
	x = 1; if (x == 1)	{
		B_GiveInvItems(self,other,ITKE_KEY_DS2P_NAREV,1);
	};
	Narev_GaveKey = TRUE;
};


//-------------------------------------------
//	"Напомни, где мне искать сундук?"		nr = 2;
instance DIA_Narev_WheresChest(C_Info)
{
	npc = BAU_111_DS2P_Narev;
	nr = 2;
	condition = DIA_Narev_WheresChest_condition;	
	information = DIA_Narev_WheresChest_info;
	description = "Напомни, где мне искать сундук?";
};
func int DIA_Narev_WheresChest_condition()
{
	if (Narev_GaveKey == TRUE){	return TRUE;};
};
func void DIA_Narev_WheresChest_info()
{
	AI_Output(other,self,"DIA_Narev_WheresChest_15_00");	//Напомни, где мне искать сундук?
	// UNFINISHED вписать дорогу к сундуку
		AI_Output(self,other,"DIA_Narev_WheresChest_16_01");	//Она находится /*Redleha: там-то и там-то. НАДО ИСПРАВИТЬ*/.
		AI_Output(self,other,"DIA_Narev_WheresChest_16_02");	//Ищи на опушке бревно. Сундук зарыт возле него.
};


//-------------------------------------------
//	"Давно вы сидите в этой пещере?"		nr = 3;
instance DIA_Narev_HowLongAUThere(C_Info)
{
	npc = BAU_111_DS2P_Narev;
	nr = 3;
	condition = DIA_Narev_HowLongAUThere_condition;	
	information = DIA_Narev_HowLongAUThere_info;
	description = "Давно вы сидите в этой пещере?";
};
func int DIA_Narev_HowLongAUThere_condition()
{
	if (Npc_KnowsInfo(other,DIA_Narev_Start)){	return TRUE;};
};
func void DIA_Narev_HowLongAUThere_info()
{
	AI_Output(other,self,"DIA_Narev_HowLongAUThere_15_00");	//Давно вы сидите в этой пещере?
		AI_Output(self,other,"DIA_Narev_HowLongAUThere_16_01");	//Да я уже потерял счет времени. (кашляет)
		AI_Output(self,other,"DIA_Narev_HowLongAUThere_16_02");	//Ты знаешь, когда живешь в темнице, то сначала считаешь часы, потом дни, а потом понимаешь, что уже не представляешь, сколько ты провел времени – то ли день, то ли год.
};


//-------------------------------------------
//	"Ты знаешь, где искать охотников?" (если еще не нашел)		nr = 4;
instance DIA_Narev_WhereAHunters(C_Info)
{
	npc = BAU_111_DS2P_Narev;
	nr = 4;
	condition = DIA_Narev_WhereAHunters_condition;	
	information = DIA_Narev_WhereAHunters_info;
	description = "Ты знаешь, где искать охотников?";
};
func int DIA_Narev_WhereAHunters_condition()
{
	if (Npc_KnowsInfo(other,DIA_Narev_Start)){	return TRUE;};
};
func void DIA_Narev_WhereAHunters_info()
{
	AI_Output(other,self,"DIA_Narev_WhereAHunters_15_00");	//Ты знаешь, где искать охотников?
		AI_Output(self,other,"DIA_Narev_WhereAHunters_16_01");	//Увы... Перед нападением пиратов большинство из них было в лесу, охотились.
		AI_Output(self,other,"DIA_Narev_WhereAHunters_16_02");	//А уже когда все случилось, понять, кто жив, кто уже нет, кто вернулся, а кто успел сбежать, не представлялось возможным. Меня и женщин сразу погнали сюда в пещеру.
		AI_Output(self,other,"DIA_Narev_WhereAHunters_16_03");	//Я даже не знаю, что сейчас там происходит. Может быть, ты мне расскажешь и успокоишь старика?
	AI_Output(other,self,"DIA_Narev_WhereAHunters_15_04");	//В целом все спокойно. Пираты, конечно, не лучшие соседи, но в целом ведут себя сдержано. Я не видел, чтобы над кем-то издевались или неоправданно применяли силу.
		AI_Output(self,other,"DIA_Narev_WhereAHunters_16_05");	//Ты меня успокоил. Значит, у нас еще есть шанс выжить. Спасибо тебе за эти новости.
};


//-------------------------------------------
//	"Как ты себя чувствуешь?" (постоянный)		nr = 5;
instance DIA_Narev_HowAU(C_Info)
{
	npc = BAU_111_DS2P_Narev;
	nr = 5;
	condition = DIA_Narev_HowAU_condition;	
	information = DIA_Narev_HowAU_info;
	description = "Как ты себя чувствуешь?";
	permanent = TRUE;
};
func int DIA_Narev_HowAU_condition()
{
	if (Npc_KnowsInfo(other,DIA_Narev_Start)){	return TRUE;};
};
func void DIA_Narev_HowAU_info()
{
	AI_Output(other,self,"DIA_Narev_HowAU_15_00");	//Как ты себя чувствуешь?
		AI_Output(self,other,"DIA_Narev_HowAU_16_01");	//(кашляет) Хорошо, если учитывать, что я уже далеко не молод и слегка простыл. Но это не беда, справлюсь!
};


//-------------------------------------------
//	"Расскажи мне интересную историю." (постоянный)		nr = 6;
instance DIA_Narev_TellMeStory(C_Info)
{
	npc = BAU_111_DS2P_Narev;
	nr = 6;
	condition = DIA_Narev_TellMeStory_condition;	
	information = DIA_Narev_TellMeStory_info;
	description = "Расскажи мне интересную историю.";
	permanent = TRUE;
};
func int DIA_Narev_TellMeStory_condition()
{
	if (Npc_KnowsInfo(other,DIA_Narev_Start)){	return TRUE;};
};
func void DIA_Narev_TellMeStory_info()
{
	AI_Output(other,self,"DIA_Narev_TellMeStory_15_00");	//Расскажи мне интересную историю.
		AI_Output(self,other,"DIA_Narev_TellMeStory_16_01");	//О чем ты хочешь послушать?
		AI_Output(self,other,"DIA_Narev_TellMeStory_16_02");	//Я могу тебе рассказать, как ходил к пику дракона, как сдружился с одним гоблином, о походе в древний город, а также охоте на огромного спрута.

	Info_ClearChoices(DIA_Narev_TellMeStory);
	Info_AddChoice(DIA_Narev_TellMeStory,Dialog_Back,DIA_Narev_TellMeStory_Back);
	Info_AddChoice(DIA_Narev_TellMeStory,"Расскажи об охоте на спрута.",DIA_Narev_TellMeStory_Octopus);
	Info_AddChoice(DIA_Narev_TellMeStory,"Расскажи о походе в древний город.",DIA_Narev_TellMeStory_OldCity);
	Info_AddChoice(DIA_Narev_TellMeStory,"Расскажи о дружбе с гоблином.",DIA_Narev_TellMeStory_Gobbo);
	Info_AddChoice(DIA_Narev_TellMeStory,"Расскажи о путешествии к пику дракона.",DIA_Narev_TellMeStory_Dragon);
};
func void DIA_Narev_TellMeStory_Back()
{
	Info_ClearChoices(DIA_Narev_TellMeStory);
};
// UNFINISHED вписать истории
func void DIA_Narev_TellMeStory_Dragon()
{
	Info_ClearChoices(DIA_Narev_TellMeStory);
};
func void DIA_Narev_TellMeStory_Gobbo()
{
	Info_ClearChoices(DIA_Narev_TellMeStory);
};
func void DIA_Narev_TellMeStory_OldCity()
{
	Info_ClearChoices(DIA_Narev_TellMeStory);
};
func void DIA_Narev_TellMeStory_Octopus()
{
	Info_ClearChoices(DIA_Narev_TellMeStory);
};


