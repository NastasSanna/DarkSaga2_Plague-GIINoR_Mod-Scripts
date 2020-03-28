const int PROT_DS_BLUNT = 1;
const int PROT_DS_EDGE = 2;
const int PROT_DS_POINT = 4;
const int PROT_DS_MAGIC = 8;
const int PROT_DS_FIRE = 16;

const int PROT_DS_ALLWEAPONS = PROT_DS_BLUNT | PROT_DS_EDGE | PROT_DS_POINT;
const int PROT_DS_ALL = PROT_DS_ALLWEAPONS | PROT_DS_MAGIC | PROT_DS_FIRE;



// �������� ������ �� ����� ����� ������������� => ������ � 0
// ����� ���������, ����� ����� ������������
var int HERO_PROT_Minus[PROT_INDEX_MAX];	//�� �������� ���� � AIVAR, �� �� �� �������

//NS - 31/07/2013
// PROT_TYPE - ������� �� Const.d
func void B_GiveBonusSingleProt(var C_NPC slf, var int PROT_TYPE, var int diff_bonus)
{
	var int prot;	prot = MEM_ReadStatArr(slf.protection,PROT_TYPE);	//������� ������
	if (Npc_IsPlayer(slf))
	{	//��� �� ���������, ��� �� ������������� ������
		var int prot_minus;	prot_minus = MEM_ReadStatArr(HERO_PROT_Minus,PROT_TYPE);	//���� �� �� �����
		if (prot + prot_minus + diff_bonus < 0)	{	//���� �������������
			MEM_WriteStatArr(HERO_PROT_Minus,PROT_TYPE,prot + prot_minus + diff_bonus);
			MEM_WriteStatArr(slf.protection,PROT_TYPE,0);
		}
		else	{	//���� �����������
			MEM_WriteStatArr(slf.protection,PROT_TYPE,prot + prot_minus + diff_bonus);
			MEM_WriteStatArr(HERO_PROT_Minus,PROT_TYPE,0);
		};
	}
	else
	{	//��������� ���������
		MEM_WriteStatArr(slf.protection,PROT_TYPE,prot + diff_bonus);	//������ �������� �������
		//���� ���������� ������������� ������ - ������ � 0
		if (MEM_ReadStatArr(slf.protection,PROT_TYPE) < 0)	{
			MEM_WriteStatArr(slf.protection,PROT_TYPE,0);
		};
	};
};

//NS - 31/07/2013 �������� ���������� �� ������ ������������� ������
//PROT_TYPE - �����, ����� ���� ������ ����������
func void B_GiveBonusProt(var C_NPC slf, var int PROT_TYPE, var int diff_bonus)
{
	// PROT_EDGE � PROT_BLUNT ���������� ������������
	if(((PROT_TYPE & PROT_DS_BLUNT) == PROT_DS_BLUNT) || ((PROT_TYPE & PROT_DS_EDGE) == PROT_DS_EDGE))
	{
		B_GiveBonusSingleProt(slf,PROT_BLUNT,diff_bonus);
		B_GiveBonusSingleProt(slf,PROT_EDGE,diff_bonus);
	};
	if((PROT_TYPE & PROT_DS_POINT) == PROT_DS_POINT)
	{
		B_GiveBonusSingleProt(slf,PROT_POINT,diff_bonus);
	};
	if((PROT_TYPE & PROT_DS_MAGIC) == PROT_DS_MAGIC)
	{
		B_GiveBonusSingleProt(slf,PROT_MAGIC,diff_bonus);
	};
	if((PROT_TYPE & PROT_DS_FIRE) == PROT_DS_FIRE)
	{
		B_GiveBonusSingleProt(slf,PROT_FIRE,diff_bonus);
	};
};
