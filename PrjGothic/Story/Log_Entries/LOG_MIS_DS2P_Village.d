

//===================================== ВНУК РЫБАКА ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Харок
//Участники: Гарон, Карах

var int MIS_DS2P_GrandsonOfFisherman;
const string TOPIC_DS2P_GrandsonOfFisherman = "Внук рыбака_GrandsonOfFisherman";

	const string TOPIC_DS2P_GrandsonOfFisherman_Start = "На берегу я встретил рыбака Харока, который рассказал, что его внука Гарона забрали пираты, чтобы сделать из него матроса. Харок очень просит вернуть внука домой. Я обещал помочь.";
	const string TOPIC_DS2P_GrandsonOfFisherman_KardarSeen = "Кадар видел, как пираты Гарона тащили в ратушу.";
	const string TOPIC_DS2P_GrandsonOfFisherman_CimmSeen = "Целитель Цимм сказал, что видел внука рыбака пару дней назад. Гарон был весь в синяках и ссадинах. Цимм дал ему несколько зелий. Больше Гарон не возвращался.";
	const string TOPIC_DS2P_GrandsonOfFisherman_MariaSeen = "Оказывается, Гарона держат в сарае и постоянно избивают за то, что тот не хочет работать на пиратов. Нужно придумать способ вытащить его из плена. Думаю, ключ есть у Караха, одного из пиратов, который носит еду Гарону.";
	const string TOPIC_DS2P_GrandsonOfFisherman_Escaped = "Мы с Карахом проверили подвал, но Гарон исчез. Самое интересное, что дверь была закрыта, а значит, Гарон нашел другой способ выбраться. Нужно понять как.";
	const string TOPIC_DS2P_GrandsonOfFisherman_Found = "Я нашел Гарона. Он сумел активировать древний телепорт, находившийся в подвале, и переместился в пещеру.";
	const string TOPIC_DS2P_GrandsonOfFisherman_Demon = "Правда, в пещере живет какой-то очень опасный демон, который хотел убить Гарона. Я должен найти и уничтожить эту тварь.";
	const string TOPIC_DS2P_GrandsonOfFisherman_Free = "Мне удалось спасти Гарона из ловушки.";
	const string TOPIC_DS2P_GrandsonOfFisherman_JoinPirates = "Теперь, когда все позади, Гарон выбрал свой путь – он будет одним из пиратов. Нужно получить награду от Грега, а также сообщить новость Хароку.";
	const string TOPIC_DS2P_GrandsonOfFisherman_HideInForest = "Гарон предпочел отсидеться в лесу, пока все не утихнет. Нужно сообщить об этом Хароку.";
	const string TOPIC_DS2P_GrandsonOfFisherman_SuccessPirat = "Я рассказал Хароку о выборе его внука. Харок был очень опечален новостью. Я его понимаю.";
	const string TOPIC_DS2P_GrandsonOfFisherman_SuccessReturned = "Мне удалось вернуть Гарона и спасти его и деда от пиратов. В качестве награды Харон дал мне ключ от сундука с сокровищами, который находится в одной из штолен соляной пещеры. Также я могу приходить к нему каждый день и брать у него свежую рыбу.";
	const string TOPIC_DS2P_GrandsonOfFisherman_SuccessHide = "Мне удалось Гарона от пиратов. В качестве награды Харон дал мне ключ от сундука с сокровищами, который находится в одной из штолен соляной пещеры.";
	const string TOPIC_DS2P_GrandsonOfFisherman_SuccessHunters = "Харок мертв. Мне удалось убедить Гарона найти охотников в лесу и присоединиться к ним для того, чтобы вместе уничтожить пиратов.\nВ качестве награды Гарон дал мне ключ от сундука с сокровищами, который находится в одной из штолен соляной пещеры.";
	const string TOPIC_DS2P_GrandsonOfFisherman_FailGaronDead = "Мне не удалось спасти Гарона.";
	const string TOPIC_DS2P_GrandsonOfFisherman_FailHarokDead = "Харок погиб.";

const int XP_MIS_GrandsonOfFisherman_01 = 0;
const int XP_MIS_GrandsonOfFisherman_AskedKarah		= 0;	//спросили Караха про Гарона в подвале
const int XP_MIS_GrandsonOfFisherman_KilledDeamon	= 0;	//убили огненноо мракориса и рассказали об этом Гарону
//ветка - пират
const int XP_MIS_GrandsonOfFisherman_Pirat			= 0;	//выбрали, что Гарону быть пиратом
const int XP_MIS_GrandsonOfFisherman_IsPirat		= 0;	//Гарона зачислили в пираты, мы поинтересовались его жизнью
const int XP_MIS_GrandsonOfFisherman_Pirat_ToldHakon	= 0;	//сказали от этом Хароку (квест окончен)
//ветка - вернуться к деду
const int XP_MIS_GrandsonOfFisherman_GoHome			= 0;	//Гарон вернулся к деду
const int XP_MIS_GrandsonOfFisherman_HomeAllAlive	= 0;	//Все выжили, Гарон нас благодарит
const int XP_MIS_GrandsonOfFisherman_HomeHakonDead	= 0;	//Гарон выжил, но Харока убили пираты
const int XP_MIS_GrandsonOfFisherman_HomeAllAlive2	= 0;	//Все выжили, Хакон нас благодарит (квест окончен)
//ветка - сам выбирай
const int XP_MIS_GrandsonOfFisherman_GoForest		= 0;	//Гарон ушел в лес
const int XP_MIS_GrandsonOfFisherman_GoForest_ToldHakon		= 0;	//сказали от этом Хароку (квест окончен)
//
const int XP_MIS_GrandsonOfFisherman_GaronDead	= 0;		//Гарон умер, сообщили об этом Хароку (в любой ветке)


//====================================== РЫБНОЕ ДЕЛО ==============================================//
//Статус: НЕГОТОВ
//Квестодатель: Харок
//Участники: Мария

var int MIS_DS2P_FishingBusiness;
const string TOPIC_DS2P_FishingBusiness = "Рыбное дело_FishingBusiness";

	const string TOPIC_DS2P_FishingBusiness_Start = "Харок попросил меня сходить в солевую пещеру, которую облюбовал выводок шныг. Я должен принести ему 10 мер соли.  Пещера находится /*UNFINISHED(там-то и там-то)*/.";
	const string TOPIC_DS2P_FishingBusiness_SaltGiven = "Я принес Хароку 10 мер соли.";
	const string TOPIC_DS2P_FishingBusiness_AskDelivery = "Рыбак попросил меня отнести бочонок с засоленной рыбой Марии, поварихе. Я могу найти ее в деревне. Она либо готовит в таверне, либо наводит порядок у себя в доме при кузнице.";
	const string TOPIC_DS2P_FishingBusiness_Success = "Я передал рыбу Марии.";
	
const int XP_MIS_FishingBusiness_01 = 0;
const int XP_MIS_FishingBusiness_02 = 0;
const int XP_MIS_FishingBusiness = 0;


//===================================== НЕСЧАСТНЫЙ ЦЕЛИТЕЛЬ ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Цимм
//Участники: Саймон

var int MIS_DS2P_UnhappyHealer;
const string TOPIC_DS2P_UnhappyHealer = "Несчастный целитель_UnhappyHealer";

	const string TOPIC_DS2P_UnhappyHealer_Start = "Алхимик Цимм попросил помочь избавиться от домогательств пирата Саймона, который требует с целителя золото.";
	const string TOPIC_DS2P_UnhappyHealer_SymonCondition = "Саймон говорит, что отстанет от алхимика, если я сумею забрать у гоблинов украденные у пирата деньги.";
	const string TOPIC_DS2P_UnhappyHealer_GobbosNearMill = "Саймон считает, что гоблины скрываются в пещере неподалеку от мельницы.";
/*17.03.2016*/	const string TOPIC_DS2P_UnhappyHealer_PreSuccess = "Я разобрался с гоблинами, и Саймон на радостях отказался от мысли избить Цимма. Надо пойти обрадовать старика.";
/*17.03.2016*/	const string TOPIC_DS2P_UnhappyHealer_PreSuccess_1 = "Кажется, это ублюдок меня обманул... Пойду хоть Цимма порадую.";
/*17.03.2016*/	const string TOPIC_DS2P_UnhappyHealer_PreSuccess_2 = "Какие-то странные вещи говорил этот шут, гоблины научились тратить деньги... Бред. Ну да ладно, можно идти успокаивать Цимма.";
/*17.03.2016*/	const string TOPIC_DS2P_UnhappyHealer_Success = "Пират Саймон больше не побеспокоит Цимма. Теперь я могу рассчитывать на его помощь в решении пролемы с чумой.";	
const int XP_MIS_UnhappyHealer = 0;


//===================================== УЖАС В НОЧИ ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Дил
//Участники: Цимм,

var int MIS_DS2P_TerrorInNight;
const string TOPIC_DS2P_TerrorInNight = "Ужас в ночи_TerrorInNight";

	const string TOPIC_DS2P_TerrorInNight_Start = "В деревне я встретил местного дурачка, Дила. Если верить Цимму, Дил стал таким всего пару лет назад. Случилась какая-то странная история. Парень за одну неделю потерял и отца, и мать, но причина их смерти осталась так и не ясна. После этого в доме Дила начались происходить непонятные вещи – по ночам слышались какие-то стоны, крики, плач. Когда жители деревни решились посмотреть, что же происходит, было уже поздно – Дил повредился рассудком. Единственный, кто заходил в тот злополучный вечер в дом, был кузнец Густав. После посещения этого дома он поседел. На все вопросы о том, что случилось, он отвечал молчанием. Очень странная история...";
	const string TOPIC_DS2P_TerrorInNight_DilsHouseKey = "В доме, в котором жил Дил, теперь обитают какие-то демоны или призраки. Чтобы оградить себя от них, жители деревни решили заколотить окна, а на дверь поставить замок. Ключ, скорее всего, находится у Кадара, старосты деревни.";
	const string TOPIC_DS2P_TerrorInNight_Success = "";
	
const int XP_MIS_TerrorInNight = 0;


//===================================== ВЫБОР ТАМИРА ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Тамир
//Участники: Саймон

var int MIS_DS2P_TamirChoice;
const string TOPIC_DS2P_TamirChoice = "Выбор Тамира_TamirChoice";

	const string TOPIC_DS2P_TamirChoice_Start = "Саймон приказал охотнику Тамиру сходить в лес и принести свежего мяса. Но Тамир слишком горд и не хочет этого делать. Если Тамир не подчинится, то Саймон обещал перерезать горло одной из женщин, которую удерживают в пещере возле деревни.";
	const string TOPIC_DS2P_TamirChoice_HuntTogether = "Я предложил Тамиру вместе поохотиться. Он с удовольствием принял мое предложение.";
	const string TOPIC_DS2P_TamirChoice_WargAttack = "На охоте на нас напала стая варгов. Нам чудом удалось спастись. Пора возвращаться в деревню.";
	const string TOPIC_DS2P_TamirChoice_Meat4Symon = "Тамир попросил отнести мясо Саймону.";
	const string TOPIC_DS2P_TamirChoice_MeatDelivered = "Я отнес мясо Саймону. Нужно сообщить об этом Тамиру.";
	const string TOPIC_DS2P_TamirChoice_Success = "Тамир отблагодарил меня за помощь.";
	
const int XP_MIS_TamirChoice_01 = 0;
const int XP_MIS_TamirChoice_GiveMeat = 0;	//отдали мясо Саймону
const int XP_MIS_TamirChoice_GiveDrink = 0;	//дали Саймону попить
const int XP_MIS_TamirChoice_Success = 0;	//сообщили Тамиру (квест окончен)


//===================================== ОПАСНАЯ ОХОТА ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Барок
//Участники: Тамир

var int MIS_DS2P_DangerousHunting;
const string TOPIC_DS2P_DangerousHunting = "Опасная охота_DangerousHunting";

	const string TOPIC_DS2P_DangerousHunting_Start = "Скотовод Барок попросил меня поохотиться на кроликов. Я должен взять силки у Тамира и отправиться в лес /*туда-то и туда-то*/. Силки лучше расставлять под деревьями. После того, как все будет готово, нужно уйти из леса и подождать несколько часов, а затем проверить результат.";
	const string TOPIC_DS2P_DangerousHunting_SnaresGot = "Силки у меня. Нужно отправиться в лес и установить их.";
	const string TOPIC_DS2P_DangerousHunting_Success = "Оба кролика оказались самцами, но сделка есть сделка.";
	
const int XP_MIS_DangerousHunting = 0;


//===================================== РАЗБИТОЕ СЕРДЦЕ ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Никки
//Участники: Йорн

var int MIS_DS2P_BrokenHeart;
const string TOPIC_DS2P_BrokenHeart = "Разбитое сердце_BrokenHeart";

	const string TOPIC_DS2P_BrokenHeart_Start = "Пират Йорн обесчестил Никки. Она хочет, чтобы я убил его.";
	const string TOPIC_DS2P_BrokenHeart_JornVersion = "Йорн говорит, что Никки сама предложила себя, а когда он согласился, Никки набросилась на него, визжала и царапалась. Кто же из них врет?";
	const string TOPIC_DS2P_BrokenHeart_NikkiRefuse = "Никки все отрицает. Но если предположить, что Никки врет, то есть только одна причина ее поведения – ей нужно было зачем-то проникнуть в пещеру, где держат в плену сельчан. Нужно это выяснить.";
	const string TOPIC_DS2P_BrokenHeart_Success = "Йорн убит. Честь Никки восстановлена.";
	const string TOPIC_DS2P_BrokenHeart_Success2 = "Похоже, Тамир был прав. Никки окончательно тронулась умом.";

const int XP_MIS_BrokenHeart = 0;


//===================================== ДА ТЫ ВЕДЬМА! ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Тамир
//Участники: Никки, -Коло

var int MIS_DS2P_YouAreWitch;
const string TOPIC_DS2P_YouAreWitch = "Да ты ведьма!_YouAreWitch";

	const string TOPIC_DS2P_YouAreWitch_Start = "Тамир рассказал мне о Никки странную историю. Он считает ее ведьмой, убившей одного из охотников Коло, который был в нее до безумия влюблен. Все считают, что Коло погиб на охоте.";
	const string TOPIC_DS2P_YouAreWitch_BodySearch = "Я решил найти тело Коло. Тамир говорит, что Коло всегда носил при себе секстант и кольцо отца. Также Тамир считает, что искать следует либо на болоте, либо в пещере крупного хищника, такого как мракорис.";
	const string TOPIC_DS2P_YouAreWitch_Swamp = " /*Redleha: Болото находится там-то и там-то. НАДО ИСПРАВИТЬ*/ ";
	const string TOPIC_DS2P_YouAreWitch_SuccessGuilty = "Тамир был прав, Никки убила Коло. Но в силу сложившейся ситуации с пиратами, провести собрание и наказать убийцу невозможно. Придется оставить все как есть.";
	const string TOPIC_DS2P_YouAreWitch_SuccessInnocent = "Оказывается, Никки не виновата в смерти Коло.";

const int XP_MIS_YouAreWitch_01 = 0;
const int XP_MIS_YouAreWitch_02 = 0;
const int XP_MIS_YouAreWitch = 0;


//===================================== ИНСТРУМЕНТЫ ДЛЯ ХУНО ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Хуно
//Участники: Джозеф

var int MIS_DS2P_Tools4Huno;
const string TOPIC_DS2P_Tools4Huno = "Инструменты для Хуно_Tools4Huno";

	const string TOPIC_DS2P_Tools4Huno_Start = "Пахарь Хуно попросил меня раздобыть для него две новые мотыги и пять серпов. Нужно обратиться к кузнецу Джозефу.";
	const string TOPIC_DS2P_Tools4Huno_JosephWantIronnGold = "Джозеф изготовит серпы и мотыги, если я принесу ему четыре куска железной руды и триста золотых.";
	const string TOPIC_DS2P_Tools4Huno_JosephWorks = "Джозеф приступил к работе. Нужно зайти через пару часов.";
	const string TOPIC_DS2P_Tools4Huno_ToolsGot = "Инструменты у меня, нужно отнести их Хуно.";
	const string TOPIC_DS2P_Tools4Huno_Success = "Я отдал Хуно инструменты.";

const int XP_MIS_Tools4Huno_Ready = 0;	//когда забираем инструменты у кузнеца
const int XP_MIS_Tools4Huno = 0;	//когда отдаем инструменты Хуно


//===================================== КРЕПОСТЬ ДУХА ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: -
//Участники: Цимм

var int MIS_DS2P_Fortitude;
	var int MIS_DS2P_Fortitude_IngredientsKnow;//ГГ узнал какие нужны ингредиенты
	var int MIS_DS2P_Fortitude_IngredientsGotOnce;//собрали нужны ингредиенты
	//бонус от зелья
	const int Bonus_Protect_Cimm = 5;
	const int Bonus_HP_Cimm = 20;

	
const string TOPIC_DS2P_Fortitude = "Крепость духа_Fortitude";
	const string TOPIC_DS2P_Fortitude_Start = "Я нашел яйцо кровяной королевы. Судя по всему, чт оя знаю о ползунах, у этой штуки могут быть полезные свойства. Лучше показать его опытному алхимику.";
	const string TOPIC_DS2P_Fortitude_Potion = "Действительно, Цимм предложил мне изготовить зелье ”Крепость духа”, которое может помочь стать сильным и неуязвимым. Для его приготовляения необходимы рог мракориса, клык варга и сердце голема.";
	const string TOPIC_DS2P_Fortitude_AllIngredients = "Я собрал все ингридиенты для зелья. Пора наведаться к Цимму.";
	const string TOPIC_DS2P_Fortitude_Success = "Я испытал на себе силу зелья. Оно чуть не погубило меня. Но мне удалось выдержать испытание силы духа, и теперь я стал крепче и выносливей.";
	
const int XP_MIS_Fortitude_CrawlerEgg = 0;	//за то, что принесли яйцо королевы
const int XP_MIS_Fortitude = 0;

//===================================== ОРУЖИЕ ДЛЯ БОРЬБЫ ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Мария
//Участники: Густав

var int MIS_DS2P_WeaponsToFight;

const string TOPIC_DS2P_WeaponsToFight = "Оружие для борьбы_WeaponsToFight";
	const string TOPIC_DS2P_WeaponsToFight_Start = "Нужно отнести охотникам, укрывшимся в лесу, часть украденной жителями деревни железной руды, а еще сверток с продуктами и записку от Марии. Без записки они не будут мне доверять.";
	const string TOPIC_DS2P_WeaponsToFight_ = "";
	const string TOPIC_DS2P_WeaponsToFight_Success = "";
const int XP_MIS_WeaponsToFight = 0;


//===================================== АМУЛЕТ ДЛЯ ДЖИНА ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Виола
//Участники: Джин

var int MIS_DS2P_Amulette4Jinn;
const string TOPIC_DS2P_Amulette4Jinn = "Амулет для Джина_Amulette4Jinn";
	const string TOPIC_DS2P_Amulette4Jinn_Start = "Крестьянка Виола, запертая в пещере, попросила передать своему мужу Джину амулет. Джин скрывается где-то в лесах острова вместе с другими мужчинами из деревни.";
const int XP_MIS_Amulette4Jinn = 0;

//=====================================  ===============================================//

