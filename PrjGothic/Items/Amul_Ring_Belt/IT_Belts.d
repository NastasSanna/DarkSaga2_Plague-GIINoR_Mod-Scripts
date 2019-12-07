
const int Value_ItBE_Addon_Leather_01 = 250;
const int Value_ItBE_Addon_Leather_02 = 250;
const int Value_ItBE_Addon_SLD_01 = 250;
const int Value_ItBE_Addon_NOV_01 = 250;
const int Value_ItBE_Addon_MIL_01 = 250;
const int Value_ItBE_Addon_KDF_01 = 250;
const int Value_ItBE_Addon_MC = 250;
const int Value_ItBE_Addon_STR_5 = 500;
const int Value_ItBE_Addon_STR_10 = 1000;
const int Value_ItBE_Addon_DEX_5 = 500;
const int Value_ItBE_Addon_DEX_10 = 1000;
const int Value_ItBE_Addon_Prot_Edge = 500;
const int Value_ItBE_Addon_Prot_Point = 500;
const int Value_ItBE_Addon_Prot_Magic = 500;
const int Value_ItBE_Addon_Prot_Fire = 500;
const int Value_ItBE_Addon_Prot_EdgPoi = 1000;
const int Value_ItBE_Addon_Prot_Total = 2000;
const int BA_Bonus01 = 5;
const int BA_Bonus02 = 5;
const int Belt_Prot_01 = 5;
const int BeltBonus_STR01 = 5;
const int BeltBonus_STR02 = 10;
const int BeltBonus_DEX01 = 5;
const int BeltBonus_DEX02 = 10;
const int BeltBonus_ProtEdge = 10;
const int BeltBonus_ProtPoint = 10;
const int BeltBonus_ProtMagic = 10;
const int BeltBonus_ProtFire = 10;
const int BeltBonus_ProtEdgPoi = 7;
const int BeltBonus_ProtTotal = 7;

/*��� ���������� � ������� ������*/
/*
ItMi_Belt_01.3ds - ��������: KETPALADIN.TGA ; 				-��� ���������
ItMi_Belt_02.3ds - ��������: HUM_KDFL_ARMOR_V0.TGA; 	-��� ����������� � ����� ����
ItMi_Belt_03.3ds - ��������: HUM_WACHE_V1.TGA; 				-��� ���������
ItMi_Belt_04.3ds - ��������: PALADIN.TGA; 							-������� ���������
ItMi_Belt_05.3ds - ��������: Hum_ORGS_ARMOR_V0.TGA; 	-��� ����� � ��������
ItMi_Belt_06.3ds - ��������: KNECHT.TGA; 							-�������, ��� ��������
ItMi_Belt_07.3ds - ��������: HUM_ORGM_ARMOR_V0.TGA; 	-��� ����� � ��������
ItMi_Belt_08.3ds - ��������: HUM_ORGL_ARMOR_V0.TGA; 	-��� ����� � ��������
ItMi_Belt_09.3ds - ��������: HUM_TPLS_ARMOR_V0.TGA; 	-��� ������-����������
ItMi_Belt_10.3ds - ��������: DRGH_V2.TGA; 							-��� ���
ItMi_Belt_11.3ds - ��������: HUM_WACHE_V2.TGA; 				-��� ���������
ItMi_DS2P_Belt_12.3ds - �����: Hum_KdfS.tga;						-��� ������ ����� ����
ItMi_DS2P_Belt_13.3ds - �����: Hum_DmbM_Armor_V0.tga;	-��� ����������� (�� ����� ��������)
ItMi_DS2P_Belt_14.3ds - �����: Hum_Dmc_Armor_V0.tga;		-��� ����������� (�� ����� ����������)
ItMi_DS2P_Belt_15.3ds - �����: Armor_Chaos.tga;				-��� ������� (�� ����� ������� �1)
ItMi_DS2P_Belt_16.3ds - �����: Armor_SLD_H.tga;				-��� ��������
ItMi_DS2P_Belt_17.3ds - �����: Hum_EbrM2_Armor_V0.tga;	-��� �������/������ ������ (�� ^������ �����������^)
*/

instance ItBE_Addon_Leather_01(ItBE_DS2P_Proto)
{
	value = Value_ItBE_Addon_Leather_01;
	visual = "ItMI_Belt_06.3ds";
	visual_skin = 0;
	on_equip = Equip_ItBE_Addon_Leather_01;
	on_unequip = UnEquip_ItBE_Addon_Leather_01;
	description = "������� ����";
	text[1] = NAME_Prot_Edge;	count[1] = Belt_Prot_01;
	text[2] = NAME_Prot_Point;	count[2] = Belt_Prot_01;
	text[3] = NAME_Addon_BeArLeather;	count[3] = BA_Bonus01;
	count[5] = value;
};
func void Equip_ItBE_Addon_Leather_01()
{
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, Belt_Prot_01);
	if(Npc_IsPlayer(self))
	{
		Leather01_Equipped = TRUE;
		if(LeatherArmor_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, BA_Bonus01);
			B_GiveBonusProt(self,PROT_DS_MAGIC | PROT_DS_FIRE, BA_Bonus02);
		};
	};
};

func void UnEquip_ItBE_Addon_Leather_01()
{
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -Belt_Prot_01);
	if(Npc_IsPlayer(self))
	{
		Leather01_Equipped = FALSE;
		if(LeatherArmor_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -BA_Bonus01);
			B_GiveBonusProt(self,PROT_DS_MAGIC | PROT_DS_FIRE, -BA_Bonus02);
		};
	};
};

instance ItBE_Addon_SLD_01(ItBE_DS2P_Proto)
{
	value = Value_ItBE_Addon_SLD_01;
	visual = "ItMi_Belt_05.3ds";	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBE_Addon_SLD_01;
	on_unequip = UnEquip_ItBE_Addon_SLD_01;
	description = "���� ��������";
	text[1] = NAME_Prot_Edge;	count[1] = Belt_Prot_01;
	text[2] = NAME_Prot_Point;	count[2] = Belt_Prot_01;
	text[3] = NAME_Addon_BeArSLD;	count[3] = BA_Bonus01;
	count[5] = value;
};
func void Equip_ItBE_Addon_SLD_01()
{
	SLD01_Equipped = TRUE;
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, Belt_Prot_01);
	if(SLDArmor_Equipped == TRUE)
	{
		B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, BA_Bonus01);
		B_GiveBonusProt(self,PROT_DS_MAGIC | PROT_DS_FIRE, BA_Bonus02);
	};
};

func void UnEquip_ItBE_Addon_SLD_01()
{
	SLD01_Equipped = FALSE;
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -Belt_Prot_01);
	if(SLDArmor_Equipped == TRUE)
	{
		B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -BA_Bonus01);
		B_GiveBonusProt(self,PROT_DS_MAGIC | PROT_DS_FIRE, -BA_Bonus02);
	};
};

instance ItBE_Addon_NOV_01(ItBE_DS2P_Proto)
{
	name = NAME_Addon_BeltMage;
	value = Value_ItBE_Addon_NOV_01;
	visual = "ItMi_Belt_02.3ds";	visual_skin = 0;
	on_equip = Equip_ItBE_Addon_NOV_01;
	on_unequip = UnEquip_ItBE_Addon_NOV_01;
	description = "����� ����������";
	text[1] = NAME_Prot_Edge;	count[1] = Belt_Prot_01;
	text[2] = NAME_Prot_Point;	count[2] = Belt_Prot_01;
	text[3] = NAME_Addon_BeArNOV;	count[3] = BA_Bonus01;
	count[5] = value;
};
func void Equip_ItBE_Addon_NOV_01()
{
	NOV01_Equipped = TRUE;
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, Belt_Prot_01);
	if(NOVArmor_Equipped == TRUE)
	{
		B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, BA_Bonus01);
		B_GiveBonusProt(self,PROT_DS_MAGIC | PROT_DS_FIRE, BA_Bonus02);
	};
};
func void UnEquip_ItBE_Addon_NOV_01()
{
	NOV01_Equipped = FALSE;
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -Belt_Prot_01);
	if(NOVArmor_Equipped == TRUE)
	{
		B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -BA_Bonus01);
		B_GiveBonusProt(self,PROT_DS_MAGIC | PROT_DS_FIRE, -BA_Bonus02);
	};
};

instance ItBE_Addon_MIL_01(ItBE_DS2P_Proto)
{
	value = Value_ItBE_Addon_MIL_01;
	visual = "ItMi_Belt_03.3ds";	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBE_Addon_MIL_01;
	on_unequip = UnEquip_ItBE_Addon_MIL_01;
	description = "���� ���������";
	text[1] = NAME_Prot_Edge;	count[1] = Belt_Prot_01;
	text[2] = NAME_Prot_Point;	count[2] = Belt_Prot_01;
	text[3] = NAME_Addon_BeArMIL;	count[3] = BA_Bonus01;
	count[5] = value;
};
func void Equip_ItBE_Addon_MIL_01()
{
	MIL01_Equipped = TRUE;
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, Belt_Prot_01);
	if(MILArmor_Equipped == TRUE)
	{
		B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, BA_Bonus01);
		B_GiveBonusProt(self,PROT_DS_MAGIC | PROT_DS_FIRE, BA_Bonus02);
	};
};

func void UnEquip_ItBE_Addon_MIL_01()
{
	MIL01_Equipped = FALSE;
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -Belt_Prot_01);
	if(MILArmor_Equipped == TRUE)
	{
		B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -BA_Bonus01);
		B_GiveBonusProt(self,PROT_DS_MAGIC | PROT_DS_FIRE, -BA_Bonus02);
	};
};

instance ItBE_Addon_KDF_01(C_Item)
{
	name = NAME_Addon_BeltMage;
	value = Value_ItBE_Addon_KDF_01;
	visual = "ItMi_Belt_02.3ds";	visual_skin = 0;
	on_equip = Equip_ItBE_Addon_KDF_01;
	on_unequip = UnEquip_ItBE_Addon_KDF_01;
	description = "����� ����";
	text[1] = NAME_Prot_Edge;	count[1] = Belt_Prot_01;
	text[2] = NAME_Prot_Point;	count[2] = Belt_Prot_01;
	text[3] = NAME_Addon_BeArKDF;	count[3] = BA_Bonus01;
	count[5] = value;
};
func void Equip_ItBE_Addon_KDF_01()
{
	KDF01_Equipped = TRUE;
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, Belt_Prot_01);
	if(KDFArmor_Equipped == TRUE)
	{
		B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, BA_Bonus01);
		B_GiveBonusProt(self,PROT_DS_MAGIC | PROT_DS_FIRE, BA_Bonus02);
	};
};
func void UnEquip_ItBE_Addon_KDF_01()
{
	KDF01_Equipped = FALSE;
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -Belt_Prot_01);
	if(KDFArmor_Equipped == TRUE)
	{
		B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -BA_Bonus01);
		B_GiveBonusProt(self,PROT_DS_MAGIC | PROT_DS_FIRE, -BA_Bonus02);
	};
};

instance ItBE_Addon_MC(ItBE_DS2P_Proto)
{
	value = Value_ItBE_Addon_MC;
	visual = "ItMi_Belt_08.3ds";	visual_skin = 0;
	material = MAT_WOOD;
	on_equip = Equip_ItBE_Addon_MC;
	on_unequip = UnEquip_ItBE_Addon_MC;
	description = "���� �� �������";
	text[1] = NAME_Prot_Edge;	count[1] = Belt_Prot_01;
	text[2] = NAME_Prot_Point;	count[2] = Belt_Prot_01;
	text[3] = NAME_Addon_BeArMC;	count[3] = BA_Bonus01;
	count[5] = value;
};
func void Equip_ItBE_Addon_MC()
{
	MC_Equipped = TRUE;
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, Belt_Prot_01);
	if(MCArmor_Equipped == TRUE)
	{
		B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, BA_Bonus01);
		B_GiveBonusProt(self,PROT_DS_MAGIC | PROT_DS_FIRE, BA_Bonus02);
	};
};
func void UnEquip_ItBE_Addon_MC()
{
	MC_Equipped = FALSE;
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -Belt_Prot_01);
	if(MCArmor_Equipped == TRUE)
	{
		B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -BA_Bonus01);
		B_GiveBonusProt(self,PROT_DS_MAGIC | PROT_DS_FIRE, -BA_Bonus02);
	};
};

instance ItBe_Addon_STR_5(ItBE_DS2P_Proto)
{
	value = Value_ItBE_Addon_STR_5;
	visual = "ItMi_Belt_08.3ds";	visual_skin = 0;
	on_equip = Equip_ItBe_Addon_STR_5;
	on_unequip = UnEquip_ItBe_Addon_STR_5;
	description = "���� ����";
	text[2] = NAME_Bonus_Str;	count[2] = BeltBonus_STR01;
	count[5] = value;
};
func void Equip_ItBe_Addon_STR_5()		{	Npc_ChangeAttribute(self,ATR_STRENGTH,BeltBonus_STR01);};
func void UnEquip_ItBe_Addon_STR_5()	{	Npc_ChangeAttribute(self,ATR_STRENGTH,-BeltBonus_STR01);};

instance ItBe_Addon_STR_10(ItBE_DS2P_Proto)
{
	value = Value_ItBE_Addon_STR_10;
	visual = "ItMi_Belt_05.3ds";	visual_skin = 0;
	on_equip = Equip_ItBe_Addon_STR_10;
	on_unequip = UnEquip_ItBe_Addon_STR_10;
	description = "���� ����";
	text[2] = NAME_Bonus_Str;	count[2] = BeltBonus_STR02;
	count[5] = value;
};
func void Equip_ItBe_Addon_STR_10()		{	Npc_ChangeAttribute(self,ATR_STRENGTH,BeltBonus_STR02);};
func void UnEquip_ItBe_Addon_STR_10()	{	Npc_ChangeAttribute(self,ATR_STRENGTH,-BeltBonus_STR02);};

instance ItBe_Addon_DEX_5(ItBE_DS2P_Proto)
{
	value = Value_ItBE_Addon_DEX_5;
	visual = "ItMi_Belt_08.3ds";	visual_skin = 0;
	on_equip = Equip_ItBe_Addon_DEX_5;
	on_unequip = UnEquip_ItBe_Addon_DEX_5;
	description = "���� ����������";
	text[2] = NAME_Bonus_Dex;	count[2] = BeltBonus_DEX01;
	count[5] = value;
};
func void Equip_ItBe_Addon_DEX_5()		{	Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX01);};
func void UnEquip_ItBe_Addon_DEX_5()	{	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX01);};

instance ItBe_Addon_DEX_10(ItBE_DS2P_Proto)
{
	value = Value_ItBE_Addon_DEX_10;
	visual = "ItMi_Belt_05.3ds";	visual_skin = 0;
	on_equip = Equip_ItBe_Addon_DEX_10;
	on_unequip = UnEquip_ItBe_Addon_DEX_10;
	description = "���� ��������";
	text[2] = NAME_Bonus_Dex;	count[2] = BeltBonus_DEX02;
	count[5] = value;
};
func void Equip_ItBe_Addon_DEX_10()		{	Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX02);};
func void UnEquip_ItBe_Addon_DEX_10()	{	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX02);};

instance ItBe_Addon_Prot_EDGE(ItBE_DS2P_Proto)
{
	value = Value_ItBE_Addon_Prot_Edge;
	visual = "ItMi_Belt_02.3ds";	visual_skin = 0;
	on_equip = Equip_ItBe_Addon_Prot_EDGE;
	on_unequip = UnEquip_ItBe_Addon_Prot_EDGE;
	description = "���� ������";
	text[2] = NAME_Prot_Edge;	count[2] = BeltBonus_ProtEdge;
	count[5] = value;
};
func void Equip_ItBe_Addon_Prot_EDGE()		{B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT, BeltBonus_ProtEdge);};
func void UnEquip_ItBe_Addon_Prot_EDGE()	{B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT, -BeltBonus_ProtEdge);};

instance ItBe_Addon_Prot_Point(ItBE_DS2P_Proto)
{
	value = Value_ItBE_Addon_Prot_Point;
	visual = "ItMi_Belt_02.3ds";	visual_skin = 0;
	on_equip = Equip_ItBe_Addon_Prot_Point;
	on_unequip = UnEquip_ItBe_Addon_Prot_Point;
	description = "���� ������";
	text[2] = NAME_Prot_Point;	count[2] = BeltBonus_ProtPoint;
	count[5] = value;
};
func void Equip_ItBe_Addon_Prot_Point()		{	B_GiveBonusProt(self,PROT_POINT,BeltBonus_ProtPoint);};
func void UnEquip_ItBe_Addon_Prot_Point()	{	B_GiveBonusProt(self,PROT_POINT,-BeltBonus_ProtPoint);};

instance ItBe_Addon_Prot_MAGIC(ItBE_DS2P_Proto)
{
	value = Value_ItBE_Addon_Prot_Magic;
	visual = "ItMi_Belt_02.3ds";	visual_skin = 0;
	on_equip = Equip_ItBe_Addon_Prot_MAGIC;
	on_unequip = UnEquip_ItBe_Addon_Prot_MAGIC;
	description = "���� ���������� ������";
	text[2] = NAME_Prot_Magic;	count[2] = BeltBonus_ProtMagic;
	count[5] = value;
};
func void Equip_ItBe_Addon_Prot_MAGIC()		{	B_GiveBonusProt(self,PROT_MAGIC,BeltBonus_ProtMagic);};
func void UnEquip_ItBe_Addon_Prot_MAGIC()	{	B_GiveBonusProt(self,PROT_MAGIC,-BeltBonus_ProtMagic);};

instance ItBe_Addon_Prot_FIRE(ItBE_DS2P_Proto)
{
	value = Value_ItBE_Addon_Prot_Fire;
	visual = "ItMi_Belt_02.3ds";	visual_skin = 0;
	on_equip = Equip_ItBe_Addon_Prot_FIRE;
	on_unequip = UnEquip_ItBe_Addon_Prot_FIRE;
	description = "���� ��������� ��������";
	text[2] = NAME_Prot_Fire;	count[2] = BeltBonus_ProtFire;
	count[5] = value;
};
func void Equip_ItBe_Addon_Prot_FIRE()		{	B_GiveBonusProt(self,PROT_FIRE,BeltBonus_ProtFire);};
func void UnEquip_ItBe_Addon_Prot_FIRE()	{	B_GiveBonusProt(self,PROT_FIRE,-BeltBonus_ProtFire);};

instance ItBe_Addon_Prot_EdgPoi(ItBE_DS2P_Proto)
{
	value = Value_ItBE_Addon_Prot_EdgPoi;
	visual = "ItMi_Belt_02.3ds";	visual_skin = 0;
	on_equip = Equip_ItBe_Addon_Prot_EdgPoi;
	on_unequip = UnEquip_ItBe_Addon_Prot_EdgPoi;
	description = "���� ������";
	text[2] = NAME_Prot_Edge;	count[2] = BeltBonus_ProtEdgPoi;
	text[3] = NAME_Prot_Point;	count[3] = BeltBonus_ProtEdgPoi;
	count[5] = value;
};
func void Equip_ItBe_Addon_Prot_EdgPoi(){
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, BeltBonus_ProtEdgPoi);
};
func void UnEquip_ItBe_Addon_Prot_EdgPoi(){
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -BeltBonus_ProtEdgPoi);
};

instance ItBe_Addon_Prot_TOTAL(ItBE_DS2P_Proto)
{
	value = Value_ItBE_Addon_Prot_Total;
	visual = "ItMi_Belt_02.3ds";	visual_skin = 0;
	on_equip = Equip_ItBe_Addon_Prot_TOTAL;
	on_unequip = UnEquip_ItBe_Addon_Prot_TOTAL;
	description = "���� ����������";
	text[1] = NAME_Prot_Edge;	count[1] = BeltBonus_ProtTotal;
	text[2] = NAME_Prot_Point;	count[2] = BeltBonus_ProtTotal;
	text[3] = NAME_Prot_Magic;	count[3] = BeltBonus_ProtTotal;
	text[4] = NAME_Prot_Fire;	count[4] = BeltBonus_ProtTotal;
	count[5] = value;
};
func void Equip_ItBe_Addon_Prot_TOTAL(){
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, BeltBonus_ProtTotal);
};
func void UnEquip_ItBe_Addon_Prot_TOTAL(){
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -BeltBonus_ProtTotal);
};

// ���� ������

instance ItBe_DS2P_PIR(ItBE_DS2P_Proto)
{
	value 			= Value_ItBE_Addon_Prot_EdgPoi;
	visual 			= "ItMi_Belt_02.3ds";	visual_skin = 0;
	on_equip 		= Equip_ItBE_ds_Ali;
	on_unequip 	= UnEquip_ItBE_ds_Ali;
	description = "���� ���";
	text[1] 		= NAME_DS_Prot_EdgeAndPoint;	count[1] 		= Belt_Prot_01;
	text[3] 		= NAME_DS_BeArPIR;	count[3] 		= BA_Bonus01;
	count[5] 		= value;
};
func void Equip_ItBE_ds_Ali()
{
	if(Npc_IsPlayer(self))
	{
		PIR_DS_Belt_ALI_Equipped = TRUE;
		B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, 5);
		if(PIR_DS_Armor_Equipped == TRUE)	{	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, 5);	};
	};	
};
func void UnEquip_ItBE_ds_Ali()
{
	if(Npc_IsPlayer(self))
	{
		PIR_DS_Belt_ALI_Equipped = FALSE;
		B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -5);
		if(PIR_DS_Armor_Equipped == TRUE)	{	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -5);};
	};
};

