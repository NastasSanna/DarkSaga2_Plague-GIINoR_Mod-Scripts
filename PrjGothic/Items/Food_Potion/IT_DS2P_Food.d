var int Fish_DS2P_Bonus_1;
const int HP_DS2P_Fish_1 = 50;	//���-�� �� � ���������
const int Value_DS2P_Fish_1 = 20;
instance ItFo_DS2P_FishSea_1(C_Item)
{
	name = "����"; description = "������� ����";
	mainflag = ITEM_KAT_FOOD;	flags = ITEM_MULTI;material = MAT_LEATHER;
	visual = "ItFo_DSG_FishSea.3DS";
	scemeName = "FOODHUGE";
	on_state[0] = Use_DS2P_FishSea;
	value = Value_DS2P_Fish_1;
	text[1] = "������ �� ���������";
	text[3] = NAME_Bonus_HP_DS;	count[3] = HP_DS2P_Fish_1;
	text[5] = NAME_Value;	count[5] = value;
};
instance ItFo_DS2P_FishSea_2(C_Item)
{
	name = "����"; description = "������� ����";
	mainflag = ITEM_KAT_FOOD;	flags = ITEM_MULTI;material = MAT_LEATHER;
	visual = "ItFo_DSG_FishSea_1.3DS";
	scemeName = "FOODHUGE";
	on_state[0] = Use_DS2P_FishSea;
	value = Value_DS2P_Fish_1;
	text[1] = "������ �� ���������";
	text[3] = NAME_Bonus_HP_DS;	count[3] = HP_DS2P_Fish_1;
	text[5] = NAME_Value;	count[5] = value;
};
func void Use_DS2P_FishSea()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]*HP_DS2P_Fish_1/100);
	if(self.id == 0)
	{
		Fish_DS2P_Bonus_1 += 1;
		if(Fish_DS2P_Bonus_1 == 40)
		{
			B_RaiseAttribute(self,ATR_STRENGTH,1);
			Snd_Play("LevelUp");
			Fish_DS2P_Bonus_1 = 0;
		};
	};
};
/*----------------------------------------------------------------------*/
// ��� �����
// ���� �����-�� ^�����^
/*----------------------------------------------------------------------*/
const int HP_DS2P_StewMaria = 10;
instance ItFo_DS2P_StewMaria(C_Item)
{
	name = "���"; description = "��� �����";
	mainflag = ITEM_KAT_FOOD;	flags = ITEM_MULTI;
	value = Value_Stew;
	visual = "ItFo_Stew.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_DS2P_StewMaria;	
	text[1] = NAME_Bonus_HPMax;
	count[1] = HP_DS2P_StewMaria;
	text[5] = NAME_Value;
	count[5] = Value_Stew;
};
func void Use_DS2P_StewMaria()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,HP_DS2P_StewMaria);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS2P_StewMaria);
};
/*----------------------------------------------------------------------*/
// ������� ��� ��������
// ��� ������������ � ������� ^����^��, ������ ����� �� ����������
/*----------------------------------------------------------------------*/
instance ItFo_DS2P_Booze_Zedd(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItFo_Booze.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	description = name;
	text[1] = "��� ������������ � ������";
};
/*----------------------------------------------------------------------*/
// ������� �� �������� (��� ^����^�)
// UNFINISHED
/*----------------------------------------------------------------------*/
const int Value_BullSeed	= 50;
const int Value_GobboSmile	= 50;
const int Value_Berserker	= 50;
const int Value_TrollBooze	= 50;
const int Value_MagicGrog	= 50;
const int Value_Kamikaze	= 50;

prototype ItFo_DS2P_BoozeProto(C_ITEM)
{
	mainflag = ITEM_KAT_FOOD;	flags = ITEM_MULTI;
	visual = "ItMi_Rum_02.3ds";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	text[5] = NAME_Value;
};
// ------------------------------------------------------
instance ItFo_DS2P_BullSeed(ItFo_DS2P_BoozeProto)
{
	name = "����� ����";	description = name;
	value = Value_BullSeed;
	on_state[0] = Use_BullSeed;
	count[5] = value;
};
func void Use_BullSeed()
{
	//�� 10 ����� ����������� ���� �� 10, �������� �� 20, ��������� �������� �� 10 � ���� �� 20
};
// ------------------------------------------------------
instance ItFo_DS2P_GobboSmile(ItFo_DS2P_BoozeProto)
{
	name = "������ �������";	description = name;
	value = Value_GobboSmile;
	on_state[0] = Use_GobboSmile;
	count[5] = value;
};
func void Use_GobboSmile()
{
	//�� 5 ����� ����������� �������� �� 10, �������� ����� �� 10%, ��������� ���� �� 10
};
// ------------------------------------------------------
instance ItFo_DS2P_Berserker(ItFo_DS2P_BoozeProto)
{
	name = "���������";	description = name;
	value = Value_Berserker;
	on_state[0] = Use_Berserker;
	count[5] = value;
};
func void Use_Berserker()
{
	//�� 5 ����� ��������� ������ �� ����� �� 10, ����������� �������� ���� ������� �� 15%
};
// ------------------------------------------------------
instance ItFo_DS2P_TrollBooze(ItFo_DS2P_BoozeProto)
{
	name = "��������� �����";	description = name;
	value = Value_TrollBooze;
	on_state[0] = Use_TrollBooze;
	count[5] = value;
};
func void Use_TrollBooze()
{
	//�� 10 ����� ����������� �������� �� 50, ������ �� ������ �� 10, ��������� �������� �� 10, �������� ����� ������� �� 15%
};
// ------------------------------------------------------
instance ItFo_DS2P_MagicGrog(ItFo_DS2P_BoozeProto)
{
	name = "���������� ����";	description = name;
	value = Value_MagicGrog;
	on_state[0] = Use_MagicGrog;
	count[5] = value;
};
func void Use_MagicGrog()
{
	//�� 10 ����� ����������� ����� �� 20, ��������� �������� �� 30.
};
// ------------------------------------------------------
instance ItFo_DS2P_Kamikaze(ItFo_DS2P_BoozeProto)
{
	name = "���������";	description = name;
	value = Value_Kamikaze;
	on_state[0] = Use_Kamikaze;
	count[5] = value;
};
func void Use_Kamikaze()
{
	//�� 5 ����� ����������� �������� ���� ������� �� 30%, ���� � �������� ���������� �� 5, �������� ������ �� 1.
};
/*----------------------------------------------------------------------*/
// ������ �������
// ��� ������ "��� � ����". �� �� ��������� ���������
// ����� ���� ������
/*----------------------------------------------------------------------*/
instance ItFo_DS2P_OrcBooze(C_Item)
{
	name = "������ �������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItFo_Booze.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_OrcBooze;
	description = name;
	text[1] = "������� ������� ��� �����";
};
var int Use_OrcBooze_Once;
func void Use_OrcBooze()
{
	//��� �������� ������
	if (self.guild <= GIL_SEPERATOR_HUM)
	{
		//������ �������� ��������
		if (self.attribute[ATR_HITPOINTS] >=  self.attribute[ATR_HITPOINTS_MAX] / 2)	{
			self.attribute[ATR_HITPOINTS] -= self.attribute[ATR_HITPOINTS_MAX] / 2;
			//� �� �����
			if (Npc_IsPlayer(self))	{
				Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
				// �������� ����� �������� �������
				if (!Use_OrcBooze_Once)	{
					Use_OrcBooze_Once = TRUE;
					B_GivePlayerXP(XP_Ambient);
				};
			};
		}
		else	{// ��� �� ������
			self.attribute[ATR_HITPOINTS] = 0;
		};
	};
	//�� ���� - ���������
	if (C_NpcIs(self, Orc_DS2P_ArTush))
	{
		ArTush_Healed = TRUE;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];	//�� ������
	};
};
