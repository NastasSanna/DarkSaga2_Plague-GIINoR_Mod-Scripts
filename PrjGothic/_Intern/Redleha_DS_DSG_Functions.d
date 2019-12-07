//----------------------------------------------------------------------------
/*���� �������� ����� �������, ��������� ���� � ������� ������ ������������*/
/*�������� �� ����������, �� ���� �������������� ����� � ��������*/
//----------------------------------------------------------------------------

/* ������� ����������� ���� ����� � ������. ���� ����, �� ����� � ������� ��������.
���������� ���� ���, ��������� ���� ����� ���������.

void B_ds_ResetBelts(var C_NPC her)
*/

/*
������� ���������� �������������� ������ ��� �������� � �������. ����������, ������� ����� ���� ���������,
����� �� ������� ������.
�������� �� ������ ������: "$text �����: XXX ����." 
������: b_build_trdString("(������� �������� ��������)",ItPl_Health_Herb_02)

string b_build_trdString(var string text, var int itemInstance)
*/

/*
��������� ������ ��� ����������� � ������� �������� ���������������.
string b_Ds_buildString_TeachPayment_Attr(var C_NPC her, var string text, var int attribut, var int points)

��������� ������ ��� ����������� � ������� �������� ��������
string b_Ds_buildString_TeachPayment_Talent(var C_NPC her, var string text, var int talent, var int points, var int Value_force)
*/

/*
������� �� ������, ���� ��� ����� ������ � ��� self
void B_DS_ClearGold()
void B_DS_ClearNugget()
void B_DS_ClearGoldNugget()
*/

/*
����������� ������ ������ �������� ������� ��� slf �� diff_bonus. ������������ � ��������� �������.
������: 
B_DS_GiveBonusFightSkill(self,NPC_DS_TALENT_1H | NPC_DS_TALENT_2H | NPC_DS_TALENT_BOW | NPC_DS_TALENT_CROSSBOW, 5);

void B_DS_GiveBonusFightSkill(var C_NPC slf, var int NPC_TALENT_TYPE, var int diff_bonus)
*/

/*
����������� ������ ��� slf �� diff_bonus. �������������� � �������� � � ������� �� ������.
������: 
B_DS_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, BA_Bonus01);
B_DS_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -BA_Bonus01);

void B_DS_GiveBonusProt(var C_NPC slf, var int PROT_TYPE, var int diff_bonus)
*/

/*
������ �� ����� �������. ������� ��� ���������� ������ ��� ���������� � ������� � ��(��-)������ ������.
������:
B_DSG_Log_OpenClose(TOPIC_WINEBOTTLE,LOG_MISSION,LOG_Running,"���� �������� �������� ��� ������� ����.");
B_DSG_Log_OpenClose(TOPIC_WINEBOTTLE,LOG_MISSION,LOG_SUCCESS,"���� �� ����������� ������ ��� ��������.");
B_DSG_Log_OpenClose(TOPIC_ARENA01,LOG_MISSION,LOG_Running,"");
B_DSG_Log_OpenClose(TOPIC_TEACHERINMINE,LOG_NOTE,-1,"����� ����� �������� ��� ����� ������� ����.");

void B_DSG_Log_OpenClose(var string topic,var int log_type,var int log_status,var string topictext)
----------------------------------------------------------------------------------------------------------------

� ���������� - ���������� � ���������� �������.
���������� ��� �������������� ������, ���� ����������� ������. ����� ������ ������������ ������� ������:
- ������ - ����� ����, 
- ������ - ���������� ������ � ����� ��� � ������ ����� ����������
- ������� - ��������
��� ����������� ������ ���������� ����� �� Y-���������� ����� (���� ����� ��������, ������ ����� �������)
void B_ds_LogEntry(var string topic, var int log_type, var int status, var string entry)
*/

/*
������ �������� ���� ��� self
void B_ds_UseFakeRune()

������ ��������� ������ � ������� ������� time
void b_usefakescrolltime(var float time)

������ �������� �����
void b_usefakebook()
*/

//---------------------------------------------------------------------
/*
int C_Npc_DS_HasItems(var C_NPC owner, var int itemInstance, var int amount)

���������� TRUE, ���� owner ����� itemInstance � ���-�� amount
*/

/*
int C_Npc_DS_HasItems_Scr(var C_NPC owner, var int itemInstance, var int amount, var int dS_PosY, var int boolShowOnScreen)

���������� TRUE,���� owner ����� itemInstance � ���-�� amount
��������� ����� �� ����� � ���-�� � ��������� � ���������� � �����������: ����/����������
������:
if(C_Npc_DS_HasItems_Scr(hero,ItPl_SwampHerb,1,YPos_3,true) && C_Npc_DS_HasItems_Scr(hero,ItPl_Beet,2,YPos_5,true)
-------------------------------------------------------------------------------------------------

void Print_DS_Npc_HasItems(var C_NPC owner, var int itemInstance, var int dS_PosY)

������� �� ����� ���-�� ������ � ���������
*/

/*
int C_Npc_GetDistToWP(var C_NPC pointMan, var string waypoint, var int Dist, var int MoreOrLess)
���������� TRUE, ���� ���������� �� pointMan �� waypoint <> Dist (> - More; < - Less). 

int C_Npc_GetDistToNpc(var C_NPC pointMan, var C_NPC targetMan, var int Dist, var int MoreOrLess)
���������� TRUE, ���� ���������� �� pointMan �� targetMan <> Dist (> - More; < - Less). 
*/

/*
int C_DS_GiveInvItems(var C_Npc giver,var int itemInstance,var int amount)
������� �������� ������� �� ������� ���������

int B_GiveInvItem_red(var C_Npc giver, var C_Npc taker, var int itemInstance, var int amount, var int screenprocent)
������� �������� �������� � ��������� �� ������� � �������� Y-���������� ������

int B_DS_GiveRemoveItems(var C_Npc giver, var C_Npc taker, var int itemInstance, var int amount)
�������� � �������� ������ �� ��������� ��������:

int B_DS_GiveRemoveItems_Red(var C_Npc giver, var C_Npc taker, var int itemInstance, var int amount, var int screenproc)
�������� � �������� ������ �� ��������� �������� c ��������� Y-���������� �� ������
*/

/*
������� ���������� ���������� ������ ������� ��� slf, � �� ��������� � ������� void B_SetFightSkills(var C_Npc slf,var int percent)
void B_DS_SetFightSkills(var C_Npc slf,var int percent)
*/

/*
��������� ��������� ���������� � ����������� �� ������ ���������
������: B_DS_SetMst_Attribute(cMst_Default_Pyranha);
void B_DS_SetMst_Attribute(var int Monster)
*/
var int temp_222;
