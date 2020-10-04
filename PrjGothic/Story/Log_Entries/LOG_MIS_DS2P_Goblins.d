

//===================================== ��������� ������ ===============================================//
//������: �������
//������������: ��-��-��
//���������: ����


var int MIS_DS2P_FigurinesGurun;
const string TOPIC_DS2P_FigurinesGurun = "��������� ������_FigurinesGurun";

//������
const string TOPIC_DS2P_FigurinesGurun_Start = "���������� �� ������� � �������� ������� ��-��-��. �� ����� �������� ��-����������� � ������ ������ ��� ������� ����������� ��������� ������, ����� ��������. ��������� � ���� ������� ������� ������ ����� ����, ������� �������� ������ � ����������.";
//��� ���������
const string TOPIC_DS2P_FigurinesGurun_ThreeStatues = "����� ���� ��� ��������� ������: ����������, ������� � ����������. ���� ������ ����������, ������� ������� ������ ����� � ���������� ������� � ���� �������. ��-��-�� �����, ��� ��� ������ ��������� �������� ���-�� �� �������. �� �������� ������� �������, ���� � ����� ����� � ������� ��� ��� ���������.";
//���
const string TOPIC_DS2P_FigurinesGurun_Where = "��� ��������� �� ����� ������� ��� ��������. �� ������, � ���� � �� ��������� ��������� ����� ���.";
//���������� ���������
const string TOPIC_DS2P_FigurinesGurun_EmeraldGot = "� ������ ���������� ��������� � �����.";
//������ ����������
const string TOPIC_DS2P_FigurinesGurun_EmeraldReturned = "� ������ ���������� ��������� ��-��-��. �� ������ ���� ������ � ������, ���, ���� � ����� �� ������ � ������ ������� � �� ������, � ������ �������, ��� ���� ������� ��-��-��. ����� ��������� �� ������� � ��������� ������.";
//���������� ���������
const string TOPIC_DS2P_FigurinesGurun_SilverGot = "� ����� ���������� ��������� ������. �������������, ��� ������� �� ������ ����� �� � ���� ������, ����� �������� ���� � ����� ����������.";
//������� ���������
const string TOPIC_DS2P_FigurinesGurun_GoldGot = "��� ������� ����� ������� ��������� ������. ������� �� ��� ������� ������ ��, ���� ��� ������� � ���� ����������?";
//��������
const string TOPIC_DS2P_FigurinesGurun_Failed_BaBaPoDead = "��-��-�� �����. �������� ��������� ������.";
//����������
const string TOPIC_DS2P_FigurinesGurun_Success = "� ������ �������� ��� ��������� ������. ��-��-�� � ������ �������� � ���� �������.";


const int XP_MIS_FigurinesGurun_EmeraldGot = 500;
const int XP_MIS_FigurinesGurun_SilverGot = 500;
const int XP_MIS_FigurinesGurun_GoldGot = 500;
const int XP_MIS_FigurinesGurun_Success = 2000;

var int MIS_FigurinesGurun_Cnt;
var int MIS_FigurinesGurun_EmeraldReturned;
var int MIS_FigurinesGurun_SilverReturned;
var int MIS_FigurinesGurun_GoldReturned;


//===================================== ������ � ������� �������� ===============================================//
//������: �������
//������������: ��-��
//���������: ��� ����� �������� �����

var int MIS_DS2P_EnterGobboVillage;
const string TOPIC_DS2P_EnterGobboVillage = "������ � ������� ��������_EnterGobboVillage";

//������	
const string TOPIC_DS2P_EnterGobboVillage_Start = "� ����� ������� �������� �� ������. ���� � ������� �������� ������ �� ����� ��-��. �� �� ����� ���������� ���� ������.";
//�������	
const string TOPIC_DS2P_EnterGobboVillage_Problem = "��-�� ������ ��� ����� ���� �������� ���� ���������� �� ������� � �������� �� �����. ����� �� ��������� ����.";
//��� �����	
const string TOPIC_DS2P_EnterGobboVillage_ThreeTeeth = "� ���� ���� ��� ����� �������� ����. ���� ������ �� ��-���.";
//����� �����	
const string TOPIC_DS2P_EnterGobboVillage_GaveTeeth = "� ����� ��-��� �����.";
//�� ���������	
const string TOPIC_DS2P_EnterGobboVillage_Figurines = "��-��-�� �������� � ������� � ��������� ��� ��� ������.";
//����������	
const string TOPIC_DS2P_EnterGobboVillage_Success = "� �������� ������� �������� � ������ ���� ������� � �� �������.";
//��������	
const string TOPIC_DS2P_EnterGobboVillage_Failed = "������ ������� ��� ����� �� ����� ����� �� ���� ���.";


const int XP_MIS_EnterGobboVillage_Teeth = 200;
const int XP_MIS_EnterGobboVillage = 500;

const string WP_GobboEntrance_Checkpoint = "DP_FOREST_GOBBOVIL_ENTANCE"; //wp �� ����� � ������� ��������
//UNFINISHED wp/fp ������ ���� ����
const string WP_GobboEntrance_Shark1 = "DP_FOREST_SWAMP_TO_TELEPORT_01";
const string WP_GobboEntrance_Shark2 = "DP_FOREST_SWAMP_TO_FARSIDE_02_MONSTER_01";
const string WP_GobboEntrance_Shark3 = "DP_FOREST_SWAMP_TO_FARSIDE_02_MONSTER_02";

var int MIS_DS2P_EnterGobboVillage_SharkTeeth; //����� ������� �� ���� �����
var int Gobbos_Attitude; //��������� �������� � ��
	const int Gobbos_Attitude_None = 0; //��������� - ����������� �������, �� AIV_EnemyOverride �������������
	const int Gobbos_Attitude_Gobbo = 2; //�� - ���� ����� �� ��������
	const int Gobbos_Attitude_Friendly = 1; //�� - ����, ����� �������� ������ �� ������ � �� ����� �������������
	const int Gobbos_Attitude_Angry = -1; //�� - ���������, � ��� �� �������������, �� � �� ��������
	const int Gobbos_Attitude_Hostile = -2; //�� - ����, ������� ���, ���� ���������


//===================================== ������� ����� ===============================================//
//������: �������
//������������: ��-��-����
//���������: ��-��-��, ��-��-��, ��-��, ��-��, ���-��-���


var int MIS_DS2P_GobboChiefTrust;
const string TOPIC_DS2P_GobboChiefTrust = "������� �����_GobboChiefTrust";

//������
const string TOPIC_DS2P_GobboChiefTrust_Start = "����� ������� �������� ��-��-���� �� �������� ���. �� ������ ��� �������� �� ��������� � ������ ������ ��������, ����� �� ������ ����� �� ��� ����������.";
//������� �����
const string TOPIC_DS2P_GobboChiefTrust_ChiefStory = "� ����� ���� ������� ���������� ����� - �������� ����� ��� ������������� ����. ��� �������� ��������� ����� ������, ����� ���������� ��� ������.";
//����������
const string TOPIC_DS2P_GobboChiefTrust_SwampSharks = "� ���� �������� ����, ���������� �� �������.";
//���������
const string TOPIC_DS2P_GobboChiefTrust_Figurines = "� �������� ��������� ������, ������� ������� �������� ������-�����.";
//����
const string TOPIC_DS2P_GobboChiefTrust_Wolf = "� ����� ������������� ������� ����� � ������ �������.";
//����
const string TOPIC_DS2P_GobboChiefTrust_Flour = "� ����� ������ ����� ���� � ���� �������� �� ������.";
//��������
const string TOPIC_DS2P_GobboChiefTrust_Plates = "� ����� �������� �������� �����.";
//����������
const string TOPIC_DS2P_GobboChiefTrust_Success = "������ ����� ������� ��-��-���� ����� ���.";


const int XP_MIS_GobboChiefTrust_Hello = 100; // ���� ��������� ����������������
const int XP_MIS_GobboChiefTrust_News = 50;	// �� ������ �������
const int XP_MIS_GobboChiefTrust_Success = 1000;


//===================================== �������� �������� ������� ===============================================//
//������: �������
//������������: ��-��-��
//���������: ����
//�������: 1) ����� ����; 2) ����� ����. ����, �������� � 2 ����� ���� 100%, ���� �������� ������ �����; 3) 150 ���.

var int MIS_DS2P_AncientStonePlates;
const string TOPIC_DS2P_AncientStonePlates = "�������� �������� �������_AncientStonePlates";

//������
const string TOPIC_DS2P_AncientStonePlates_Start = "����� �������� ��-��-�� �������� ���� �������� ������ ������� �������� �������� ���������� �����, ��� ��-��-���, ��� ��� ����� �������. �������� ����������� ������ �� ��, ��� � �������� ������� �� ��������. ���� ����� � ������� ���������� �� �������� ���� ����. ������, ����� ����������, ��� ���� ���� ��� ���� �� �������, � �� ����� � ��� ����������.";
//������ ��������
const string TOPIC_DS2P_AncientStonePlates_Delivered = "� ����� �������� �����. ���� ������� ��-��-��.";
//����������
const string TOPIC_DS2P_AncientStonePlates_Success = "��-��-�� ������������ ���� � �������� �������.";
//�������		0


const int XP_MIS_AncientStonePlates_Delivered = 100;
const int XP_MIS_AncientStonePlates_Success = 100;


//===================================== ��������� ���� ===============================================//
//������: �������
//������������: ��-��
//���������: ������ ���� ��-��-��

var int MIS_DS2P_MissingFriend;
const string TOPIC_DS2P_MissingFriend = "��������� ����_MissingFriend";

//������
const string TOPIC_DS2P_MissingFriend_Start = "�������-������ ��-�� ���������, ��� ������� ������ ����� �� ��������� �����. ����� ����� ��-��-�� � ��� ����. � �������� �������� ���. ���� ���� ���������� - ���� �� ����� �����. ��� ���� �������: ���-��-��-��. ��-��-��-��-��, ����� ���� ������, ��� � ����.";
//���
const string TOPIC_DS2P_MissingFriend_Where = "��-��-�� ������ ����-�� ������ ������ �� ����� �����.";
//�����
const string TOPIC_DS2P_MissingFriend_Found = "� ����� �����, �������� ������ �������� ��� ������� � �������.";
//��������
const string TOPIC_DS2P_MissingFriend_Healed = "��-��-�� ��� �����. ��� ������� �������� ���.";
//��������
const string TOPIC_DS2P_MissingFriend_Failed = "���� �����. �� �����, ��� ��� ����� �������� ��-�� �� ����.";
//����������
const string TOPIC_DS2P_MissingFriend_Success = "���� �������� � ������ �������.";


const int XP_MIS_MissingFriend_Found = 100;
const int XP_MIS_MissingFriend_Success = 1000;

const int XP_MIS_MissingFriend_Healed = 100;//�������� �����
var int XP_MIS_MissingFriend_Healed_Once; //�����������! ������ ���� � ������ ����������

const string WP_MissingFriend_Wolf = ""; //UNFINISHED wp/fp ��� ������ �����

var int TaKoPi_Follows;	//������� �� ��-��-�� �� ������� � ������ ������


//===================================== ����� ��� ===============================================//
//������: �������
//������������: ���-��-���
//���������: �����, ���������� ��������
//�������: ������ ����


var int MIS_DS2P_QuirkyThief;
const string TOPIC_DS2P_QuirkyThief = "����� ���_QuirkyThief";

//������
const string TOPIC_DS2P_QuirkyThief_Start = "�� ������ ��� ���������� ����� ������-������� �� ����� ���-��-���. �� ������ �������������, � �� ��� �� ���� �������� �����! ���� ������� ���� ������ � ��������.";
//������ 1
const string TOPIC_DS2P_QuirkyThief_Revenge1 = "��! ����� �������, ������, � �� �������, ��� � �� ������ ������ ���� ������ �������, �� � ��� ���� ��� ����� ���������.";
//����� 2
const string TOPIC_DS2P_QuirkyThief_Round2 = "������-��, � ������ �� �������. �� ����� ��������� ������� � ���� ��� ������.";
//������ 2
const string TOPIC_DS2P_QuirkyThief_Revenge2 = "� ������ ���� ������ - ��� ������ ���� ������ �����.";
//����� 3
const string TOPIC_DS2P_QuirkyThief_Round3 = "� �� ��� ����� �� �������. ���� ����� ���������� �����.";
//������ 3
const string TOPIC_DS2P_QuirkyThief_Revenge3 = "��� ��� ����� ���������. ������ ������ � ����, � - � ����, � �������� ���������. ���� ���� ������ �������� ��� ��� ��������� ���� ���������, �� � �������� �������� ���.";
//������ ���
const string TOPIC_DS2P_QuirkyThief_BestThief = "���-��-��� �������-�� ������ � ������� ���� ������ �����. � ��� �������� � ������.";
//���������� ������
const string TOPIC_DS2P_QuirkyThief_Refused = "������ �������� ���� ������� ���� �� �������. ����� ��� � ���� �����������.";
//����������� ������
const string TOPIC_DS2P_QuirkyThief_Agreed = "���-��-��� ����� ������� ����� ���� � ��������, �� ������ ��������� ��� ������. ��� ���� ��������� �������� ���������, ���� ������ �� ������ �����. �� ���� ������, �����������, �����. ���-��-��� ����� ���� � ���� ������ ��������. ���� �� �������������.";
//�������� ��������
const string TOPIC_DS2P_QuirkyThief_DistractBooze = "��� ������ ��� ������ �����. ����� ���� ������� ��������� ���� �������� � ������ �� �� �������.";
//�������� ������
const string TOPIC_DS2P_QuirkyThief_DistractMage = "���������� ��� ���� ��������. �������� � �� �������, ��� �����.";
//�������� ������
const string TOPIC_DS2P_QuirkyThief_DistractFight = "�������� ��������� ����, �� ����� �� ����� ������ �� �������.";
//������ ����
const string TOPIC_DS2P_QuirkyThief_BruteForce = "�������� ���������� ���������� �������, ����� ������� ���� ������.";
//��������
const string TOPIC_DS2P_QuirkyThief_Failed = "������� ���-��-��� ����. ������ ��� ��� ������ �� �������.";
//����������
const string TOPIC_DS2P_QuirkyThief_Success = "���-��-��� ������ ����� ����. �����������, �� ������� �� ��� ����, � ��� ����� �������. ��������� ����� �� � ���� ���������...";
//������ ���
const string TOPIC_DS2P_QuirkyThief_NoGuard = "������ �� �������� ������ ���. ���� ������� ���-��-����.";
//���������� ��� ������
const string TOPIC_DS2P_QuirkyThief_SuccessNoGuard = "���-��-��� ����������� �������. �����������, ���� �� ������ �� ��� ����, � ��� ����� �������. ��������� ����� �� � ���� ���������...";


var int MIS_DS2P_QuirkyThief_Sum;	//������� ���-��-��� � ��� �����
var int MIS_DS2P_QuirkyThief_StealBack;	//�� ����� ���� ������ �����
var int MIS_DS2P_QuirkyThief_FlourSteal_Stage;	//��������� ���������
	const int MIS_DS2P_QuirkyThief_FlourSteal_Pre	= 1;	//��������� ����
	const int MIS_DS2P_QuirkyThief_FlourSteal_GoTo	= 2;	//����� ���-��-����
	const int MIS_DS2P_QuirkyThief_FlourSteal_CameTo	= 3;	//������ � �������, ���� ��������� ���������
	const int MIS_DS2P_QuirkyThief_FlourSteal_GuardDown	= 4;	//�������� � ��������
	const int MIS_DS2P_QuirkyThief_FlourSteal_GotIt	= 5;	//���-��-��� ������ �����
	const int MIS_DS2P_QuirkyThief_FlourSteal_GoBack	= 6;	//����� ��� �������
	const int MIS_DS2P_QuirkyThief_FlourSteal_Finished	= 7;	//��� ������!
	const int MIS_DS2P_QuirkyThief_FlourSteal_Late	= 8;	//�� ������ ����� �� ����
var int MIS_DS2P_QuirkyThief_GuardMill;	//��������� ���������

const int XP_MIS_QuirkyThief_Revenge1 = 100;
const int XP_MIS_QuirkyThief_Round2 = 200;
const int XP_MIS_QuirkyThief_Round3 = 300;
const int XP_MIS_QuirkyThief_BestThief = 100;
const int XP_MIS_QuirkyThief_DistractBooze = 100;
const int XP_MIS_QuirkyThief_BruteForce = 50;
const int XP_MIS_QuirkyThief_Success = 500;
const int XP_MIS_QuirkyThief_SuccessNoGuard = 200;


//===================================== ���� ������� ===============================================//
//������: �������
//������������: ����� ��-��-��
//���������: ����� ��-��-����, ������ ������, ���� ���-����� � ��-���, ��� ������ (�������-�������), ���������� ��������?
//�������: 1) �� ��������� � ����� ������� 2) ������ ���� ������� 3) ���� ��������� - �������� ������, 2 �������� ��������, 3 ������� �����



var int MIS_DS2P_FuriousAncestors;
const string TOPIC_DS2P_FuriousAncestors = "���� �������_FuriousAncestors";

//������
const string TOPIC_DS2P_FuriousAncestors_Start = "������ ��-��-�� ��������� ������ � ���������� ������� ����. ���� ����� ��-��-�� � �� ��� ";
//�����
const string TOPIC_DS2P_FuriousAncestors_Potion = "��-��-�� ���������� �����-�� �����, ����� � ���� ��������� � �����.";
//�����������
const string TOPIC_DS2P_FuriousAncestors_Ingredients = "��� ������ ����� ��������� ����, �������, ��� ��������, ������ ������ ����� ������� ������, � �������� ����� ������, ����������� � ����� ����� ������� �� ������ ����. ����� ����, ������ �����, ���������� �����-�� ����������� ����� - ������.";
//�����������
const string TOPIC_DS2P_FuriousAncestors_Restrictions = "� ����� ������ ������ ���� ��-��-�� � ������ � ������� ����. ����� ����� ����� ��������� ��������, � � ��� ����� �� ����� ���������� �� ����.";
//��� �������
const string TOPIC_DS2P_FuriousAncestors_AllGot = "��� ����������� �������. ��-��-�� ����� ��������� ������ �����, �� ��� ����������.";
//��������
const string TOPIC_DS2P_FuriousAncestors_Problems = "��-��-�� �� ���� ������� ����� ������ � ��������, ��������� ��� ����� �������. ��� ����� �������� ���, ���� �� ���� �����. �� �������� ��������� ���� � �����, � ���� ���� �����, �� ����� ����� �������� ������ ��� ��������.";
//������� �����
const string TOPIC_DS2P_FuriousAncestors_BoneGot = "��� ������� ������� ����� ��-��-�� � ��������� � ��������. ������ ��-��-�� �������� �����.";
//����� �����
const string TOPIC_DS2P_FuriousAncestors_PotionReady = "����� �����. ��� ������ � ��� �����, ����� ��������� � �����. �� � ���� ����� ����� ���!";
//��� �����
const string TOPIC_DS2P_FuriousAncestors_GhostDead = "������ ��� �����, ������������. ���������: ����� ������ �������� �������. � ���� ���������� � ���, ��� ���������?..";
//����������
const string TOPIC_DS2P_FuriousAncestors_Success = "��-��-�� �������, ��� �� ������ ������� ���� ��������� � �����";
//��������
const string TOPIC_DS2P_FuriousAncestors_Failed = "� �� ����� ������� ����. �������, � ���� ��������.";
//�������� ����� �����
const string TOPIC_DS2P_FuriousAncestors_Failed_RaDaPoDead = "� ���, ��-��-�� �����! ������ ��� � ������� ����� �� ����.";

const int XP_MIS_FuriousAncestors_AllGot = 500;
const int XP_MIS_FuriousAncestors_BoneGot = 500;
const int XP_MIS_FuriousAncestors_GhostDead = 500;
const int XP_MIS_FuriousAncestors_Success = 2000;


//================================= ��� � ���� ===================================================//
//������: �������
//������������: ���-�����
//���������: ��-���, ����

//�����������: ����� ����� � ����. �������������� � ���-�������
//��������, ��� � ��-�����. ������� �����, ������ � ����� ������� �������.
//����������: �������� ��� ���-������
//������������: 1) ���� ������
//�������: ������ ����� ���� ������

//ZEN: ��� ����� ���� (������, ����� ��� ������� � �������). FP ��� ��������: 3 �����. ����., 2 ���. ����., 7 ���. ����., 10 �����.

var int MIS_DS2P_OrcInTrouble;
const string TOPIC_DS2P_OrcInTrouble = "��� � ����_OrcInTrouble";

//������
const string TOPIC_DS2P_OrcInTrouble_Start = "� ���� � �������� ���� ������ �����, ���-������ � ��-����. ��-��� �������� ���� ������, � ��� ����� ���������.";
//�����������
const string TOPIC_DS2P_OrcInTrouble_Ingredients = "���-����� �������� ���� �������� ��� ���������� ��� ���������: ��� �������� ��������, ��� �������� �������, ���� ������ ������, ������ ���� �������� � ���� ����� ������� �������, ������� ���� �� ���������� ������ ���. ����� � ������, � ������� �������� ����� ��� � �������.";
//�����
const string TOPIC_DS2P_OrcInTrouble_Time = "��� ����� ������������. ��-��� �� �������� ������ ���� ����.";
//�������� �����
const string TOPIC_DS2P_OrcInTrouble_Potion = "� ��� ����� �������� �����. ��� ����� �������� ����� ��-���� ��� �� �����.";
//����
const string TOPIC_DS2P_OrcInTrouble_BoozePrice = "���� ������� ��� ������� ������� �� 100 �������.";
//���������
const string TOPIC_DS2P_OrcInTrouble_BoozeFree = "���� ������ ��� ������� ���������, ���� � ����� ������� �� ����� ����� ������ ������.";
//������� �������
const string TOPIC_DS2P_OrcInTrouble_BoozeGot = "������� � ����.";
//��� �������
const string TOPIC_DS2P_OrcInTrouble_AllGot = "� ������ ��� �����������. ����� � �����!";
//����������
const string TOPIC_DS2P_OrcInTrouble_Success = "� ����� ����� � ������� ����. �� ����� �� ��������� � �������. ��� � ������� �������� ������ �����.";
//��������
const string TOPIC_DS2P_OrcInTrouble_Failed = "����� �����! ������ ���� ��� �� ������.";
//���-����� �����
const string TOPIC_DS2P_OrcInTrouble_RakTarokDead = "���-����� �����. ������ ������� ��� ����� ������.";
//��-��� �����
const string TOPIC_DS2P_OrcInTrouble_ArTushDead = "������� ��� ����.";

const int XP_MIS_OrcInTrouble_BoozeGot = 200;
const int XP_MIS_OrcInTrouble_Success = 1500;


var int ArTush_Healed;	//��-��� �������


//===================================== ������ ��� ��������� ===============================================//
//������: �������
//������������: ��-��-����
//���������: ���-�����, ��-���
//�������: ��� ������

var int MIS_DS2P_Protection4LittleOnes;
const string TOPIC_DS2P_Protection4LittleOnes = "������ ��� ���������_Protection4LittleOnes";

//������
const string TOPIC_DS2P_Protection4LittleOnes_Start = "����� ������� �������� �������� ���� ��������� ���� �����, ���������� � ����, � ��������� �� ������������ � �������, ����� �� ��������� �������� �� �������� ������.";
//��-��� ����
const string TOPIC_DS2P_Protection4LittleOnes_ArTushDead = "���� �� ����� �����. ���� �������� � ������� ���� �� �������.";
//������������
const string TOPIC_DS2P_Protection4LittleOnes_Agreed = "����� ���� �� ������������ �����������. �� �������� ��������� �� �� ������� ��������.";
//������������ ����
const string TOPIC_DS2P_Protection4LittleOnes_AgreedOne = "���-������ ���� �� ������������ �����������. �� �������� ��������� ��� �� ������� ��������.";
//������
const string TOPIC_DS2P_Protection4LittleOnes_Arrived = "� ������ ����� � �������.";
//������ ������
const string TOPIC_DS2P_Protection4LittleOnes_ArrivedOne = "� ������ ���-������ � �������.";
//��������
const string TOPIC_DS2P_Protection4LittleOnes_Failed = "������� ����� �� ������� �� �������.";
//����������
const string TOPIC_DS2P_Protection4LittleOnes_Success = "������ � ���������� ��������� ��������� �������� ������.";

const int XP_MIS_Protection4LittleOnes_Agreed = 100;
const int XP_MIS_Protection4LittleOnes_Arrived = 1000;
const int XP_MIS_Protection4LittleOnes_ArrivedOne = 500;
const int XP_MIS_Protection4LittleOnes_Success = 1000;

var int Orcs_Follow;	//����� ����� � �������
var int Orcs_Wait;	//���� ��� ����
var int Orcs_CameToGobbos;	//���� ������ � ������� ��������

//=====================================  ===============================================//

const string TOPIC_GobboVillage = "������� ��������";

const string TOPIC_GobboVillage_Where = "�� ������ � ������-��������� ����� ������� ���� ������� ������� ��������.";
const string TOPIC_GobboVillage_YahYah = "��-�� �������� ���� � ������� ��������.";
const string TOPIC_GobboVillage_TsaHaNauch = "��-��-���� - ����� ��������.";
const string TOPIC_GobboVillage_RaDaPo = "��-��-�� - ����� � ������� ��������.";
const string TOPIC_GobboVillage_HelloChief = "�������� ��-�� ����� �������� � ������ �������� ������� � ������� ��� ���-��-���� ��-��- ��, ��-��. ��� ���-��-���� ��-��-��, ��-��?";
const string TOPIC_GobboVillage_RaDaPoNeedsStings = "������ ��-��-�� ����� ���� �������� ���, ����� ������� ����� � ������� �����.";
const string TOPIC_GobboVillage_BecameGobbo = "���� ������� � ����� ��������.";
const string TOPIC_GobboVillage_Exile = "���� ������� �� ������� ��������. ������ ����� �� �������� �� ���� �� ���������.";
