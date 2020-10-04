

//===================================== СТАТУЭТКИ ГУРУНА ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Ба-Ба-По
//Участники: Йорн


var int MIS_DS2P_FigurinesGurun;
const string TOPIC_DS2P_FigurinesGurun = "Статуэтки Гуруна_FigurinesGurun";

//Начало
const string TOPIC_DS2P_FigurinesGurun_Start = "Неподалеку от деревни я встретил гоблина Ба-Ба-По. Он умеет говорить по-человечески и просит помочь ему вернуть драгоценную статуэтку Гуруна, вождя гоблинов. Статуэтку с тела убитого гоблина забрал пират Йорн, который сторожит пещеру с пленниками.";
//Три статуэтки
const string TOPIC_DS2P_FigurinesGurun_ThreeStatues = "Всего есть три статуэтки Гуруна: изумрудная, золотая и серебряная. Йорн забрал изумрудную, которую гоблины только нашли и собирались отнести в свою деревню. Ба-Ба-По верит, что две другие статуэтки спрятаны где-то на острове. Он пообещал большую награду, если я смогу найти и вернуть все три статуэтки.";
//Где
const string TOPIC_DS2P_FigurinesGurun_Where = "Все доступные им места гоблины уже обшарили. На болоте, в лесу и на побережье статуэток точно нет.";
//Изумрудная статуэтка
const string TOPIC_DS2P_FigurinesGurun_EmeraldGot = "Я забрал изумрудную статуэтку у Йорна.";
//Вернул изумрудную
const string TOPIC_DS2P_FigurinesGurun_EmeraldReturned = "Я вернул изумрудную статуэтку Ба-Ба-По. Он назвал меня другом и сказал, что, если я пойду на болото и захочу попасть в их лагерь, я должен сказать, что меня прислал Ба-Ба-По. Тогда охранники не нападут и пропустят внутрь.";
//Серебряная статуэтка
const string TOPIC_DS2P_FigurinesGurun_SilverGot = "Я нашел серебряную статуэтку Гуруна. Неудивительно, что гоблины не смогли найти ее в этих руинах, здесь глубокая вода и много опасностей.";
//Золотая статуэтка
const string TOPIC_DS2P_FigurinesGurun_GoldGot = "Мне удалось найти золотую статуэтку Гуруна. Сколько же лет гоблины искали ее, если она нашлась в этих развалинах?";
//Провален
const string TOPIC_DS2P_FigurinesGurun_Failed_BaBaPoDead = "Ба-Ба-По мертв. Отдавать статуэтки некому.";
//Завершение
const string TOPIC_DS2P_FigurinesGurun_Success = "Я вернул гоблинам все статуэтки Гуруна. Ба-Ба-По с честью вернется в свою деревню.";


const int XP_MIS_FigurinesGurun_EmeraldGot = 500;
const int XP_MIS_FigurinesGurun_SilverGot = 500;
const int XP_MIS_FigurinesGurun_GoldGot = 500;
const int XP_MIS_FigurinesGurun_Success = 2000;

var int MIS_FigurinesGurun_Cnt;
var int MIS_FigurinesGurun_EmeraldReturned;
var int MIS_FigurinesGurun_SilverReturned;
var int MIS_FigurinesGurun_GoldReturned;


//===================================== ПРОХОД В ДЕРЕВНЮ ГОБЛИНОВ ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Ях-Ях
//Участники: три любых болотных акулы

var int MIS_DS2P_EnterGobboVillage;
const string TOPIC_DS2P_EnterGobboVillage = "Проход в деревню гоблинов_EnterGobboVillage";

//Начало	
const string TOPIC_DS2P_EnterGobboVillage_Start = "Я нашел деревню гоблинов на болоте. Вход в деревню охраняет гоблин по имени Ях-Ях. Он не хочет пропускать меня внутрь.";
//Задание	
const string TOPIC_DS2P_EnterGobboVillage_Problem = "Ях-Ях сказал мне убить трех болотных акул неподалеку от деревни и принести их клыки. Тогда он пропустит меня.";
//Три клыка	
const string TOPIC_DS2P_EnterGobboVillage_ThreeTeeth = "У меня есть три клыка болотных акул. Надо отдать их Ях-Яху.";
//Отдал клыки	
const string TOPIC_DS2P_EnterGobboVillage_GaveTeeth = "Я отдал Ях-Яху клыки.";
//За статуэтки	
const string TOPIC_DS2P_EnterGobboVillage_Figurines = "Ба-Ба-По вернулся в деревню и рассказал про мою помощь.";
//Завершение	
const string TOPIC_DS2P_EnterGobboVillage_Success = "Я заслужил доверие гоблинов и теперь могу входить в их деревню.";
//Провален	
const string TOPIC_DS2P_EnterGobboVillage_Failed = "Теперь гоблины уже точно не будут иметь со мной дел.";


const int XP_MIS_EnterGobboVillage_Teeth = 200;
const int XP_MIS_EnterGobboVillage = 500;

const string WP_GobboEntrance_Checkpoint = "DP_FOREST_GOBBOVIL_ENTANCE"; //wp на входе в деревню гоблинов
//UNFINISHED wp/fp спауна трех акул
const string WP_GobboEntrance_Shark1 = "DP_FOREST_SWAMP_TO_TELEPORT_01";
const string WP_GobboEntrance_Shark2 = "DP_FOREST_SWAMP_TO_FARSIDE_02_MONSTER_01";
const string WP_GobboEntrance_Shark3 = "DP_FOREST_SWAMP_TO_FARSIDE_02_MONSTER_02";

var int MIS_DS2P_EnterGobboVillage_SharkTeeth; //взяли задание на зубы акулы
var int Gobbos_Attitude; //отношение гоблинов к ГГ
	const int Gobbos_Attitude_None = 0; //стартовое - большинство атакует, по AIV_EnemyOverride разговаривают
	const int Gobbos_Attitude_Gobbo = 2; //ГГ - стал одним из гоблинов
	const int Gobbos_Attitude_Friendly = 1; //ГГ - друг, можно свободно ходить по лагерю и со всеми разговаривать
	const int Gobbos_Attitude_Angry = -1; //ГГ - изгнанник, с ним не разговаривают, но и не нападают
	const int Gobbos_Attitude_Hostile = -2; //ГГ - враг, атакуют все, даже квестовые


//===================================== ДОВЕРИЕ ВОЖДЯ ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Ца-Ха-Наух
//Участники: Ба-Ба-По, Ра-Да-По, Ку-Ла, Ях-Ях, Джа-Аф-Фар


var int MIS_DS2P_GobboChiefTrust;
const string TOPIC_DS2P_GobboChiefTrust = "Доверие вождя_GobboChiefTrust";

//Начало
const string TOPIC_DS2P_GobboChiefTrust_Start = "Вождь деревни гоблинов Ца-Ха-Наух не доверяет мне. Он сказал мне походить по поселению и помочь другим гоблинам, тогда он станет лучше ко мне относиться.";
//История вождя
const string TOPIC_DS2P_GobboChiefTrust_ChiefStory = "У вождя есть причина ненавидеть людей - охотники убили его единственного сына. Мне придется приложить много усилий, чтобы переменить его мнение.";
//Болотожоры
const string TOPIC_DS2P_GobboChiefTrust_SwampSharks = "Я убил болотных акул, нападавших на деревню.";
//Статуэтки
const string TOPIC_DS2P_GobboChiefTrust_Figurines = "Я раздобыл статуэтки Гуруна, которые гоблины потеряли давным-давно.";
//Волк
const string TOPIC_DS2P_GobboChiefTrust_Wolf = "Я нашел потерявшегося ручного волка и вернул хозяину.";
//Мука
const string TOPIC_DS2P_GobboChiefTrust_Flour = "Я помог добыть мешок муки и спас гоблинов от голода.";
//Таблички
const string TOPIC_DS2P_GobboChiefTrust_Plates = "Я отнес каменные таблички Экору.";
//Завершение
const string TOPIC_DS2P_GobboChiefTrust_Success = "Теперь вождь племени Ца-Ха-Наух верит мне.";


const int XP_MIS_GobboChiefTrust_Hello = 100; // если правильно поприветствовать
const int XP_MIS_GobboChiefTrust_News = 50;	// за каждую новость
const int XP_MIS_GobboChiefTrust_Success = 1000;


//===================================== КАМЕННЫЕ ТАБЛИЧКИ ДРЕВНИХ ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Ра-Да-По
//Участники: Экор
//Награда: 1) зелье силы; 2) зелье макс. маны, здоровья и 2 зелья маны 100%, либо обучение кругам магии; 3) 150 зол.

var int MIS_DS2P_AncientStonePlates;
const string TOPIC_DS2P_AncientStonePlates = "Каменные таблички древних_AncientStonePlates";

//Начало
const string TOPIC_DS2P_AncientStonePlates_Start = "Шаман гоблинов Ра-Да-По попросил меня передать четыре древние каменные таблички отшельнику Экору, или Од-Ди-Ону, как его зовут гоблины. Таблички чрезвычайно похожи на те, что я приносил Ватрасу на Хоринисе. Экор живет в древней библиотеке на западном краю леса. Правда, шаман утверждает, что пока Экор сам того не захочет, я не смогу с ним поговорить.";
//Отдали таблички
const string TOPIC_DS2P_AncientStonePlates_Delivered = "Я отдал таблички Экору. Надо сказать Ра-Да-По.";
//Завершение
const string TOPIC_DS2P_AncientStonePlates_Success = "Ра-Да-По поблагодарил меня и наградил золотом.";
//Отменен		0


const int XP_MIS_AncientStonePlates_Delivered = 100;
const int XP_MIS_AncientStonePlates_Success = 100;


//===================================== ПРОПАВШИЙ ДРУГ ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Ку-Ла
//Участники: ручной волк Та-Ко-Пи

var int MIS_DS2P_MissingFriend;
const string TOPIC_DS2P_MissingFriend = "Пропавший друг_MissingFriend";

//Начало
const string TOPIC_DS2P_MissingFriend_Start = "Охотник-гоблин Ку-Ла рассказал, что потерял своего друга на последней охоте. Друга зовут Та-Ко-Пи и это волк. Я вызвался поискать его. Надо быть осторожнее - волк не любит чужих. Ему надо сказать: «Чи-ма-ру-та. Ко-ми-га-на-бу», тогда волк поймет, что я свой.";
//Где
const string TOPIC_DS2P_MissingFriend_Where = "Та-Ко-Пи убежал куда-то вглубь болота во время охоты.";
//Нашли
const string TOPIC_DS2P_MissingFriend_Found = "Я нашел волка, осталось только привести его обратно в деревню.";
//Вылечили
const string TOPIC_DS2P_MissingFriend_Healed = "Та-Ко-Пи был ранен. Мне удалось вылечить его.";
//Провален
const string TOPIC_DS2P_MissingFriend_Failed = "Волк погиб. Не думаю, что мне стоит сообщать Ку-Ла об этом.";
//Завершение
const string TOPIC_DS2P_MissingFriend_Success = "Волк вернулся к своему хозяину.";


const int XP_MIS_MissingFriend_Found = 100;
const int XP_MIS_MissingFriend_Success = 1000;

const int XP_MIS_MissingFriend_Healed = 100;//вылечили волка
var int XP_MIS_MissingFriend_Healed_Once; //единоразово! нельзя бить и лечить бесконечно

const string WP_MissingFriend_Wolf = ""; //UNFINISHED wp/fp для спауна волка

var int TaKoPi_Follows;	//следует ли Та-Ко-Пи за игроком в данный момент


//===================================== УШЛЫЙ ВОР ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Джа-Аф-Фар
//Участники: пират, охраняющий мельницу
//Награда: только опыт


var int MIS_DS2P_QuirkyThief;
const string TOPIC_DS2P_QuirkyThief = "Ушлый вор_QuirkyThief";

//Начало
const string TOPIC_DS2P_QuirkyThief_Start = "На болоте мне встретился ушлый гоблин-воришка по имени Джа-Аф-Фар. Не успели познакомиться, а он уже по моим карманам шарит! Надо вернуть свое золото и поскорее.";
//Реванш 1
const string TOPIC_DS2P_QuirkyThief_Revenge1 = "Ха! Ушлый воришка, похоже, и не заметил, как я не только стянул свое золото обратно, но и еще пару его монет прихватил.";
//Раунд 2
const string TOPIC_DS2P_QuirkyThief_Round2 = "Смотри-ка, а мелкий не сдается. Он опять попытался стянуть у меня мое золото.";
//Реванш 2
const string TOPIC_DS2P_QuirkyThief_Revenge2 = "А гоблин этот ловкий - еле вернул свое золото назад.";
//Раунд 3
const string TOPIC_DS2P_QuirkyThief_Round3 = "А он все никак не уймется. Эдак можно продолжать вечно.";
//Реванш 3
const string TOPIC_DS2P_QuirkyThief_Revenge3 = "Мне это стало надоедать. Гоблин ворует у меня, я - у него, и никакого прогресса. Если этот мелкий паршивец еще раз попробует меня обокрасть, то я попросту поколочу его.";
//Лучший вор
const string TOPIC_DS2P_QuirkyThief_BestThief = "Джа-Аф-Фар наконец-то сдался и признал меня лучшим вором. А еще попросил о помощи.";
//Отказались помочь
const string TOPIC_DS2P_QuirkyThief_Refused = "Гоблин попросил меня украсть муку из деревни. Пусть сам с этим разбирается.";
//Согласились помочь
const string TOPIC_DS2P_QuirkyThief_Agreed = "Джа-Аф-Фар хочет украсть мешок муки с мельницы, но пираты поставили там охрану. Мне надо отвлекать внимание охранника, пока гоблин не унесет мешок. На дело пойдем, естественно, ночью. Джа-Аф-Фар будет жать в лесу позади мельницы. Надо бы подготовиться.";
//Отвлекли выпивкой
const string TOPIC_DS2P_QuirkyThief_DistractBooze = "Все прошло как нельзя лучше. После пары бутылок спиртного этот охранник и тролля бы не заметил.";
//Отвлекли магией
const string TOPIC_DS2P_QuirkyThief_DistractMage = "Заклинание сна меня выручило. Охранник и не заметил, как уснул.";
//Отвлекли дракой
const string TOPIC_DS2P_QuirkyThief_DistractFight = "Пришлось применить силу, но вроде бы никто ничего не заметил.";
//Грубая сила
const string TOPIC_DS2P_QuirkyThief_BruteForce = "Пришлось припугнуть маленького воришку, чтобы вернуть свое золото.";
//Провален
const string TOPIC_DS2P_QuirkyThief_Failed = "Воришка Джа-Аф-Фар умер. Больше ему уже ничего не украсть.";
//Завершение
const string TOPIC_DS2P_QuirkyThief_Success = "Джа-Аф-Фар забрал мешок муки. Оказывается, он воровал не для себя, а для всего племени. Некоторым людям бы у него поучиться...";
//Охраны нет
const string TOPIC_DS2P_QuirkyThief_NoGuard = "Охраны на мельнице больше нет. Надо сказать Джа-Аф-Фару.";
//Завершение без охраны
const string TOPIC_DS2P_QuirkyThief_SuccessNoGuard = "Джа-Аф-Фар обрадовался новости. Оказывается, муку он ворует не для себя, а для всего племени. Некоторым людям бы у него поучиться...";


var int MIS_DS2P_QuirkyThief_Sum;	//сколько Джа-Аф-Фар у нас украл
var int MIS_DS2P_QuirkyThief_StealBack;	//ГГ украл свое золото назад
var int MIS_DS2P_QuirkyThief_FlourSteal_Stage;	//отвлекаем охранника
	const int MIS_DS2P_QuirkyThief_FlourSteal_Pre	= 1;	//готовимся идти
	const int MIS_DS2P_QuirkyThief_FlourSteal_GoTo	= 2;	//ведем Джа-Аф-Фара
	const int MIS_DS2P_QuirkyThief_FlourSteal_CameTo	= 3;	//пришли в деревню, надо отвлекать охранника
	const int MIS_DS2P_QuirkyThief_FlourSteal_GuardDown	= 4;	//охранник в отключке
	const int MIS_DS2P_QuirkyThief_FlourSteal_GotIt	= 5;	//Джа-Аф-Фар забрал мешок
	const int MIS_DS2P_QuirkyThief_FlourSteal_GoBack	= 6;	//ведем его обратно
	const int MIS_DS2P_QuirkyThief_FlourSteal_Finished	= 7;	//все готово!
	const int MIS_DS2P_QuirkyThief_FlourSteal_Late	= 8;	//не успели дойти до утра
var int MIS_DS2P_QuirkyThief_GuardMill;	//отвлекаем охранника

const int XP_MIS_QuirkyThief_Revenge1 = 100;
const int XP_MIS_QuirkyThief_Round2 = 200;
const int XP_MIS_QuirkyThief_Round3 = 300;
const int XP_MIS_QuirkyThief_BestThief = 100;
const int XP_MIS_QuirkyThief_DistractBooze = 100;
const int XP_MIS_QuirkyThief_BruteForce = 50;
const int XP_MIS_QuirkyThief_Success = 500;
const int XP_MIS_QuirkyThief_SuccessNoGuard = 200;


//===================================== ГНЕВ ПРЕДКОВ ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: шаман Ра-Да-По
//Участники: вождь Ца-Ха-Наух, черный тролль, орки Рак-Тарак и Ар-Туш, дух предка (берсерк-призрак), безымянные призраки?
//Награда: 1) ГГ принимают в племя гобинов 2) амулет Друг племени 3) если попросить - лечебный корень, 2 лечебных растения, 3 луговых горца



var int MIS_DS2P_FuriousAncestors;
const string TOPIC_DS2P_FuriousAncestors = "Гнев предков_FuriousAncestors";

//Начало
const string TOPIC_DS2P_FuriousAncestors_Start = "Шаману Ра-Да-По требуется помощь с усмирением буйного духа. Духа зовут Ва-До-Ни и он был ";
//Отвар
const string TOPIC_DS2P_FuriousAncestors_Potion = "Ра-Да-По приготовит какой-то отвар, чтобы я смог сражаться с духом.";
//Ингредиенты
const string TOPIC_DS2P_FuriousAncestors_Ingredients = "Для отвара нужно солнечное алоэ, которое, как известно, растет только возле черного тролля, и растение «язык демона», встречается в южной части острова на берегу реки. Возле него, скорее всего, встретятся какие-то огнедышащие твари - крауры.";
//Ограничения
const string TOPIC_DS2P_FuriousAncestors_Restrictions = "Я смогу видеть только духа Ва-До-Ни и только в течение часа. После этого отвар прекратит действие, и я уже никак не смогу защититься от него.";
//Все собрали
const string TOPIC_DS2P_FuriousAncestors_AllGot = "Все ингредиенты собраны. Ра-Да-По велел приходить завтра утром, он все приготовит.";
//Проблемы
const string TOPIC_DS2P_FuriousAncestors_Problems = "Ра-Да-По не смог достать кость предка с кладбища, поскольку оно кишит нежитью. Мне нужно охранять его, пока он ищет кости. На кладбище отдельный вход и выход, и если туда войти, то чтобы выйти придется пройти его насквозь.";
//Достали кость
const string TOPIC_DS2P_FuriousAncestors_BoneGot = "Нам удалось достать кость Ба-До-Ни и выбраться с кладбища. Сейчас Ра-Да-По закончит отвар.";
//Отвар готов
const string TOPIC_DS2P_FuriousAncestors_PotionReady = "Отвар готов. Как только я его выпью, смогу сразиться с духом. Но у меня будет всего час!";
//Дум мертв
const string TOPIC_DS2P_FuriousAncestors_GhostDead = "Теперь дух мертв, окончательно. Интересно: после смерти остается призрак. А если уничтожить и его, что останется?..";
//Завершение
const string TOPIC_DS2P_FuriousAncestors_Success = "Ра-Да-По объявил, что за помощь деревне меня принимают в племя";
//Провален
const string TOPIC_DS2P_FuriousAncestors_Failed = "Я не успел одолеть духа. Кажется, у меня проблемы.";
//Провален шаман погиб
const string TOPIC_DS2P_FuriousAncestors_Failed_RaDaPoDead = "О нет, Ра-Да-По убили! Теперь мне в деревне будут не рады.";

const int XP_MIS_FuriousAncestors_AllGot = 500;
const int XP_MIS_FuriousAncestors_BoneGot = 500;
const int XP_MIS_FuriousAncestors_GhostDead = 500;
const int XP_MIS_FuriousAncestors_Success = 2000;


//================================= ОРК В БЕДЕ ===================================================//
//Статус: НЕГОТОВ
//Квестодатель: Рак-Тарак
//Участники: Ар-Туш, Зедд

//Предусловия: найти орков в лесу. Познаакомиться с Рак-Тараком
//Спросить, что с Ар-Тушем. Собрать травы, купить у Зедда крепкий самогон.
//Завершение: Принести все Рак-Тароку
//Альтернативы: 1) орки умерли
//Награда: орочий топор Краш Даргот

//ZEN: где живут орки (костер, места для сидения и стояния). FP для респауна: 3 лечеб. раст., 2 огн. крап., 7 тем. гриб., 10 сераф.

var int MIS_DS2P_OrcInTrouble;
const string TOPIC_DS2P_OrcInTrouble = "Орк в беде_OrcInTrouble";

//Начало
const string TOPIC_DS2P_OrcInTrouble_Start = "В лесу я встретил двух мирных орков, Рак-Тарока и Ар-Туша. Ар-Туш отравлен ядом шершня, и ему нужно лекарство.";
//Ингредиенты
const string TOPIC_DS2P_OrcInTrouble_Ingredients = "Рак-Тарок попросил меня принести ему компоненты для лекарства: три целебных растения, две огненные крапивы, семь темных грибов, десять ягод серафиса и один очень крепкий самогон, который смог бы переварить только орк. Травы я соберу, а самогон найдется разве что у пиратов.";
//Сроки
const string TOPIC_DS2P_OrcInTrouble_Time = "Мне нужно поторопиться. Ар-Туш не протянет больше двух дней.";
//Целебное зелье
const string TOPIC_DS2P_OrcInTrouble_Potion = "Я дал оркам целебное зелье. Оно может продлить жизнь Ар-Тушу еще на сутки.";
//Цена
const string TOPIC_DS2P_OrcInTrouble_BoozePrice = "Зедд продаст мне крепкий самогон за 100 золотых.";
//Бесплатно
const string TOPIC_DS2P_OrcInTrouble_BoozeFree = "Зедд отдаст мне самогон бесплатно, если я смогу устоять на ногах после одного глотка.";
//Достали самогон
const string TOPIC_DS2P_OrcInTrouble_BoozeGot = "Самогон у меня.";
//Все собрали
const string TOPIC_DS2P_OrcInTrouble_AllGot = "Я собрал все ингредиенты. Бегом к оркам!";
//Завершение
const string TOPIC_DS2P_OrcInTrouble_Success = "Я отдал травы и самогон орку. Он сразу же приступил к лечению. Мне в награду достался орочий топор.";
//Провален
const string TOPIC_DS2P_OrcInTrouble_Failed = "Время вышло! Теперь орка уже не спасти.";
//Рак-Тарок мертв
const string TOPIC_DS2P_OrcInTrouble_RakTarokDead = "Рак-Тарок погиб. Теперь спасать его друга некому.";
//Ар-Туш мертв
const string TOPIC_DS2P_OrcInTrouble_ArTushDead = "Больной орк умер.";

const int XP_MIS_OrcInTrouble_BoozeGot = 200;
const int XP_MIS_OrcInTrouble_Success = 1500;


var int ArTush_Healed;	//Ар-Туш исцелен


//===================================== ЗАЩИТА ДЛЯ МАЛЕНЬКИХ ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Ца-Ха-Наух
//Участники: Рак-Тарак, Ар-Туш
//Награда: меч Гуруна

var int MIS_DS2P_Protection4LittleOnes;
const string TOPIC_DS2P_Protection4LittleOnes = "Защита для маленьких_Protection4LittleOnes";

//Начало
const string TOPIC_DS2P_Protection4LittleOnes_Start = "Вождь племени гоблинов попросил меня разыскать двух орков, прячущихся в лесу, и уговорить их переселиться в деревню, чтобы те оберегали гоблинов от болотных червей.";
//Ар-Туш умер
const string TOPIC_DS2P_Protection4LittleOnes_ArTushDead = "Один из орков погиб. Надо привести в деревню хотя бы второго.";
//Договорились
const string TOPIC_DS2P_Protection4LittleOnes_Agreed = "Орков даже не понадобилось уговаривать. Но придется проводить их до деревни гоблинов.";
//Договорились один
const string TOPIC_DS2P_Protection4LittleOnes_AgreedOne = "Рак-Тарока даже не понадобилось уговаривать. Но придется проводить его до деревни гоблинов.";
//Довели
const string TOPIC_DS2P_Protection4LittleOnes_Arrived = "Я привел орков в деревню.";
//Довели одного
const string TOPIC_DS2P_Protection4LittleOnes_ArrivedOne = "Я привел Рак-Тарака в деревню.";
//Провален
const string TOPIC_DS2P_Protection4LittleOnes_Failed = "Довести орков до деревни не удалось.";
//Завершение
const string TOPIC_DS2P_Protection4LittleOnes_Success = "Теперь у маленького поселения появилась надежная охрана.";

const int XP_MIS_Protection4LittleOnes_Agreed = 100;
const int XP_MIS_Protection4LittleOnes_Arrived = 1000;
const int XP_MIS_Protection4LittleOnes_ArrivedOne = 500;
const int XP_MIS_Protection4LittleOnes_Success = 1000;

var int Orcs_Follow;	//ведем орков в деревню
var int Orcs_Wait;	//орки нас ждут
var int Orcs_CameToGobbos;	//орки пришли в деревню гоблинов

//=====================================  ===============================================//

const string TOPIC_GobboVillage = "Деревня гоблинов";

const string TOPIC_GobboVillage_Where = "На болоте в северо-восточной части острова есть большая деревня гоблинов.";
const string TOPIC_GobboVillage_YahYah = "Ях-Ях охраняет вход в деревню гоблинов.";
const string TOPIC_GobboVillage_TsaHaNauch = "Ца-Ха-Наух - вождь гоблинов.";
const string TOPIC_GobboVillage_RaDaPo = "Ра-Да-По - шаман в деревне гоблинов.";
const string TOPIC_GobboVillage_HelloChief = "Охранник Ях-Ях велел говорить с вождем гоблинов вежливо и сказать ему «Ца-Ха-Наух та-чи- бо, на-ра». Или «Ца-Ха-Наух чи-та-ро, бо-на»?";
const string TOPIC_GobboVillage_RaDaPoNeedsStings = "Шаману Ра-Да-По нужны жала кровавых мух, жвала полевых жуков и луговой горец.";
const string TOPIC_GobboVillage_BecameGobbo = "Меня приняли в племя гоблинов.";
const string TOPIC_GobboVillage_Exile = "Меня изгнали из деревни гоблинов. Теперь никто из гоблинов со мной не заговорит.";
