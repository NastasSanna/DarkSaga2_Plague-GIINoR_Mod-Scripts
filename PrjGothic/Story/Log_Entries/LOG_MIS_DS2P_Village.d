

//===================================== ���� ������ ===============================================//
//������: �������
//������������: �����
//���������: �����, �����

var int MIS_DS2P_GrandsonOfFisherman;
const string TOPIC_DS2P_GrandsonOfFisherman = "���� ������_GrandsonOfFisherman";

	const string TOPIC_DS2P_GrandsonOfFisherman_Start = "�� ������ � �������� ������ ������, ������� ���������, ��� ��� ����� ������ ������� ������, ����� ������� �� ���� �������. ����� ����� ������ ������� ����� �����. � ������ ������.";
	const string TOPIC_DS2P_GrandsonOfFisherman_KardarSeen = "����� �����, ��� ������ ������ ������ � ������.";
	const string TOPIC_DS2P_GrandsonOfFisherman_CimmSeen = "�������� ���� ������, ��� ����� ����� ������ ���� ���� �����. ����� ��� ���� � ������� � ��������. ���� ��� ��� ��������� �����. ������ ����� �� �����������.";
	const string TOPIC_DS2P_GrandsonOfFisherman_MariaSeen = "�����������, ������ ������ � ����� � ��������� �������� �� ��, ��� ��� �� ����� �������� �� �������. ����� ��������� ������ �������� ��� �� �����. �����, ���� ���� � ������, ������ �� �������, ������� ����� ��� ������.";
	const string TOPIC_DS2P_GrandsonOfFisherman_Escaped = "�� � ������� ��������� ������, �� ����� �����. ����� ����������, ��� ����� ���� �������, � ������, ����� ����� ������ ������ ���������. ����� ������ ���.";
	const string TOPIC_DS2P_GrandsonOfFisherman_Found = "� ����� ������. �� ����� ������������ ������� ��������, ������������ � �������, � ������������ � ������.";
	const string TOPIC_DS2P_GrandsonOfFisherman_Demon = "������, � ������ ����� �����-�� ����� ������� �����, ������� ����� ����� ������. � ������ ����� � ���������� ��� �����.";
	const string TOPIC_DS2P_GrandsonOfFisherman_Free = "��� ������� ������ ������ �� �������.";
	const string TOPIC_DS2P_GrandsonOfFisherman_JoinPirates = "������, ����� ��� ������, ����� ������ ���� ���� � �� ����� ����� �� �������. ����� �������� ������� �� �����, � ����� �������� ������� ������.";
	const string TOPIC_DS2P_GrandsonOfFisherman_HideInForest = "����� ��������� ���������� � ����, ���� ��� �� �������. ����� �������� �� ���� ������.";
	const string TOPIC_DS2P_GrandsonOfFisherman_SuccessPirat = "� ��������� ������ � ������ ��� �����. ����� ��� ����� �������� ��������. � ��� �������.";
	const string TOPIC_DS2P_GrandsonOfFisherman_SuccessReturned = "��� ������� ������� ������ � ������ ��� � ���� �� �������. � �������� ������� ����� ��� ��� ���� �� ������� � �����������, ������� ��������� � ����� �� ������ ������� ������. ����� � ���� ��������� � ���� ������ ���� � ����� � ���� ������ ����.";
	const string TOPIC_DS2P_GrandsonOfFisherman_SuccessHide = "��� ������� ������ �� �������. � �������� ������� ����� ��� ��� ���� �� ������� � �����������, ������� ��������� � ����� �� ������ ������� ������.";
	const string TOPIC_DS2P_GrandsonOfFisherman_SuccessHunters = "����� �����. ��� ������� ������� ������ ����� ��������� � ���� � �������������� � ��� ��� ����, ����� ������ ���������� �������.\n� �������� ������� ����� ��� ��� ���� �� ������� � �����������, ������� ��������� � ����� �� ������ ������� ������.";
	const string TOPIC_DS2P_GrandsonOfFisherman_FailGaronDead = "��� �� ������� ������ ������.";
	const string TOPIC_DS2P_GrandsonOfFisherman_FailHarokDead = "����� �����.";

const int XP_MIS_GrandsonOfFisherman_01 = 0;
const int XP_MIS_GrandsonOfFisherman_AskedKarah		= 0;	//�������� ������ ��� ������ � �������
const int XP_MIS_GrandsonOfFisherman_KilledDeamon	= 0;	//����� �������� ��������� � ���������� �� ���� ������
//����� - �����
const int XP_MIS_GrandsonOfFisherman_Pirat			= 0;	//�������, ��� ������ ���� �������
const int XP_MIS_GrandsonOfFisherman_IsPirat		= 0;	//������ ��������� � ������, �� ���������������� ��� ������
const int XP_MIS_GrandsonOfFisherman_Pirat_ToldHakon	= 0;	//������� �� ���� ������ (����� �������)
//����� - ��������� � ����
const int XP_MIS_GrandsonOfFisherman_GoHome			= 0;	//����� �������� � ����
const int XP_MIS_GrandsonOfFisherman_HomeAllAlive	= 0;	//��� ������, ����� ��� ����������
const int XP_MIS_GrandsonOfFisherman_HomeHakonDead	= 0;	//����� �����, �� ������ ����� ������
const int XP_MIS_GrandsonOfFisherman_HomeAllAlive2	= 0;	//��� ������, ����� ��� ���������� (����� �������)
//����� - ��� �������
const int XP_MIS_GrandsonOfFisherman_GoForest		= 0;	//����� ���� � ���
const int XP_MIS_GrandsonOfFisherman_GoForest_ToldHakon		= 0;	//������� �� ���� ������ (����� �������)
//
const int XP_MIS_GrandsonOfFisherman_GaronDead	= 0;		//����� ����, �������� �� ���� ������ (� ����� �����)


//====================================== ������ ���� ==============================================//
//������: �������
//������������: �����
//���������: �����

var int MIS_DS2P_FishingBusiness;
const string TOPIC_DS2P_FishingBusiness = "������ ����_FishingBusiness";

	const string TOPIC_DS2P_FishingBusiness_Start = "����� �������� ���� ������� � ������� ������, ������� ��������� ������� ����. � ������ �������� ��� 10 ��� ����.  ������ ��������� /*UNFINISHED(���-�� � ���-��)*/.";
	const string TOPIC_DS2P_FishingBusiness_SaltGiven = "� ������ ������ 10 ��� ����.";
	const string TOPIC_DS2P_FishingBusiness_AskDelivery = "����� �������� ���� ������� ������� � ���������� ����� �����, ��������. � ���� ����� �� � �������. ��� ���� ������� � �������, ���� ������� ������� � ���� � ���� ��� �������.";
	const string TOPIC_DS2P_FishingBusiness_Success = "� ������� ���� �����.";
	
const int XP_MIS_FishingBusiness_01 = 0;
const int XP_MIS_FishingBusiness_02 = 0;
const int XP_MIS_FishingBusiness = 0;


//===================================== ���������� �������� ===============================================//
//������: �������
//������������: ����
//���������: ������

var int MIS_DS2P_UnhappyHealer;
const string TOPIC_DS2P_UnhappyHealer = "���������� ��������_UnhappyHealer";

	const string TOPIC_DS2P_UnhappyHealer_Start = "������� ���� �������� ������ ���������� �� ������������� ������ �������, ������� ������� � �������� ������.";
	const string TOPIC_DS2P_UnhappyHealer_SymonCondition = "������ �������, ��� �������� �� ��������, ���� � ����� ������� � �������� ���������� � ������ ������.";
	const string TOPIC_DS2P_UnhappyHealer_GobbosNearMill = "������ �������, ��� ������� ���������� � ������ ���������� �� ��������.";
/*17.03.2016*/	const string TOPIC_DS2P_UnhappyHealer_PreSuccess = "� ���������� � ���������, � ������ �� �������� ��������� �� ����� ������ �����. ���� ����� ���������� �������.";
/*17.03.2016*/	const string TOPIC_DS2P_UnhappyHealer_PreSuccess_1 = "�������, ��� ������� ���� �������... ����� ���� ����� �������.";
/*17.03.2016*/	const string TOPIC_DS2P_UnhappyHealer_PreSuccess_2 = "�����-�� �������� ���� ������� ���� ���, ������� ��������� ������� ������... ����. �� �� �����, ����� ���� ����������� �����.";
/*17.03.2016*/	const string TOPIC_DS2P_UnhappyHealer_Success = "����� ������ ������ �� ����������� �����. ������ � ���� ������������ �� ��� ������ � ������� ������� � �����.";	
const int XP_MIS_UnhappyHealer = 0;


//===================================== ���� � ���� ===============================================//
//������: �������
//������������: ���
//���������: ����,

var int MIS_DS2P_TerrorInNight;
const string TOPIC_DS2P_TerrorInNight = "���� � ����_TerrorInNight";

	const string TOPIC_DS2P_TerrorInNight_Start = "� ������� � �������� �������� �������, ����. ���� ������ �����, ��� ���� ����� ����� ���� ��� �����. ��������� �����-�� �������� �������. ������ �� ���� ������ ������� � ����, � ����, �� ������� �� ������ �������� ��� � �� ����. ����� ����� � ���� ���� �������� ����������� ���������� ���� � �� ����� ��������� �����-�� �����, �����, ����. ����� ������ ������� �������� ����������, ��� �� ����������, ���� ��� ������ � ��� ���������� ���������. ������������, ��� ������� � ��� ����������� ����� � ���, ��� ������ ������. ����� ��������� ����� ���� �� �������. �� ��� ������� � ���, ��� ���������, �� ������� ���������. ����� �������� �������...";
	const string TOPIC_DS2P_TerrorInNight_DilsHouseKey = "� ����, � ������� ��� ���, ������ ������� �����-�� ������ ��� ��������. ����� �������� ���� �� ���, ������ ������� ������ ���������� ����, � �� ����� ��������� �����. ����, ������ �����, ��������� � ������, �������� �������.";
	const string TOPIC_DS2P_TerrorInNight_Success = "";
	
const int XP_MIS_TerrorInNight = 0;


//===================================== ����� ������ ===============================================//
//������: �������
//������������: �����
//���������: ������

var int MIS_DS2P_TamirChoice;
const string TOPIC_DS2P_TamirChoice = "����� ������_TamirChoice";

	const string TOPIC_DS2P_TamirChoice_Start = "������ �������� �������� ������ ������� � ��� � �������� ������� ����. �� ����� ������� ���� � �� ����� ����� ������. ���� ����� �� ����������, �� ������ ������ ���������� ����� ����� �� ������, ������� ���������� � ������ ����� �������.";
	const string TOPIC_DS2P_TamirChoice_HuntTogether = "� ��������� ������ ������ �����������. �� � ������������� ������ ��� �����������.";
	const string TOPIC_DS2P_TamirChoice_WargAttack = "�� ����� �� ��� ������ ���� ������. ��� ����� ������� ��������. ���� ������������ � �������.";
	const string TOPIC_DS2P_TamirChoice_Meat4Symon = "����� �������� ������� ���� �������.";
	const string TOPIC_DS2P_TamirChoice_MeatDelivered = "� ����� ���� �������. ����� �������� �� ���� ������.";
	const string TOPIC_DS2P_TamirChoice_Success = "����� ������������ ���� �� ������.";
	
const int XP_MIS_TamirChoice_01 = 0;
const int XP_MIS_TamirChoice_GiveMeat = 0;	//������ ���� �������
const int XP_MIS_TamirChoice_GiveDrink = 0;	//���� ������� ������
const int XP_MIS_TamirChoice_Success = 0;	//�������� ������ (����� �������)


//===================================== ������� ����� ===============================================//
//������: �������
//������������: �����
//���������: �����

var int MIS_DS2P_DangerousHunting;
const string TOPIC_DS2P_DangerousHunting = "������� �����_DangerousHunting";

	const string TOPIC_DS2P_DangerousHunting_Start = "�������� ����� �������� ���� ����������� �� ��������. � ������ ����� ����� � ������ � ����������� � ��� /*����-�� � ����-��*/. ����� ����� ����������� ��� ���������. ����� ����, ��� ��� ����� ������, ����� ���� �� ���� � ��������� ��������� �����, � ����� ��������� ���������.";
	const string TOPIC_DS2P_DangerousHunting_SnaresGot = "����� � ����. ����� ����������� � ��� � ���������� ��.";
	const string TOPIC_DS2P_DangerousHunting_Success = "��� ������� ��������� �������, �� ������ ���� ������.";
	
const int XP_MIS_DangerousHunting = 0;


//===================================== �������� ������ ===============================================//
//������: �������
//������������: �����
//���������: ����

var int MIS_DS2P_BrokenHeart;
const string TOPIC_DS2P_BrokenHeart = "�������� ������_BrokenHeart";

	const string TOPIC_DS2P_BrokenHeart_Start = "����� ���� ���������� �����. ��� �����, ����� � ���� ���.";
	const string TOPIC_DS2P_BrokenHeart_JornVersion = "���� �������, ��� ����� ���� ���������� ����, � ����� �� ����������, ����� ����������� �� ����, ������� � ����������. ��� �� �� ��� ����?";
	const string TOPIC_DS2P_BrokenHeart_NikkiRefuse = "����� ��� ��������. �� ���� ������������, ��� ����� ����, �� ���� ������ ���� ������� �� ��������� � �� ����� ���� �����-�� ���������� � ������, ��� ������ � ����� �������. ����� ��� ��������.";
	const string TOPIC_DS2P_BrokenHeart_Success = "���� ����. ����� ����� �������������.";
	const string TOPIC_DS2P_BrokenHeart_Success2 = "������, ����� ��� ����. ����� ������������ ��������� ����.";

const int XP_MIS_BrokenHeart = 0;


//===================================== �� �� ������! ===============================================//
//������: �������
//������������: �����
//���������: �����, -����

var int MIS_DS2P_YouAreWitch;
const string TOPIC_DS2P_YouAreWitch = "�� �� ������!_YouAreWitch";

	const string TOPIC_DS2P_YouAreWitch_Start = "����� ��������� ��� � ����� �������� �������. �� ������� �� �������, ������� ������ �� ��������� ����, ������� ��� � ��� �� ������� �������. ��� �������, ��� ���� ����� �� �����.";
	const string TOPIC_DS2P_YouAreWitch_BodySearch = "� ����� ����� ���� ����. ����� �������, ��� ���� ������ ����� ��� ���� �������� � ������ ����. ����� ����� �������, ��� ������ ������� ���� �� ������, ���� � ������ �������� �������, ������ ��� ��������.";
	const string TOPIC_DS2P_YouAreWitch_Swamp = " /*Redleha: ������ ��������� ���-�� � ���-��. ���� ���������*/ ";
	const string TOPIC_DS2P_YouAreWitch_SuccessGuilty = "����� ��� ����, ����� ����� ����. �� � ���� ����������� �������� � ��������, �������� �������� � �������� ������ ����������. �������� �������� ��� ��� ����.";
	const string TOPIC_DS2P_YouAreWitch_SuccessInnocent = "�����������, ����� �� �������� � ������ ����.";

const int XP_MIS_YouAreWitch_01 = 0;
const int XP_MIS_YouAreWitch_02 = 0;
const int XP_MIS_YouAreWitch = 0;


//===================================== ����������� ��� ���� ===============================================//
//������: �������
//������������: ����
//���������: ������

var int MIS_DS2P_Tools4Huno;
const string TOPIC_DS2P_Tools4Huno = "����������� ��� ����_Tools4Huno";

	const string TOPIC_DS2P_Tools4Huno_Start = "������ ���� �������� ���� ��������� ��� ���� ��� ����� ������ � ���� ������. ����� ���������� � ������� �������.";
	const string TOPIC_DS2P_Tools4Huno_JosephWantIronnGold = "������ ��������� ����� � ������, ���� � ������� ��� ������ ����� �������� ���� � ������ �������.";
	const string TOPIC_DS2P_Tools4Huno_JosephWorks = "������ ��������� � ������. ����� ����� ����� ���� �����.";
	const string TOPIC_DS2P_Tools4Huno_ToolsGot = "����������� � ����, ����� ������� �� ����.";
	const string TOPIC_DS2P_Tools4Huno_Success = "� ����� ���� �����������.";

const int XP_MIS_Tools4Huno_Ready = 0;	//����� �������� ����������� � �������
const int XP_MIS_Tools4Huno = 0;	//����� ������ ����������� ����


//===================================== �������� ���� ===============================================//
//������: �������
//������������: -
//���������: ����

var int MIS_DS2P_Fortitude;
	var int MIS_DS2P_Fortitude_IngredientsKnow;//�� ����� ����� ����� �����������
	var int MIS_DS2P_Fortitude_IngredientsGotOnce;//������� ����� �����������
	//����� �� �����
	const int Bonus_Protect_Cimm = 5;
	const int Bonus_HP_Cimm = 20;

	
const string TOPIC_DS2P_Fortitude = "�������� ����_Fortitude";
	const string TOPIC_DS2P_Fortitude_Start = "� ����� ���� �������� ��������. ���� �� �����, �� �� ���� � ��������, � ���� ����� ����� ���� �������� ��������. ����� �������� ��� �������� ��������.";
	const string TOPIC_DS2P_Fortitude_Potion = "�������������, ���� ��������� ��� ���������� ����� ��������� �����, ������� ����� ������ ����� ������� � ����������. ��� ��� �������������� ���������� ��� ���������, ���� ����� � ������ ������.";
	const string TOPIC_DS2P_Fortitude_AllIngredients = "� ������ ��� ����������� ��� �����. ���� ���������� � �����.";
	const string TOPIC_DS2P_Fortitude_Success = "� ������� �� ���� ���� �����. ��� ���� �� �������� ����. �� ��� ������� ��������� ��������� ���� ����, � ������ � ���� ������ � ����������.";
	
const int XP_MIS_Fortitude_CrawlerEgg = 0;	//�� ��, ��� �������� ���� ��������
const int XP_MIS_Fortitude = 0;

//===================================== ������ ��� ������ ===============================================//
//������: �������
//������������: �����
//���������: ������

var int MIS_DS2P_WeaponsToFight;

const string TOPIC_DS2P_WeaponsToFight = "������ ��� ������_WeaponsToFight";
	const string TOPIC_DS2P_WeaponsToFight_Start = "����� ������� ���������, ���������� � ����, ����� ���������� �������� ������� �������� ����, � ��� ������� � ���������� � ������� �� �����. ��� ������� ��� �� ����� ��� ��������.";
	const string TOPIC_DS2P_WeaponsToFight_ = "";
	const string TOPIC_DS2P_WeaponsToFight_Success = "";
const int XP_MIS_WeaponsToFight = 0;


//===================================== ������ ��� ����� ===============================================//
//������: �������
//������������: �����
//���������: ����

var int MIS_DS2P_Amulette4Jinn;
const string TOPIC_DS2P_Amulette4Jinn = "������ ��� �����_Amulette4Jinn";
	const string TOPIC_DS2P_Amulette4Jinn_Start = "���������� �����, �������� � ������, ��������� �������� ������ ���� ����� ������. ���� ���������� ���-�� � ����� ������� ������ � ������� ��������� �� �������.";
const int XP_MIS_Amulette4Jinn = 0;

//=====================================  ===============================================//

