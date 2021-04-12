const int Value_ItMw_DS2P_BeliarHorror = 3000;
const int Damage_ItMw_DS2P_BeliarHorror = 100;
const int Range_ItMw_DS2P_BeliarHorror = 90;
const int Cond_ItMw_DS2P_BeliarHorror_STR = 65;
instance ItMw_DS2P_BeliarHorror(ItMw_1H_Sword)
{
	name = "������";
	value = Value_ItMw_DS2P_BeliarHorror;
	damageTotal = Damage_ItMw_DS2P_BeliarHorror;
	range = Range_ItMw_DS2P_BeliarHorror;
	cond_value[2] = Cond_ItMw_DS2P_BeliarHorror_STR;		//������� �� ����
	visual = "ItMw_DS_Sword_05.3DS";
	description = "���� �������";
	count[2] = damageTotal;			//����
	count[3] = cond_value[2];	//������� �� ����
	count[5] = value;						//����
};

const int Value_ItMw_DS2P_FlameOfRevenge = 2000;
const int Damage_ItMw_DS2P_FlameOfRevenge = 120;
const int Range_ItMw_DS2P_FlameOfRevenge = 155;
const int Cond_ItMw_DS2P_FlameOfRevenge_STR = 115;
instance ItMw_DS2P_FlameOfRevenge(ItMw_2H_Sword)
{
	name = "������";	description = "����� �����";	visual = "ItMw_DS_Sword_06.3DS";
	value = Value_ItMw_DS2P_FlameOfRevenge;
	damageTotal = Damage_ItMw_DS2P_FlameOfRevenge;
	range = Range_ItMw_DS2P_FlameOfRevenge;
	cond_value[2] = Cond_ItMw_DS2P_FlameOfRevenge_STR;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
//=========================
//"���� ������" - �����������, ���� ��� �� ����� "� ������� ��������" 
// UNFINISHED ������, ����������
//==================
instance ItMw_DS2P_ViperSting(ItMw_1H_Sword)
{
	name = "���� ������";	description = name;	visual = "Itmw_005_1h_dagger_01.3DS";
	value = Value_VLKDolch;
	damageTotal = Damage_VLKDolch;
	range = Range_VLKDolch;
	cond_value[2] = Condition_VLKDolch;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
//=========================
//"��� ������" - ���� ��-��-���� �� ����� "������ ��� ��������� 
// UNFINISHED ������
// ��� ����������, ������� ������� �� ��������, � �� ����
//==================
const int Value_ItMw_DS2P_1H_GurunSword = 900;
const int Damage_ItMw_DS2P_1H_GurunSword = 100;
const int Range_ItMw_DS2P_1H_GurunSword = 90;
const int Cond_ItMw_DS2P_1H_GurunSword_DEX = 90;

instance ItMw_DS2P_1H_GurunSword(ItMw_1H_Sword)
{
	name = "��� ������";	description = name;	visual = "ItMw_030_1h_PAL_Sword_02.3DS";
	damageTotal = Damage_ItMw_DS2P_1H_GurunSword;
	range = Range_ItMw_DS2P_1H_GurunSword;
	
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Cond_ItMw_DS2P_1H_GurunSword_DEX;
	count[2] = damageTotal;
	
	value = Value_ItMw_DS2P_1H_GurunSword;
	count[3] = cond_value[2];
	count[5] = value;
};
//=========================
//"���������� �������" - ������������� ������ ��� ���� �� �� ������ "������ ����� ��� �������"
// UNFINISHED ������, ��������������
//==================
const int Value_ItMw_DS2P_2H_JosephAxe = 900;
const int Damage_ItMw_DS2P_2H_JosephAxe = 100;
const int Range_ItMw_DS2P_2H_JosephAxe = 90;
const int Cond_ItMw_DS2P_2H_JosephAxe = 90;

instance ItMw_DS2P_2H_JosephAxe(ItMw_1H_Sword)
{
	name = "���������� �������";	description = name;	visual = "ItMw_030_1h_PAL_Sword_02.3DS";
	damageTotal = Damage_ItMw_DS2P_2H_JosephAxe;
	range = Range_ItMw_DS2P_2H_JosephAxe;
	
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Cond_ItMw_DS2P_2H_JosephAxe;
	count[2] = damageTotal;
	
	value = Value_ItMw_DS2P_2H_JosephAxe;
	count[3] = cond_value[2];
	count[5] = value;
};
//=========================
//"������ ������"
//=========================
const int Value_ItMw_DSP_WeaverSword = 500;
const int Damage_ItMw_DSP_WeaverSword = 70;
const int Range_ItMw_DSP_WeaverSword = 75;
const int Cond_ItMw_DSP_WeaverSword = 65;

instance ItMw_DSP_WeaverSword(ItMw_1H_Sword)
{
	flags = ITEM_MISSION;
	name = "������ ������";
	description = name;
	visual = "ItMw_DS_Sword_03.3DS";
	text[1] = "������ � �������, ��� ������� ������.";
	
	damageTotal = Damage_ItMw_DSP_WeaverSword;
	range = Range_ItMw_DSP_WeaverSword;
	count[2] = damageTotal;
	
	cond_value[2] = Cond_ItMw_DSP_WeaverSword;
	count[3] = cond_value[2];
	
	value = 150;
	count[5] = value;
	
	on_equip 				= Equip_ItMw_DSP_WeaverSword;
	on_unequip 				= UnEquip_ItMw_DSP_WeaverSword;
};
func void Equip_ItMw_DSP_WeaverSword()
{
	Bonus_WeaverSword_Equipped = TRUE;
	GiveBonus_WeaverComplect();
};
func void UnEquip_ItMw_DSP_WeaverSword()
{
	Bonus_WeaverSword_Equipped = FALSE;
	GiveBonus_WeaverComplect();
};

//=========================
//"����� ���-������"
//=========================
const int Bonus_RakTarakAxe = 5;
instance ItMw_DSP_RakTarakAxe(C_Item)
{
	name = "����� ���-������";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = 400;
	damageTotal = 155;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 150;
	cond_value[2] = Condition_ds_AngerOrk;
	visual = "ItMw_DS_OrcAxe_02.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_ADDON_BONUS_2H;
	count[3] = Bonus_RakTarakAxe;
	text[4] = NAME_TalentOrcWeapon_needed;
	text[5] = NAME_Value;
	count[5] = value;
};
func void Equip_ItMw_DSP_RakTarakAxe()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_2H,Bonus_RakTarakAxe);
	};
	S_Topor_ds_Orks_01();
};
func void UnEquip_ItMw_DSP_RakTarakAxe()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_2H,-Bonus_RakTarakAxe);
	};
	S_Topor_ds_Orks_02();
};
