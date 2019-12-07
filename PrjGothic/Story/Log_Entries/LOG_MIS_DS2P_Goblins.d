

//===================================== СТАТУЭТКИ ГУРУНА ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Ба-Ба-По
//Участники: Йорн


var int MIS_DS2P_FigurinesGurun;
const string TOPIC_DS2P_FigurinesGurun = "Статуэтки Гуруна_FigurinesGurun";

	const string TOPIC_DS2P_FigurinesGurun_Start = "";

const int XP_MIS_FigurinesGurun = 0;

var int MIS_ReturnedStatues_Cnt;


//===================================== ПРОХОД В ДЕРЕВНЮ ГОБЛИНОВ ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Ях-Ях
//Участники: три любых болотных акулы

var int MIS_DS2P_EnterGobboVillage;
const string TOPIC_DS2P_EnterGobboVillage = "Проход в деревню гоблинов_EnterGobboVillage";

	const string TOPIC_DS2P_EnterGobboVillage_Start = "";

const int XP_MIS_EnterGobboVillage = 0;	//убили акул
const int XP_MIS_EnterGobboVillage_Gurun = XP_MIS_EnterGobboVillage / 2; //разрешили пройти за статуэтки Гуруна

const string WP_GobboEntrance_Checkpoint = ""; //UNFINISHED wp на входе в деревню гоблинов
//UNFINISHED wp/fp спауна трех акул
const string WP_GobboEntrance_Shark1 = "";
const string WP_GobboEntrance_Shark2 = "";
const string WP_GobboEntrance_Shark3 = "";

var int MIS_DS2P_EnterGobboVillage_SharkTeeth; //взяли задание на зубы акулы
var int Gobbos_Attitude; //отношение гоблинов к ГГ
	const int Gobbos_Attitude_None = 0; //стартовое - большинство атакует, по AIV_EnemyOverride разговаривают
	const int Gobbos_Attitude_Friendly = 1; //ГГ - друг, можно свободно ходить по лагерю и со всеми разговаривать
	const int Gobbos_Attitude_Hostile = -1; //ГГ - враг, атакуют все, даже квестовые


//===================================== ПРОПАВШИЙ ДРУГ ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Ку-Ла
//Участники: ручной волк Та-Ко-Пи

var int MIS_DS2P_MissingFriend;
const string TOPIC_DS2P_MissingFriend = "Пропавший друг_MissingFriend";

	const string TOPIC_DS2P_MissingFriend_Start = "";

const int XP_MIS_MissingFriend = 0;
const int XP_MIS_MissingFriend_Healed = 100;//вылечили волка
var int XP_MIS_MissingFriend_Healed_Once; //единоразово! нельзя бить и лечить бесконечно

const string WP_MissingFriend_Wolf = ""; //UNFINISHED wp/fp для спауна волка

var int TaKoPi_Follows;	//следует ли Та-Ко-Пи за игроком в данный момент


//===================================== ДОВЕРИЕ ВОЖДЯ ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Ца-Ха-Наух
//Участники: Ба-Ба-По, Ра-Да-По, Ку-Ла, Ях-Ях, Джа-Аф-Фар


var int MIS_DS2P_GobboLeaderTrust;
const string TOPIC_DS2P_GobboLeaderTrust = "Доверие вождя_GobboLeaderTrust";

	const string TOPIC_DS2P_GobboLeaderTrust_Start = "";

const int XP_MIS_GobboLeaderTrust_Success = 0;


//===================================== ЗАЩИТА ДЛЯ МАЛЕНЬКИХ ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Ца-Ха-Наух
//Участники: Рак-Тарак, Ар-Туш
//Награда: меч Гуруна

var int MIS_DS2P_Protection4LittleOnes;
const string TOPIC_DS2P_Protection4LittleOnes = "Защита для маленьких_Protection4LittleOnes";

	const string TOPIC_DS2P_Protection4LittleOnes_Start = "";

const int XP_MIS_Protection4LittleOnes_Success = 0;

var int Orcs_Follow;	//ведем орков в деревню
var int Orcs_Wait;	//орки нас ждут
var int Orcs_CameToGobbos;	//орки пришли в деревню гоблинов


//===================================== КАМЕННЫЕ ТАБЛИЧКИ ДРЕВНИХ ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Ра-Да-По
//Участники: Экор
//Награда: 1) зелье силы; 2) зелье макс. маны, здоровья и 2 зелья маны 100%, либо обучение кругам магии; 3) 150 зол.

var int MIS_DS2P_AncientStonePlates;
const string TOPIC_DS2P_AncientStonePlates = "Каменные таблички древних_AncientStonePlates";

	const string TOPIC_DS2P_AncientStonePlates_Start = "";

const int XP_MIS_AncientStonePlates = 0;

//===================================== УШЛЫЙ ВОР ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: Джа-Аф-Фар
//Участники: пират, охраняющий мельницу
//Награда: только опыт


var int MIS_DS2P_QuirkyThief;
const string TOPIC_DS2P_QuirkyThief = "Ушлый вор_QuirkyThief";

	const string TOPIC_DS2P_QuirkyThief_Start = "";

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

const int XP_MIS_QuirkyThief_Success = 0;	//довели Джа-Аф-Фара с мукой до дома

//===================================== РАЗГНЕВАННЫЕ ПРЕДКИ ===============================================//
//Статус: НЕГОТОВ
//Квестодатель: шаман Ра-Да-По
//Участники: вождь Ца-Ха-Наух, черный тролль, орки Рак-Тарак и Ар-Туш, дух предка (берсерк-призрак), безымянные призраки?
//Награда: 1) ГГ принимают в племя гобинов 2) амулет Друг племени 3) если попросить - лечебный корень, 2 лечебных растения, 3 луговых горца



var int MIS_DS2P_FuriousAncestors;
const string TOPIC_DS2P_FuriousAncestors = "Разгневанные предки_FuriousAncestors";

	const string TOPIC_DS2P_FuriousAncestors_Start = "";

const int XP_MIS_FuriousAncestors = 0;

//=====================================  ===============================================//
