/******************************************************************************
------------------------------- �������� --------------------------------------
*******************************************************************************/

//--------------------------------------------------------------------------------
//--------------------------------------------	Value		Damage		Condition
//"����� ������" UNFINISHED ------------------------------------------------------
const int Value_Rw_DS2P_Crossbow_StarFlight		= 1200;
const int Damage_Rw_DS2P_Crossbow_StarFlight					= 120;
const int Condition_Rw_DS2P_Crossbow_StarFlight							= 120;
//--------------------------------------------------------------------------------
//--------------------------------------------	Value		Damage		Condition
//"���������� �������" UNFINISHED ------------------------------------------------
const int Value_Rw_DS2P_Crossbow_Karah = 10;
const int Damage_Rw_DS2P_Crossbow_Karah	 = 10;
const int Condition_Rw_DS2P_Crossbow_Karah = 10;

//=======================================================
//"����� ������" - ���� ������ �� ����� "������ ��������" 
// �����: �������
// UNFINISHED 
//=======================================================
instance ItRw_DS2P_Crossbow_StarFlight(ItRw_DS2P_Crossbow_Proto)
{
	name = "����� ������";	description = name;	//visual = "ItRw_Mil_Crossbow.mms";
	damageTotal = Damage_Rw_DS2P_Crossbow_StarFlight;
	cond_value[2] = Condition_Rw_DS2P_Crossbow_Proto;
	value = Value_Rw_DS2P_Crossbow_StarFlight;
	count[2] = damageTotal;	count[3] = cond_value[2];	count[5] = value;
};
//=======================================================
//"���������� �������" - ����� �����, � �������� ������ �� ������ "������� ��� ������"
// �����: � ������������ �� ���������� ����
// UNFINISHED 
//=======================================================
instance ItRw_DS2P_Crossbow_Karah(ItRw_DS2P_Crossbow_Proto)
{
	name = "���������� �������";	description = name;	//visual = "ItRw_Mil_Crossbow.mms"; ??
	damageTotal = Damage_Rw_DS2P_Crossbow_Karah;
	cond_value[2] = Condition_Rw_DS2P_Crossbow_Proto;
	value = Value_Rw_DS2P_Crossbow_Karah;
	count[2] = damageTotal;	count[3] = cond_value[2];	count[5] = value;
};