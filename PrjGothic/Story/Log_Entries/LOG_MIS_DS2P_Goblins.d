

//===================================== ��������� ������ ===============================================//
//������: �������
//������������: ��-��-��
//���������: ����


var int MIS_DS2P_FigurinesGurun;
const string TOPIC_DS2P_FigurinesGurun = "��������� ������_FigurinesGurun";

	const string TOPIC_DS2P_FigurinesGurun_Start = "";

const int XP_MIS_FigurinesGurun = 0;

var int MIS_ReturnedStatues_Cnt;


//===================================== ������ � ������� �������� ===============================================//
//������: �������
//������������: ��-��
//���������: ��� ����� �������� �����

var int MIS_DS2P_EnterGobboVillage;
const string TOPIC_DS2P_EnterGobboVillage = "������ � ������� ��������_EnterGobboVillage";

	const string TOPIC_DS2P_EnterGobboVillage_Start = "";

const int XP_MIS_EnterGobboVillage = 0;	//����� ����
const int XP_MIS_EnterGobboVillage_Gurun = XP_MIS_EnterGobboVillage / 2; //��������� ������ �� ��������� ������

const string WP_GobboEntrance_Checkpoint = ""; //UNFINISHED wp �� ����� � ������� ��������
//UNFINISHED wp/fp ������ ���� ����
const string WP_GobboEntrance_Shark1 = "";
const string WP_GobboEntrance_Shark2 = "";
const string WP_GobboEntrance_Shark3 = "";

var int MIS_DS2P_EnterGobboVillage_SharkTeeth; //����� ������� �� ���� �����
var int Gobbos_Attitude; //��������� �������� � ��
	const int Gobbos_Attitude_None = 0; //��������� - ����������� �������, �� AIV_EnemyOverride �������������
	const int Gobbos_Attitude_Friendly = 1; //�� - ����, ����� �������� ������ �� ������ � �� ����� �������������
	const int Gobbos_Attitude_Hostile = -1; //�� - ����, ������� ���, ���� ���������


//===================================== ��������� ���� ===============================================//
//������: �������
//������������: ��-��
//���������: ������ ���� ��-��-��

var int MIS_DS2P_MissingFriend;
const string TOPIC_DS2P_MissingFriend = "��������� ����_MissingFriend";

	const string TOPIC_DS2P_MissingFriend_Start = "";

const int XP_MIS_MissingFriend = 0;
const int XP_MIS_MissingFriend_Healed = 100;//�������� �����
var int XP_MIS_MissingFriend_Healed_Once; //�����������! ������ ���� � ������ ����������

const string WP_MissingFriend_Wolf = ""; //UNFINISHED wp/fp ��� ������ �����

var int TaKoPi_Follows;	//������� �� ��-��-�� �� ������� � ������ ������


//===================================== ������� ����� ===============================================//
//������: �������
//������������: ��-��-����
//���������: ��-��-��, ��-��-��, ��-��, ��-��, ���-��-���


var int MIS_DS2P_GobboLeaderTrust;
const string TOPIC_DS2P_GobboLeaderTrust = "������� �����_GobboLeaderTrust";

	const string TOPIC_DS2P_GobboLeaderTrust_Start = "";

const int XP_MIS_GobboLeaderTrust_Success = 0;


//===================================== ������ ��� ��������� ===============================================//
//������: �������
//������������: ��-��-����
//���������: ���-�����, ��-���
//�������: ��� ������

var int MIS_DS2P_Protection4LittleOnes;
const string TOPIC_DS2P_Protection4LittleOnes = "������ ��� ���������_Protection4LittleOnes";

	const string TOPIC_DS2P_Protection4LittleOnes_Start = "";

const int XP_MIS_Protection4LittleOnes_Success = 0;

var int Orcs_Follow;	//����� ����� � �������
var int Orcs_Wait;	//���� ��� ����
var int Orcs_CameToGobbos;	//���� ������ � ������� ��������


//===================================== �������� �������� ������� ===============================================//
//������: �������
//������������: ��-��-��
//���������: ����
//�������: 1) ����� ����; 2) ����� ����. ����, �������� � 2 ����� ���� 100%, ���� �������� ������ �����; 3) 150 ���.

var int MIS_DS2P_AncientStonePlates;
const string TOPIC_DS2P_AncientStonePlates = "�������� �������� �������_AncientStonePlates";

	const string TOPIC_DS2P_AncientStonePlates_Start = "";

const int XP_MIS_AncientStonePlates = 0;

//===================================== ����� ��� ===============================================//
//������: �������
//������������: ���-��-���
//���������: �����, ���������� ��������
//�������: ������ ����


var int MIS_DS2P_QuirkyThief;
const string TOPIC_DS2P_QuirkyThief = "����� ���_QuirkyThief";

	const string TOPIC_DS2P_QuirkyThief_Start = "";

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

const int XP_MIS_QuirkyThief_Success = 0;	//������ ���-��-���� � ����� �� ����

//===================================== ������������ ������ ===============================================//
//������: �������
//������������: ����� ��-��-��
//���������: ����� ��-��-����, ������ ������, ���� ���-����� � ��-���, ��� ������ (�������-�������), ���������� ��������?
//�������: 1) �� ��������� � ����� ������� 2) ������ ���� ������� 3) ���� ��������� - �������� ������, 2 �������� ��������, 3 ������� �����



var int MIS_DS2P_FuriousAncestors;
const string TOPIC_DS2P_FuriousAncestors = "������������ ������_FuriousAncestors";

	const string TOPIC_DS2P_FuriousAncestors_Start = "";

const int XP_MIS_FuriousAncestors = 0;

//=====================================  ===============================================//
